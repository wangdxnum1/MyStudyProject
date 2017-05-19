//
//  ViewController.m
//  iOSAnimateStudy
//
//  Created by HaKim on 2017/5/19.
//  Copyright © 2017年 haKim. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<CALayerDelegate>

@property (weak, nonatomic) IBOutlet UIView *layerView;
@property (weak, nonatomic) IBOutlet UIImageView *imageView1;
@property (weak, nonatomic) IBOutlet UIImageView *imageView2;


@property (nonatomic, weak) CALayer *blueLayer;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    CALayer *blueLayer = [CALayer layer];
    blueLayer.frame = CGRectMake(50, 50, 100, 100);
    blueLayer.backgroundColor = [UIColor blueColor].CGColor;
    
    blueLayer.delegate = self;
    blueLayer.contentsScale = [UIScreen mainScreen].scale;
    
    blueLayer.masksToBounds = NO;

    [self.layerView.layer addSublayer:blueLayer];
    
    [blueLayer display];
    self.blueLayer = blueLayer;
    
    self.blueLayer.borderColor = [UIColor blackColor].CGColor;
    self.blueLayer.borderWidth = 5;
    
//    UIImage *image1 = [UIImage imageNamed:@"Gift@2x.png"];
//    
//    UIImage *imag2 = [UIImage imageNamed:@"Gift@3x.png"];
//    self.imageView1.image = image1;
//    
//    self.imageView2.image = imag2;
//    
//    
//    UIImage *image = [UIImage imageNamed:@"2.jpeg"];
//    self.layerView.layer.contentsGravity = kCAGravityResizeAspect;
//    self.layerView.layer.contentsScale = image.scale;
//    NSLog(@"image.scale = %@",@(image.scale));
//    self.layerView.layer.contentsRect = CGRectMake(0, 0, 0.5, 0.5);
//    self.layerView.layer.contents = (__bridge id)image.CGImage;
}

//- (void)drawLayer:(CALayer *)layer inContext:(CGContextRef)ctx{
//    CGContextSetLineWidth(ctx, 10);
//    CGContextSetStrokeColorWithColor(ctx, [UIColor redColor].CGColor);
//    CGContextStrokeEllipseInRect(ctx, CGRectMake(10, 10, 80, 80));
//}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    CGPoint point = [[touches anyObject] locationInView:self.view];
    
    NSLog(@"point in self.view = %@",NSStringFromCGPoint(point));
    point = [self.layerView.layer convertPoint:point fromLayer:self.view.layer];
    NSLog(@"point in self.layerView. = %@",NSStringFromCGPoint(point));
    
    if([self.layerView.layer containsPoint:point]){
        point = [self.blueLayer convertPoint:point fromLayer:self.layerView.layer];
        NSLog(@"point in blueLayer. = %@",NSStringFromCGPoint(point));
        if([self.blueLayer containsPoint:point]){
            NSLog(@"in blue lyer");
        }else{
            NSLog(@"in white layer");
        }
    }
    
    
    
}



























@end
