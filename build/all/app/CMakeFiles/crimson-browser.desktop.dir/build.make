# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.22

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Disable VCS-based implicit rules.
% : %,v

# Disable VCS-based implicit rules.
% : RCS/%

# Disable VCS-based implicit rules.
% : RCS/%,v

# Disable VCS-based implicit rules.
% : SCCS/s.%

# Disable VCS-based implicit rules.
% : s.%

.SUFFIXES: .hpux_make_needs_suffix_list

# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /opt/cmake/bin/cmake

# The command to remove a file.
RM = /opt/cmake/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/cohen/Documents/UT_Apps/CrimsonBrowser

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/cohen/Documents/UT_Apps/CrimsonBrowser/build/all/app

# Utility rule file for crimson-browser.desktop.

# Include any custom commands dependencies for this target.
include CMakeFiles/crimson-browser.desktop.dir/compiler_depend.make

# Include the progress variables for this target.
include CMakeFiles/crimson-browser.desktop.dir/progress.make

CMakeFiles/crimson-browser.desktop:
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/cohen/Documents/UT_Apps/CrimsonBrowser/build/all/app/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Merging translations into crimson-browser.desktop..."
	LC_ALL=C /usr/bin/intltool-merge -d -u /home/cohen/Documents/UT_Apps/CrimsonBrowser/po /home/cohen/Documents/UT_Apps/CrimsonBrowser/crimson-browser.desktop.in crimson-browser.desktop
	sed -i 's/crimson-browser-//g' /home/cohen/Documents/UT_Apps/CrimsonBrowser/build/all/app/crimson-browser.desktop

crimson-browser.desktop: CMakeFiles/crimson-browser.desktop
crimson-browser.desktop: CMakeFiles/crimson-browser.desktop.dir/build.make
.PHONY : crimson-browser.desktop

# Rule to build all files generated by this target.
CMakeFiles/crimson-browser.desktop.dir/build: crimson-browser.desktop
.PHONY : CMakeFiles/crimson-browser.desktop.dir/build

CMakeFiles/crimson-browser.desktop.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/crimson-browser.desktop.dir/cmake_clean.cmake
.PHONY : CMakeFiles/crimson-browser.desktop.dir/clean

CMakeFiles/crimson-browser.desktop.dir/depend:
	cd /home/cohen/Documents/UT_Apps/CrimsonBrowser/build/all/app && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/cohen/Documents/UT_Apps/CrimsonBrowser /home/cohen/Documents/UT_Apps/CrimsonBrowser /home/cohen/Documents/UT_Apps/CrimsonBrowser/build/all/app /home/cohen/Documents/UT_Apps/CrimsonBrowser/build/all/app /home/cohen/Documents/UT_Apps/CrimsonBrowser/build/all/app/CMakeFiles/crimson-browser.desktop.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/crimson-browser.desktop.dir/depend

