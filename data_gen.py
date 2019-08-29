#!/usr/bin/python

import argsmanaging
import benchmarks
import training

import pandas
import numpy


class ExamplesGenerator:
    def __init__(self, config, inferred, error, cls, unique_weight):
        self.__config = config
        self.__inferred = inferred
        self.__class = cls
        self.__error = error
        self.__weight = unique_weight

    def __len__(self):
        return len(self.__inferred) + 1

    def get_data_frame(self):
        configs = self.__inferred + [self.__config]
        return pandas.DataFrame.from_dict({'var_{}'.format(i):
                                               [configs[j][i] for j in range(len(configs))]
                                           for i in range(len(configs[0]))})

    def get_regressor_target(self, single=False):
        return pandas.Series([self.__error] * (1 if single else len(self)))

    def get_classifier_target(self, single=False):
        return pandas.Series([self.__class] * (1 if single else len(self)))

    def get_weights(self, single=False):
        return [self.__weight] * (1 if single else len(self))


def __change_single_value(v, min_b, max_b, change_p=.3):
    p = numpy.random.random()
    if p <= change_p:
        v = int(numpy.clip(v + numpy.floor(numpy.random.normal(scale=2)), min_b, max_b))
    return v


def __find_neighbours(solution, min_b, max_b, iterations):
    n = []
    for _ in range(iterations):
        n.append([__change_single_value(solution[i], min_b, max_b) for i in range(len(solution))])

    # Remove doubles
    n = sorted(n)
    return [n[i] for i in range(len(n)) if i == 0 or n[i] != n[i-1]]


def infer_examples(args: argsmanaging.ArgumentsHolder, bm: benchmarks.Benchmark, it):
    dif_target = 1 / (it.get_error_log() - args.get_error_log())
    new_ex_weight = dif_target
    if dif_target <= 0:
        new_ex_weight = 0.01
    elif dif_target > 2:
        new_ex_weight = 1

    neighbours = __find_neighbours(it.get_config(), args.get_min_bits_number(), args.get_max_bits_number(), 8)
    return ExamplesGenerator(it.get_config(), neighbours, it.get_error_log(), it.get_error_class(), new_ex_weight)


def ml_refinement(args: argsmanaging.ArgumentsHolder, bm: benchmarks.Benchmark, regressor, classifier,
                  session: training.TrainingSession, examples: ExamplesGenerator):
    regr_target_label = 'reg'
    class_target_label = 'cls'

    df = examples.get_data_frame()
    df[regr_target_label] = examples.get_regressor_target()
    df[class_target_label] = examples.get_classifier_target()

    train = session.get_training_set()
    train[regr_target_label] = session.get_regressor_target().values
    train[class_target_label] = session.get_classifier_target().values
    train = pandas.concat([train, df])

    test = session.get_test_set()
    test[regr_target_label] = session.get_test_regressor().values
    test[class_target_label] = session.get_test_classifier().values

    weights = numpy.asarray(examples.get_weights())
    single_session = training.TrainingSession(df, test.copy(), regr_target_label, class_target_label)
    trainer = training.RegressorTrainer.create_for(args.get_regressor(), single_session)
    b_size = len(df)
    trainer.train_regressor(regressor, batch_size=b_size, weights=weights, verbose=False)
    r_stats = trainer.test_regressor(args, bm, regressor)

    session = training.TrainingSession(train, test, regr_target_label, class_target_label)
    trainer = training.ClassifierTrainer.create_for(args.get_classifier(), session)
    trainer.train_classifier(classifier)
    c_stats = trainer.test_classifier(args, bm, classifier)
    return session, r_stats, c_stats
