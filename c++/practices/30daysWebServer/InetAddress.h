#ifndef OCINETADDRESS_H
#define OCINETADDRESS_H

#include <arpa/inet.h>

class OCInetAddress
{
public:
    struct sockaddr_in addr;
    socklen_t addr_len;

    OCInetAddress();
    OCInetAddress(const char *ip, uint16_t port);
    ~OCInetAddress();
};

#endif // !OCINETADDRESS_H
