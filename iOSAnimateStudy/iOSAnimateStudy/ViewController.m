//
//  ViewController.m
//  iOSAnimateStudy
//
//  Created by HaKim on 2017/5/19.
//  Copyright © 2017年 haKim. All rights reserved.
//

#import "ViewController.h"
#import "UIColor+RandomColor.h"

@interface ViewController ()<CALayerDelegate>

@property (weak, nonatomic) IBOutlet UIView *layerView;
@property (weak, nonatomic) IBOutlet UIImageView *imageView1;
@property (weak, nonatomic) IBOutlet UIImageView *imageView2;


@property (nonatomic, weak) CALayer *blueLayer;


@property (nonatomic, strong) NSMutableArray *faces;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

//    [self test2];
    
//    [self test3];
    
    [self test5];
}

- (IBAction)changeColor:(UIButton *)sender {
    self.blueLayer.backgroundColor = [UIColor randomColor].CGColor;
}

- (void)test5{
    CALayer *layer = [CALayer layer];
    
    self.blueLayer = layer;
    
    layer.backgroundColor = [UIColor blueColor].CGColor;
    
    
    layer.frame = self.layerView.bounds;
    [self.view.layer addSublayer:layer];
}

- (void)test4{
    CALayer *layer = [CALayer layer];
    
    self.blueLayer = layer;
    
    layer.backgroundColor = [UIColor blueColor].CGColor;
    
    
    layer.frame = self.layerView.bounds;
    [self.layerView.layer addSublayer:layer];
    
    
    CATransition *t = [CATransition animation];
    
    t.type = kCATransitionPush;
    t.subtype = kCATransitionFromLeft;
    NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithDictionary:self.blueLayer.actions];
    t.duration = 1.0;
    [dict setObject:t forKey:@"backgroundColor"];
    self.blueLayer.actions = [dict copy];
    
    
}

- (void)test3{
    UIBezierPath *path = [[UIBezierPath alloc] init];
    [path moveToPoint:CGPointMake(175, 100)];
    [path addArcWithCenter:CGPointMake(150, 100) radius:25 startAngle:0 endAngle:M_PI * 2 clockwise:YES];
    [path moveToPoint:CGPointMake(150, 125)];
    [path addLineToPoint:CGPointMake(150, 175)];
    [path addLineToPoint:CGPointMake(125, 225)];
    [path moveToPoint:CGPointMake(150, 175)];
    [path addLineToPoint:CGPointMake(175, 225)];
    [path moveToPoint:CGPointMake(100, 150)];
    [path addLineToPoint:CGPointMake(200, 150)];
    
    
    //create shape layer
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    shapeLayer.strokeColor = [UIColor redColor].CGColor;
    shapeLayer.fillColor = [UIColor clearColor].CGColor;
    shapeLayer.lineWidth = 5;
    shapeLayer.lineJoin = kCALineJoinRound;
    shapeLayer.lineCap = kCALineCapRound;
    shapeLayer.path = path.CGPath;
    //add it to our view
    [self.layerView.layer addSublayer:shapeLayer];
}

- (void)test2{
    CATransform3D t = CATransform3DIdentity;
    
    t.m34 = -1.0 / 500.0;
    t = CATransform3DRotate(t, -M_PI_4, 1, 0, 0);
    t = CATransform3DRotate(t, -M_PI_4, 0, 1, 0);
    self.layerView.layer.sublayerTransform = t;
    
    
    self.faces = [NSMutableArray array];
    
    for (NSInteger i=0; i<6; i++) {
        UIView *view = [self viewWithIndex:i];
        [self.faces addObject:view];
    }
    
    
    //add cube face 1
    CATransform3D transform = CATransform3DMakeTranslation(0, 0, 100);
    
    [self addFace:0 withTransform:transform];
    
    //add cube face 2
    transform = CATransform3DMakeTranslation(100, 0, 0);
    transform = CATransform3DRotate(transform, M_PI_2, 0, 1, 0);
    [self addFace:1 withTransform:transform];
    
    //add cube face 3
    transform = CATransform3DMakeTranslation(0, -100, 0);
    transform = CATransform3DRotate(transform, M_PI_2, 1, 0, 0);
    [self addFace:2 withTransform:transform];
    
    //add cube face 4
    transform = CATransform3DMakeTranslation(0, 100, 0);
    transform = CATransform3DRotate(transform, -M_PI_2, 1, 0, 0);
    [self addFace:3 withTransform:transform];
    
    //add cube face 5
    transform = CATransform3DMakeTranslation(-100, 0, 0);
    transform = CATransform3DRotate(transform, -M_PI_2, 0, 1, 0);
    [self addFace:4 withTransform:transform];
    
    //add cube face 6
    transform = CATransform3DMakeTranslation(0, 0, -100);
    transform = CATransform3DRotate(transform, M_PI, 0, 1, 0);
    [self addFace:5 withTransform:transform];
}

