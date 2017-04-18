cmake_minimum_required(VERSION 3.5)

project(rclobjc_examples C CXX)

find_package(ament_cmake REQUIRED)
find_package(example_interfaces REQUIRED)
find_package(rcl REQUIRED)
find_package(rmw REQUIRED)
find_package(rmw_implementation_cmake REQUIRED)
find_package(std_msgs REQUIRED)
find_package(rclobjc REQUIRED)

function(add_objc_executable target_name source_file)
  add_executable(${target_name} ${source_file})

  set_target_properties(${target_name} PROPERTIES LINKER_LANGUAGE CXX)
  target_link_libraries(${target_name} "-framework Cocoa")

  ament_target_dependencies(${target_name}
    "rcl"
    "rclobjc"
    "std_msgs"
    "example_interfaces")

  install(TARGETS ${target_name}
    DESTINATION bin)
endfunction()

add_objc_executable(ROSTalker src/ROSTalker.m)
add_objc_executable(ROSListener src/ROSListener.m)
add_objc_executable(ROSAddTwoIntsService src/ROSAddTwoIntsService.m)
add_objc_executable(ROSAddTwoIntsClientAsync src/ROSAddTwoIntsClientAsync.m)

if(BUILD_TESTING)
  find_package(ament_lint_auto REQUIRED)
  ament_lint_auto_find_test_dependencies()
endif()

ament_package()
