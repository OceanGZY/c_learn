#include "Socket.h"
#include "InetAddress.h"
#include "Util.h"

#include <unistd.h>
#include <fcntl.h>
#include <sys/socket.h>

OCSocket::OCSocket() : fd(-1)
{
    fd = socket(AF_INET, SOCK_STREAM, 0);
    errif(fd == -1, "socket create error");
}

OCSocket::OCSocket(int _fd) : fd(_fd)
{
    errif(fd == -1, "socket create error");
}

OCSocket::~OCSocket()
{
    if (fd != -1)
    {
        close(fd);
        fd = -1;
    }
}

void OCSocket::bind(OCInetAddress *addr)
{
}

void OCSocket::listen()
{
}

void OCSocket::setnonblocking()
{
}

int OCSocket::accept(OCInetAddress *addr)
{
}

int OCSocket::getFd()
{
}