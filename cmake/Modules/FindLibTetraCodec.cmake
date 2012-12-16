if(NOT LIBTETRACODEC_FOUND)
  pkg_check_modules (LIBTETRACODEC_PKG libtetracodec)
  find_path(LIBTETRACODEC_INCLUDE_DIR NAMES osmocom/tetra/codec_export.h
    PATHS
    ${LIBTETRACODEC_PKG_INCLUDE_DIRS}
    /usr/include
    /usr/local/include
  )

  find_library(LIBTETRACODEC_LIBRARIES NAMES tetracodec
    PATHS
    ${LIBTETRACODEC_PKG_LIBRARY_DIRS}
    /usr/lib
    /usr/local/lib
  )

if(LIBTETRACODEC_INCLUDE_DIR AND LIBTETRACODEC_LIBRARIES)
  set(LIBTETRACODEC_FOUND TRUE CACHE INTERNAL "libtetracodec found")
  message(STATUS "Found libtetracodec: ${LIBTETRACODEC_INCLUDE_DIR}, ${LIBTETRACODEC_LIBRARIES}")
else(LIBTETRACODEC_INCLUDE_DIR AND LIBTETRACODEC_LIBRARIES)
  set(LIBTETRACODEC_FOUND FALSE CACHE INTERNAL "libtetracodec found")
  message(STATUS "libtetracodec not found.")
endif(LIBTETRACODEC_INCLUDE_DIR AND LIBTETRACODEC_LIBRARIES)

mark_as_advanced(LIBTETRACODEC_INCLUDE_DIR LIBTETRACODEC_LIBRARIES)

endif(NOT LIBTETRACODEC_FOUND)
