//
//  TcpServer.hpp
//  TcpServer
//
//  Created by HaKim on 16/11/30.
//  Copyright © 2016年 haKim. All rights reserved.
//

#ifndef TcpServer_hpp
#define TcpServer_hpp

#include <stdio.h>
#include <unistd.h>
#include <iostream>
#include <sys/socket.h>
#include <arpa/inet.h>

class TcpServer
{
private:
    int listenSock;
    int communicationSock;
    sockaddr_in servAddr;
    sockaddr_in clntAddr;
public:
    TcpServer(int listen_port);
    bool isAccept();
    void handleEcho();
};


#endif /* TcpServer_hpp */
