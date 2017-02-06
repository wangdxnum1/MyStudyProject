//
//  main.cpp
//  TcpClient
//
//  Created by HaKim on 16/12/2.
//  Copyright © 2016年 haKim. All rights reserved.
//

#include <iostream>
#include <stdio.h>
#include <unistd.h>
#include <iostream>
#include <sys/socket.h>
#include <arpa/inet.h>

void error_handling(char* message);

void error_handling(char* message) {
    fputs(message, stderr);
    fputc('\n', stderr);
    exit(1);
}

int main(int argc, const char * argv[]) {
    // insert code here...
    
    int sock;
    struct sockaddr_in serv_addr;
    char message[30];
    ssize_t str_len;
    
    char serverAddress[] = "61.172.201.237";
    int port = 80;
    
    //创建用于internet的流协议(TCP)socket
    sock = socket(PF_INET, SOCK_STREAM, 0);
    if (sock == -1) {
        error_handling("socket() error");
    }
    
    //设置一个socket地址结构client_addr,代表客户机internet地址, 端口
    serv_addr.sin_family = AF_INET;
    serv_addr.sin_addr.s_addr = inet_addr(serverAddress);
    serv_addr.sin_port = htons(port);
    
    //把socket和socket地址结构联系起来
    int retvalue = connect(sock,(struct sockaddr*)&serv_addr,sizeof(serv_addr));
    if( retvalue == -1) {
        std::cerr << strerror(retvalue) << ": errno: " << retvalue << std::endl;
        printf("retvalue = %d",retvalue);
        error_handling("connect() error");
    }
    
    char buffer[1024 * 1024 * 4];
    bzero(buffer,256);
    while (true) {
//        std::cin >> buffer;
//        size_t length = strlen(buffer);
//        if(send(sock,buffer,length,0) != length){
//            error_handling("send() error");
//            break;
//        }
        
        char sina[] = "GET / HTTP/1.1\r\nHost: www.sina.com.cn\r\nConnection:close\r\n\r\n";
        size_t getheader = strlen(sina);
        if(send(sock,sina,getheader,0) != getheader){
            error_handling("send() error");
            break;
        }
        
        str_len = read(sock, buffer, 1024 * 1024 * 4);
        if (str_len == -1) {
            error_handling("read() error");
            break;
        }
        std::cout << buffer;
        
    }
//    
//    strncpy(buffer, file_name, strlen(file_name)>BUFFER_SIZE?BUFFER_SIZE:strlen(file_name));
//    
//    //向服务器发送buffer中的数据
//
    close(sock);
    
    return 0;
}
