# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.10

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/alberto/oprecomp/flexfloat

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/alberto/oprecomp/flexfloat/build

# Include any dependencies generated for this target.
include test/CMakeFiles/ieee_helper.dir/depend.make

# Include the progress variables for this target.
include test/CMakeFiles/ieee_helper.dir/progress.make

# Include the compile flags for this target's objects.
include test/CMakeFiles/ieee_helper.dir/flags.make

test/CMakeFiles/ieee_helper.dir/IEEEHelper.cpp.o: test/CMakeFiles/ieee_helper.dir/flags.make
test/CMakeFiles/ieee_helper.dir/IEEEHelper.cpp.o: ../test/IEEEHelper.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/alberto/oprecomp/flexfloat/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object test/CMakeFiles/ieee_helper.dir/IEEEHelper.cpp.o"
	cd /home/alberto/oprecomp/flexfloat/build/test && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/ieee_helper.dir/IEEEHelper.cpp.o -c /home/alberto/oprecomp/flexfloat/test/IEEEHelper.cpp

test/CMakeFiles/ieee_helper.dir/IEEEHelper.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/ieee_helper.dir/IEEEHelper.cpp.i"
	cd /home/alberto/oprecomp/flexfloat/build/test && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/alberto/oprecomp/flexfloat/test/IEEEHelper.cpp > CMakeFiles/ieee_helper.dir/IEEEHelper.cpp.i

test/CMakeFiles/ieee_helper.dir/IEEEHelper.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/ieee_helper.dir/IEEEHelper.cpp.s"
	cd /home/alberto/oprecomp/flexfloat/build/test && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/alberto/oprecomp/flexfloat/test/IEEEHelper.cpp -o CMakeFiles/ieee_helper.dir/IEEEHelper.cpp.s

test/CMakeFiles/ieee_helper.dir/IEEEHelper.cpp.o.requires:

.PHONY : test/CMakeFiles/ieee_helper.dir/IEEEHelper.cpp.o.requires

test/CMakeFiles/ieee_helper.dir/IEEEHelper.cpp.o.provides: test/CMakeFiles/ieee_helper.dir/IEEEHelper.cpp.o.requires
	$(MAKE) -f test/CMakeFiles/ieee_helper.dir/build.make test/CMakeFiles/ieee_helper.dir/IEEEHelper.cpp.o.provides.build
.PHONY : test/CMakeFiles/ieee_helper.dir/IEEEHelper.cpp.o.provides

test/CMakeFiles/ieee_helper.dir/IEEEHelper.cpp.o.provides.build: test/CMakeFiles/ieee_helper.dir/IEEEHelper.cpp.o


# Object files for target ieee_helper
ieee_helper_OBJECTS = \
"CMakeFiles/ieee_helper.dir/IEEEHelper.cpp.o"

# External object files for target ieee_helper
ieee_helper_EXTERNAL_OBJECTS =

test/libieee_helper.a: test/CMakeFiles/ieee_helper.dir/IEEEHelper.cpp.o
test/libieee_helper.a: test/CMakeFiles/ieee_helper.dir/build.make
test/libieee_helper.a: test/CMakeFiles/ieee_helper.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/alberto/oprecomp/flexfloat/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX static library libieee_helper.a"
	cd /home/alberto/oprecomp/flexfloat/build/test && $(CMAKE_COMMAND) -P CMakeFiles/ieee_helper.dir/cmake_clean_target.cmake
	cd /home/alberto/oprecomp/flexfloat/build/test && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/ieee_helper.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
test/CMakeFiles/ieee_helper.dir/build: test/libieee_helper.a

.PHONY : test/CMakeFiles/ieee_helper.dir/build

test/CMakeFiles/ieee_helper.dir/requires: test/CMakeFiles/ieee_helper.dir/IEEEHelper.cpp.o.requires

.PHONY : test/CMakeFiles/ieee_helper.dir/requires

test/CMakeFiles/ieee_helper.dir/clean:
	cd /home/alberto/oprecomp/flexfloat/build/test && $(CMAKE_COMMAND) -P CMakeFiles/ieee_helper.dir/cmake_clean.cmake
.PHONY : test/CMakeFiles/ieee_helper.dir/clean

test/CMakeFiles/ieee_helper.dir/depend:
	cd /home/alberto/oprecomp/flexfloat/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/alberto/oprecomp/flexfloat /home/alberto/oprecomp/flexfloat/test /home/alberto/oprecomp/flexfloat/build /home/alberto/oprecomp/flexfloat/build/test /home/alberto/oprecomp/flexfloat/build/test/CMakeFiles/ieee_helper.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : test/CMakeFiles/ieee_helper.dir/depend

