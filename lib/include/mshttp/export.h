#ifndef MSHTTP_EXPORT_H
#define MSHTTP_EXPORT_H

#if defined(_WIN32)
    #if defined(MSHTTP_BUILD_SHARED)
        #if defined(MSHTTP_EXPORTS)
            #define MSHTTP_API __declspec(dllexport)
        #else
            #define MSHTTP_API __declspec(dllimport)
        #endif
    #else
        #define MSHTTP_API
    #endif
#else
    #define MSHTTP_API __attribute__((visibility("default")))
#endif

#endif // MSHTTP_EXPORT_H