- (UIView*)viewWithIndex:(NSInteger)i{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    view.backgroundColor = [UIColor whiteColor];
    UILabel *label = [[UILabel alloc] initWithFrame:view.bounds];
    [view addSubview:label];
    label.textAlignment = NSTextAlignmentCenter;
    
    label.textColor = [UIColor randomColor];
    label.text = [NSString stringWithFormat:@"%@",@(i)];
    
    return view;
}

- (void)addFace:(NSInteger)index withTransform:(CATransform3D)t{
    UIView *face = self.faces[index];
    [self.layerView addSubview:face];
    //center the face view within the container
    CGSize containerSize = self.layerView.bounds.size;
    face.center = CGPointMake(containerSize.width / 2.0,containerSize.height / 2.0);

    // apply the transform
    face.layer.transform = t;
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
//    CGPoint point = [[touches anyObject] locationInView:self.view];
//    
//    NSLog(@"point in self.view = %@",NSStringFromCGPoint(point));
//    point = [self.layerView.layer convertPoint:point fromLayer:self.view.layer];
//    NSLog(@"point in self.layerView. = %@",NSStringFromCGPoint(point));
//    
//    if([self.layerView.layer containsPoint:point]){
//        point = [self.blueLayer convertPoint:point fromLayer:self.layerView.layer];
//        NSLog(@"point in blueLayer. = %@",NSStringFromCGPoint(point));
//        if([self.blueLayer containsPoint:point]){
//            NSLog(@"in blue lyer");
//        }else{
//            NSLog(@"in white layer");
//        }
//    }
    
    
    // 形变
//    CGAffineTransform t = CGAffineTransformIdentity;
//    
//    t = CGAffineTransformScale(t, 0.5, 0.5);
//    t = CGAffineTransformRotate(t, M_PI_4);
//    t = CGAffineTransformTranslate(t, 0, 200);
//    
//    self.layerView.layer.affineTransform = t;
    
    
//    // 3D 效果，近大远小
//    CATransform3D tt = CATransform3DIdentity;
//    // 要先写，否则没效果
//    tt.m34 = -1.0 / 500.0;
//    tt = CATransform3DRotate(tt, M_PI_4, 0, 1, 0);
//    
//    
//    
//    self.layerView.layer.transform = tt;
    
    
    //get the touch point
    CGPoint point = [[touches anyObject] locationInView:self.view];
    //check if we've tapped the moving layer
    if ([self.blueLayer.presentationLayer hitTest:point]) {
        //randomize the layer background color
        self.blueLayer.backgroundColor = [UIColor randomColor].CGColor;
        NSLog(@"%@",NSStringFromCGRect(self.blueLayer.presentationLayer.frame));
    } else {
        //otherwise (slowly) move the layer to new position
        [CATransaction begin];
        [CATransaction setAnimationDuration:4.0];
        self.blueLayer.position = point;
        [CATransaction commit];
    }
}


- (void)test1{
    //    CALayer *blueLayer = [CALayer layer];
    //    blueLayer.frame = CGRectMake(50, 50, 100, 100);
    //    blueLayer.backgroundColor = [UIColor blueColor].CGColor;
    //
    //    blueLayer.delegate = self;
    //    blueLayer.contentsScale = [UIScreen mainScreen].scale;
    //
    //    blueLayer.masksToBounds = NO;
    //
    //    [self.layerView.layer addSublayer:blueLayer];
    //
    //    [blueLayer display];
    //    self.blueLayer = blueLayer;
    //
    //    self.blueLayer.borderColor = [UIColor blackColor].CGColor;
    //    self.blueLayer.borderWidth = 5;
    
    
    
    //    UIImage *image1 = [UIImage imageNamed:@"Gift@2x.png"];
    //
    //    UIImage *imag2 = [UIImage imageNamed:@"Gift@3x.png"];
    //    self.imageView1.image = image1;
    //
    //    self.imageView2.image = imag2;
    //
    //
    UIImage *image = [UIImage imageNamed:@"2.jpeg"];
    self.layerView.layer.contentsGravity = kCAGravityResizeAspect;
    self.layerView.layer.contentsScale = image.scale;
    NSLog(@"image.scale = %@",@(image.scale));
    //    self.layerView.layer.contentsRect = CGRectMake(0, 0, 0.5, 0.5);
    self.layerView.layer.contents = (__bridge id)image.CGImage;
}



















@end
