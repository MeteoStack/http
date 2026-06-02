if(MSHTTP_BUILD)
    file(
        GLOB_RECURSE MSHTTP_SRC_FILES
        ${CMAKE_CURRENT_SOURCE_DIR}/*.c
    )

    if(MSHTTP_BUILD_SHARED)
        add_library(MSHTTP SHARED ${MSHTTP_SRC_FILES})
        target_compile_definitions(
            MSHTTP
            PRIVATE MSHTTP_EXPORTS
        )
    else()
        add_library(MSHTTP STATIC ${MSHTTP_SRC_FILES})
    endif()

    add_library(MSHTTP::MSHTTP ALIAS MSHTTP)

    set_target_properties(
        MSHTTP PROPERTIES
        POSITION_INDEPENDENT_CODE ON
    )

    install(
        TARGETS MSHTTP
        EXPORT MSHTTPTargets
        ARCHIVE DESTINATION lib
        LIBRARY DESTINATION lib
        RUNTIME DESTINATION bin
    )

    install(
        EXPORT MSHTTPTargets
        NAMESPACE MSHTTP::
        DESTINATION lib/cmake/MSHTTP
    )

    install(
        DIRECTORY include/
        DESTINATION include
    )

    target_include_directories(
        MSHTTP
        PUBLIC
            $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
            $<{INSTALL_INTERFACE:include>
    )

    set_target_properties(
        MSHTTP PROPERTIES
        ARCHIVE_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/lib
        LIBRARY_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/lib
        RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/bin
    )
endif()