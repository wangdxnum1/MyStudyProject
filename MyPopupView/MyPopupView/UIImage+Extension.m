//
//  UIImage+Extension.m
//  MyPopupView
//
//  Created by Wang on 15/12/2.
//  Copyright © 2015年 com.jijinwan.www. All rights reserved.
//

#import "UIImage+Extension.h"

@implementation UIImage (Extension)

+ (UIImage *)resizedImage:(NSString *)name
{
    UIImage *image = [UIImage imageNamed:name];
    return [image stretchableImageWithLeftCapWidth:image.size.width * 0.5 topCapHeight:image.size.height * 0.5];
}

@end
