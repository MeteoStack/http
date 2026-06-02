#ifndef MSHTTP_H
#define MSHTTP_H

#include <stdio.h>
#include <stdlib.h>

#if defined(_WIN32)
    #include <winsock2.h>
    #include <WS2tcpip.h>

    // Now I have to figure out how to import winsock again
    //#pragma comment(lib, "ws2_32.lib")
    //typedef SOCKET socket_t;
#else
    #include <unistd.h>
    #include <arpa/inet.h>
#endif

#include "export.h"

#endif // MSHTTP_H