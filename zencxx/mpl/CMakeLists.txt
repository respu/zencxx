file(GLOB MPL_HEADERS *.hh)
file(GLOB DETAILS_HEADERS details/*.hh)
file(GLOB DETAILS_SEQ_HEADERS details/seq/*.hh)

install(
    FILES ${MPL_HEADERS}
    DESTINATION ${CMAKE_INSTALL_INCLUDEDIR}/zencxx/mpl
    COMPONENT ${LIBZENCXX_DEV_PACKAGE}
  )
install(
    FILES ${DETAILS_HEADERS}
    DESTINATION ${CMAKE_INSTALL_INCLUDEDIR}/zencxx/mpl/details
    COMPONENT ${LIBZENCXX_DEV_PACKAGE}
  )
install(
    FILES ${DETAILS_SEQ_HEADERS}
    DESTINATION ${CMAKE_INSTALL_INCLUDEDIR}/zencxx/mpl/details/seq
    COMPONENT ${LIBZENCXX_DEV_PACKAGE}
  )

# Build test if requested
if(BUILD_TESTING)
    add_subdirectory(tests)
endif()
