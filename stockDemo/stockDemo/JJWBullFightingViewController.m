//
//  JJWBullFightingViewController.m
//  stockDemo
//
//  Created by Wang on 15/11/10.
//  Copyright © 2015年 com.jijinwan.www. All rights reserved.
//

#import "JJWBullFightingViewController.h"
#import "MBProgressHUD+Utility.h"
#import <Socket_IO_Client_Swift/Socket_IO_Client_Swift-Swift.h>
#import "JJWIndexRecords.h"
#import "NSDate+Utility.h"
#import "AFNetworking.h"
#import "JJWBullRoomViewController.h"

#define kUrlPrefix          @"http://dev.jijinwan.com/jijinwan/"
// 服务器 api 相关
#define BEARER                  @"Bearer"

@interface JJWBullFightingViewController ()

@property (nonatomic, strong) SocketIOClient *client;
@property (nonatomic, copy) NSString *selleID;
@property (nonatomic, copy) NSString *ID;

@property (nonatomic, strong) MBProgressHUD *hud;
@property (nonatomic, copy) NSString *mySoloID;
@property (nonatomic, copy) NSString *playerID;
@property (nonatomic, copy) NSString *gameID;
@end

@implementation JJWBullFightingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //[self login];
    self.title = @"斗牛场";
    [self connectToSever];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)matchPlayerBtnClicked:(UIButton *)sender {
    NSLog(@"斗牛场匹配对手- %@",@(sender.tag));
    self.hud = [MBProgressHUD showMessage:@"正在匹配对手"];
    NSString *gold = [NSString stringWithFormat:@"%@",@(sender.tag)];
    NSArray *items = @[self.access_token,gold];
    [self.client emit:@"add_user" withItems:items];
}

- (void)login
{
    //http://dev.jijinwan.com/jijinwan/User/Login?mobile=hjh&login_pwd=1&user_id=&_=1447038766477
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    //15202150609
    NSString *url = @"http://dev.jijinwan.com/jijinwan/User/Login";
    NSDictionary *parameters = @{@"mobile":@"15202150609",
                                 @"login_pwd":@"123456",
                                 @"_" : [NSDate stringSince1970]
                                 };
    [manager GET:url parameters:parameters success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
        NSLog(@"%@",responseObject);
        NSDictionary *dict = responseObject[@"data"];
        
        self.access_token = dict[@"access_token"];
        self.user_id = [NSString stringWithFormat:@"%@",dict[@"id"]];
        //[self getID];
        NSArray *items = [NSArray arrayWithObjects:self.access_token, nil];
        [self.client emit:@"set_user_id" withItems:items];
    } failure:^(AFHTTPRequestOperation * _Nullable operation, NSError * _Nonnull error) {
        NSLog(@"%@",error);
    }];
}

- (void)goToBartleRoom
{
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    JJWBullRoomViewController *vc =[sb instantiateViewControllerWithIdentifier:@"JJWBullRoomViewController"];
    vc.client = self.client;
    vc.access_token = self.access_token;
    vc.ID = self.ID;
    vc.user_id = self.user_id;
    vc.mySoloID = self.mySoloID;
    vc.playerID = self.playerID;
    vc.gameID = self.gameID;
    [self .navigationController pushViewController:vc animated:YES];
}

- (void)connectToSever
{
    SocketIOClient* socket = [[SocketIOClient alloc] initWithSocketURL:@"120.26.209.1:9090" options:@{@"log": @NO, @"forcePolling": @YES}];
    self.client =socket;
    [socket on:@"connect" callback:^(NSArray* data, SocketAckEmitter* ack) {
        NSLog(@"socket connected");
        //[self.client emit:@"get_chart" withItems:nil];
        NSArray *items = [NSArray arrayWithObjects:self.access_token, nil];
        [self.client emit:@"set_user_id" withItems:items];
    }];
    [socket on:@"error" callback:^(NSArray* data, SocketAckEmitter* ack) {
        NSLog(@"socket error");
    }];
    [socket on:@"disconnect" callback:^(NSArray* data, SocketAckEmitter* ack) {
        NSLog(@"socket disconnect");
    }];
    [socket on:@"reconnect" callback:^(NSArray* data, SocketAckEmitter* ack) {
        NSLog(@"socket reconnect");
    }];
    [socket on:@"add_user" callback:^(NSArray* data, SocketAckEmitter* ack) {
        NSLog(@"add_user");
    }];
    //OnStart
    [socket on:@"OnStart" callback:^(NSArray* data, SocketAckEmitter* ack) {
        NSLog(@"OnStart");
    }];
    //rem_user
    [socket on:@"rem_user" callback:^(NSArray* data, SocketAckEmitter* ack) {
        NSLog(@"rem_user");
    }];
    // chn_IfSolo_EnterRoom
    [socket on:@"chn_IfSolo_EnterRoom" callback:^(NSArray* data, SocketAckEmitter* ack) {
        NSLog(@"------>>>>>>chn_IfSolo_EnterRoom");
        [self.hud hide:YES];
        
        NSDictionary *dict = data[0];
        NSString *user_id1 = [NSString stringWithFormat:@"%@",dict[@"user_id1"]];
        NSString *user_id2 = [NSString stringWithFormat:@"%@",dict[@"user_id2"]];
        NSString *solo_user_id1 = [NSString stringWithFormat:@"%@",dict[@"solo_user_id1"]];
        NSString *solo_user_id2 = [NSString stringWithFormat:@"%@",dict[@"solo_user_id2"]];
        if([self.user_id isEqualToString:user_id1])
        {
            self.mySoloID = solo_user_id1;
            self.playerID = solo_user_id2;
        }
        else
        {
            self.mySoloID = solo_user_id2;
            self.playerID = solo_user_id1;
        }
        
        self.gameID = dict[@"id"];

        [self goToBartleRoom];
    }];
    //chn_IfSolo_LeaveRoom
    [socket on:@"chn_IfSolo_LeaveRoom" callback:^(NSArray* data, SocketAckEmitter* ack) {
        NSLog(@"chn_IfSolo_LeaveRoom");
    }];
    //chn_IfSolo_PutRollingFeed
    [socket on:@"chn_IfSolo_PutRollingFeed" callback:^(NSArray* data, SocketAckEmitter* ack) {
        NSLog(@"chn_IfSolo_PutRollingFeed");
        
    }];
    //challenge
    [socket on:@"challenge" callback:^(NSArray* data, SocketAckEmitter* ack) {
        NSLog(@"challenge");
    }];
    //
    [socket on:@"set_user_id" callback:^(NSArray* data, SocketAckEmitter* ack) {
        NSLog(@"set_user_id");
    }];
    [socket connect];
    
}

- (void)getID
{
    // IfDailyFree/Insert
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    NSString *url = [NSString stringWithFormat:@"%@%@",kUrlPrefix,@"IfDailyFree/Insert"];
    NSString *accessToken = BEARER;
    accessToken = [accessToken stringByAppendingString:@" "];
    accessToken = [accessToken stringByAppendingString:self.access_token];
    
    [manager.requestSerializer setValue:accessToken forHTTPHeaderField:@"Authorization"];
    [manager POST:url parameters:nil success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
        
        NSLog(@"%@",responseObject);
        NSNumber *ID = responseObject[@"data"];
        self.ID = [NSString stringWithFormat:@"^%@",ID];
    } failure:^(AFHTTPRequestOperation * _Nullable operation, NSError * _Nonnull error) {
        NSLog(@"%@",error);
    }];
}

@end
