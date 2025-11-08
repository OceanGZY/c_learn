#ifndef OCSOCKET_H
#define OCSOCKET_H

class OCInetAddress;

class OCSocket
{
private:
    int fd;

public:
    OCSocket();
    OCSocket(int);
    ~OCSocket();

    void bind(OCInetAddress *);
    void listen();
    void setnonblocking();

    int accept(OCInetAddress *);

    int getFd();
};

#endif // !OCSOCKET_H