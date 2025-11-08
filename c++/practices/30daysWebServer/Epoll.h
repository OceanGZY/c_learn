#ifndef OCEPOLL_H
#define OCEPOLL_H

#include <sys/epoll.h>
#include <vector>

class OCEpoll
{
private:
    int epfd;
    struct epoll_event *events;

public:
    OCEpoll();
    ~OCEpoll();

    // 添加文件描述符
    void addFd(int fd, uint32_t op);

    // poll事件
    std::vector<epoll_event> poll(int timeout = -1);
};
#endif // !OCEPOLL_H
