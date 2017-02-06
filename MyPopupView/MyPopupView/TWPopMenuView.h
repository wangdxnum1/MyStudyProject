//
//  TWPopMenuView.h
//  MyPopupView
//
//  Created by Wang on 15/12/2.
//  Copyright © 2015年 com.jijinwan.www. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum {
    TWPopMenuArrowPositionCenter = 0,
    TWPopMenuArrowPositionLeft = 1,
    TWPopMenuArrowPositionRight = 2
} TWPopMenuArrowPosition;

// 协议
@class TWPopMenuView;

@protocol TWPopMenuDelegate <NSObject>

@optional
- (void)popMenuDidDismissed:(TWPopMenuView *)popMenu;

@end


@interface TWPopMenuView : UIView

- (instancetype)initWithContentView:(UIView *)contentView;

+ (instancetype)popMenuWithContentView:(UIView *)contentView;

- (void)setBackground:(UIImage *)background;

- (void)showInRect:(CGRect)rect;

- (void)dismiss;

@property (nonatomic, weak) id<TWPopMenuDelegate> delegate;

@property (nonatomic, assign, getter = isDimBackground) BOOL dimBackground;

@property (nonatomic, assign) TWPopMenuArrowPosition arrowPosition;

@end
