add_subdirectory(${GTEST_PATH}googletest)
enable_testing()
include_directories(${gtest_SOURCE_DIR}/include ${gtest_SOURCE_DIR})

set(src
    tests.cpp
    )

add_executable(libusb_test ${src})

target_link_libraries(libusb_test
    libusb
    gtest
    gtest_main
    )
