# 1. Set the minimum required CMake version
cmake_minimum_required(VERSION 3.25)

# 2. Define the project name and programming language
project(templateRepo LANGUAGES CXX)

find_package(cppzmq CONFIG REQUIRED)

set(CMAKE_CXX_STANDARD 20)
# 3. Create client
add_executable(test_client source/client_test/clientMain.cpp)

target_link_libraries(test_client
    PRIVATE
        cppzmq)

# 4. Create server

add_executable(test_server source/server_test/serverMain.cpp)

target_link_libraries(test_server
    PRIVATE
        cppzmq)