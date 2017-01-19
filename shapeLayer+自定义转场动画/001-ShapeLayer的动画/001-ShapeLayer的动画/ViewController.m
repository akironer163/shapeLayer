//
//  ViewController.m
//  001-ShapeLayer的动画
//
//  Created by HM on 16/10/22.
//  Copyright © 2016年 HM. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CAShapeLayer *layer = [CAShapeLayer layer];
    
    // 1. 路径
    UIBezierPath *path = [UIBezierPath bezierPath];
    
    [path moveToPoint:CGPointZero];
    CGSize size = self.view.bounds.size;
    [path addLineToPoint:CGPointMake(size.width, size.height)];
    
    // 2. 设置图层属性
    layer.path = path.CGPath;
    layer.lineWidth = 10;
    layer.strokeColor = [UIColor orangeColor].CGColor;
    
    // 3. 添加图层
    [self.view.layer addSublayer:layer];
    
    // 图层动画不能使用 UIView 的块动画
    // strokeEnd，设置路径终点占整个路径的百分比
    CABasicAnimation *anim = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    
    anim.fromValue = @0;
    anim.toValue = @0.8;
    
    anim.duration = 2;
    
    anim.removedOnCompletion = NO;
    anim.fillMode = @"forwards";
    
    // 将动画添加到图层 - ShapeLayer
    [layer addAnimation:anim forKey:nil];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
