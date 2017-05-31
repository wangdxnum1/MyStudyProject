//
//  TWTest1ViewController.m
//  iOSAnimateStudy
//
//  Created by HaKim on 2017/5/31.
//  Copyright © 2017年 haKim. All rights reserved.
//

#import "TWTest1ViewController.h"

@interface TWTest1ViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation TWTest1ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithTitle:@"Start" style:UIBarButtonItemStylePlain target:self action:@selector(startBtnClicekd:)];
    self.navigationItem.rightBarButtonItem = item;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)startBtnClicekd:(UIBarButtonItem *)sender {
    
    self.imageView.image = [UIImage imageNamed:@"1"];
    
    CGFloat screenWidth = [UIScreen mainScreen].bounds.size.width;
    CGFloat screenHeight = [UIScreen mainScreen].bounds.size.height;
    
    CGRect startRect = CGRectMake(screenWidth, 0, 2, screenHeight);
    
    CGRect endRect = CGRectMake(0, 0, screenWidth, screenHeight);
    
    UIBezierPath *startPath = [UIBezierPath bezierPathWithRect:startRect];
    UIBezierPath *endPath = [UIBezierPath bezierPathWithRect:endRect];
    
    
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    shapeLayer.path = endPath.CGPath;
    
    
//    shapeLayer.bounds = self.imageView.bounds;
    
    
    self.imageView.layer.mask = shapeLayer;
    
    CABasicAnimation *an = [CABasicAnimation animationWithKeyPath:@"path"];
    an.fromValue = (id)startPath.CGPath;
    an.toValue = (id)endPath.CGPath;
    an.duration = 3.0;
    
    [shapeLayer addAnimation:an forKey:@"pathAnimation"];
    
}

@end
