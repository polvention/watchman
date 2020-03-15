cmake_minimum_required(VERSION 3.16)

project(watchman)

set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED True)

set(COMPILE_FLAGS -Werror -Wall -Wextra -pedantic)

set(CLANG_TIDY_FLAGS "clang-tidy;
    -header-filter=${PROJECT_SOURCE_DIR}/libusb/libusb/libusb.h ;
    -checks=modernize-*,readability-*,performance-*;"
    )

set(GTEST_PATH ${PROJECT_SOURCE_DIR}/tests/)
set(LIBUSB_DIR ${PROJECT_SOURCE_DIR}/libusb)

add_subdirectory(libusb-cpp)
#add_subdirectory(android_libwatchman)

set(src main.cpp)

add_executable(watchman ${src})

target_link_libraries(watchman
    libusb
    #    libwatchman
    )

target_compile_options(watchman PRIVATE ${COMPILE_FLAGS})

#set_target_properties(
#    watchman PROPERTIES
#    CXX_CLANG_TIDY "${CLANG_TIDY_FLAGS};${src}"
#)
