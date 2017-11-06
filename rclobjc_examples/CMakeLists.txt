cmake_minimum_required(VERSION 3.5)

project(rclobjc_examples C CXX)

find_package(ament_cmake REQUIRED)
find_package(rclobjc_common REQUIRED)
find_package(rclobjc REQUIRED)
find_package(example_interfaces REQUIRED)
find_package(std_msgs REQUIRED)
include(UseObjectiveC)

add_objc_executable(ROSTalker src/ROSTalker.m)
ament_target_dependencies(ROSTalker
  "rclobjc"
  "std_msgs")

add_objc_executable(ROSListener src/ROSListener.m)
ament_target_dependencies(ROSListener
  "rclobjc"
  "std_msgs")

add_objc_executable(ROSAddTwoIntsService src/ROSAddTwoIntsService.m)
ament_target_dependencies(ROSAddTwoIntsService
  "rclobjc"
  "std_msgs"
  "example_interfaces")

add_objc_executable(ROSAddTwoIntsClientAsync src/ROSAddTwoIntsClientAsync.m)
ament_target_dependencies(ROSAddTwoIntsClientAsync
  "rclobjc"
  "std_msgs"
  "example_interfaces")

install(TARGETS
  ROSTalker
  ROSListener
  ROSAddTwoIntsService
  ROSAddTwoIntsClientAsync
  DESTINATION lib/${PROJECT_NAME}
)

if(BUILD_TESTING)
  find_package(ament_lint_auto REQUIRED)
  ament_lint_auto_find_test_dependencies()
endif()

ament_package()
