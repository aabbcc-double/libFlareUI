cmake_minimum_required (VERSION 2.6)

project(flare-ui-example)

add_subdirectory(lib-flare-ui)

include_directories(
        ${PROJECT_SOURCE_DIR}/lib-flare-ui/include
)

add_executable(flare-ui-example main.m)
target_link_libraries(flare-ui-example libFlareUI)
target_link_libraries(flare-ui-example MulleObjCStandalone)
