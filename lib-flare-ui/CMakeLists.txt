cmake_minimum_required (VERSION 2.6)
project(libFlareUI)

set(FLARE_UI_VERSION_MAJOR 1)
set(FLARE_UI_VERSION_MINOR 0)

set(CMAKE_MACOSX_RPATH 1)

configure_file(
        "${PROJECT_SOURCE_DIR}/FlareUI-version.h.in"
        "${PROJECT_BINARY_DIR}/FlareUI-version.h"
)

include_directories(
        "${PROJECT_BINARY_DIR}"
        "${PROJECT_SOURCE_DIR}/include"
        "${PROJECT_SOURCE_DIR}/src"
)

# if (APPLE)
        find_library(SDL2 SDL2)
# endif (APPLE)

set(FLARE_UI_SOURCES 
        "${PROJECT_SOURCE_DIR}/src/FlareUI.m"
        "${PROJECT_SOURCE_DIR}/src/FUIApplication.m"
        "${PROJECT_SOURCE_DIR}/src/FUIArray.m"
        "${PROJECT_SOURCE_DIR}/src/FUIView.m"
        "${PROJECT_SOURCE_DIR}/src/FUIWindow.m"
        "${PROJECT_SOURCE_DIR}/src/FUIWindow+internal.m"
)

add_library(libFlareUI SHARED "${FLARE_UI_SOURCES}") 
target_link_libraries(libFlareUI MulleObjCStandalone "${SDL2}")