cmake_minimum_required(VERSION 3.0.0)
project(sign-lang VERSION 0.1.0)

set(OpenCV_DIR ${PROJECT_DIR}/includes/install/lib/cmake/opencv4)
find_package( OpenCV REQUIRED )

add_executable(sign-lang main.cpp)

target_link_libraries(sign-lang ${OpenCV_LIBS} )
