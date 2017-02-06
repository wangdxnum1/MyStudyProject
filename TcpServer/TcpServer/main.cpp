//
//  main.cpp
//  TcpServer
//
//  Created by HaKim on 16/11/24.
//  Copyright © 2016年 haKim. All rights reserved.
//

#include <iostream>
#include "TcpServer.hpp"

int echo_server(int argc, const char* argv[]);

void test();

int main(int argc, const char * argv[]) {
    // insert code here...
    
    int mainRtn = 0;
    try {
        mainRtn = echo_server(argc, argv);
    }
    catch ( const char* s ) {
        perror(s);
        exit(EXIT_FAILURE);
    }
    
    return mainRtn;
    return 0;
}

int echo_server(int argc, const char* argv[])
{
    int port;
    if ( argc == 2 ) {
        port = atoi(argv[1]);
    } else {
        port = 5000;
    }
    
    port = 5004;
    
    std::cout << "listen port = " << port << std::endl;
    
    TcpServer myServ(port);
    
    while ( true ) {
        if ( myServ.isAccept() == true ) {
            myServ.handleEcho();
        }
    }
    
    return 0;
}
