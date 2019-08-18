#!/usr/bin/python

import warnings

warnings.filterwarnings('ignore')

import sys
import os

from stopwatch import Stopwatch

import argsmanaging as am
import benchmarks
import training

os.environ['TF_CPP_MIN_LOG_LEVEL'] = '2'

DEBUG = True


def main(argv):

    stop_w = Stopwatch()

    # ArgumentsHolder containing all legal initialization params.
    args = am.handle_args(argv)
    if DEBUG:
        print(args)
        print("============================================\n")

    # Benchmarks information. Contains a relational graph among variables inside the benchmark program and the number
    # of them.
    stop_w.start()
    bm = benchmarks.get_benchmark(args.benchmark)
    bm.get_graph()
    _, t = stop_w.stop()
    print("{} loaded in {}s ({} variables)".format(bm.get__name(), t, bm.get_vars_number()))

    # Build training set, test set for a new training session
    stop_w.start()
    session = training.create_training_session(args, bm, set_size=900)
    _, t = stop_w.stop()
    print("Created first training session from dataset #{} in {}s ({} entries for training, {} for test)"
          .format(args.datasetIndex, t, len(session.get_training_set()), len(session.get_test_set())))

    # Train a regressor network
    stop_w.start()
    model, stats = training.regressor_trainings[args.regressor](args, bm, session)
    _, t = stop_w.stop()
    print("Trained the regressor network in {}s (MAE {})".format(t, stats['MAE']))

    # TODO Create classifier 	<- Ditto
    # TODO Create a MP model
    # TODO solve optimization problem
    # TODO FINAL CHECK BEING... who knows


'''
Entry point. Call to main function if this is main module.
'''
if __name__ == '__main__':
    main(sys.argv[1:])
