//
//  ViewController.m
//  MyPopupView
//
//  Created by Wang on 15/12/2.
//  Copyright © 2015年 com.jijinwan.www. All rights reserved.
//

#import "ViewController.h"
#import "TWPopMenuView.h"

@interface ViewController ()<TWPopMenuDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)btnClicked:(UIButton *)sender {
    [self btn];
}

- (void)btn
{
    // 弹出菜单
    UIButton *button = [UIButton buttonWithType:UIButtonTypeContactAdd];
    button.backgroundColor = [UIColor blueColor];
    
    TWPopMenuView *menu = [[TWPopMenuView alloc ] initWithContentView:nil];
    menu.delegate = self;
    menu.arrowPosition = TWPopMenuArrowPositionCenter;
    menu.dimBackground = YES;
    [menu showInRect:CGRectMake(100, 64, 200, 480)];
}

@end
