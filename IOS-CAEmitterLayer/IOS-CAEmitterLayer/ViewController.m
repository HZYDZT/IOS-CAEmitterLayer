//
//  ViewController.m
//  IOS-CAEmitterLayer
//
//  Created by SmartFun on 2018/3/6.
//  Copyright © 2018年 SmartFun. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
//
//    NSString * const kCAEmitterLayerPoint;      // 点
//    NSString * const kCAEmitterLayerLine;               // 直线
//    NSString * const kCAEmitterLayerRectangle;      // 矩形
//    NSString * const kCAEmitterLayerCircle;          // 圆形
//    NSString * const kCAEmitterLayerCuboid;        // 3D rectangle
//    NSString * const kCAEmitterLayerSphere;   // 3D circle
    self.view.backgroundColor= [UIColor grayColor];
    
    //创建一个CAEmitterLayer
    CAEmitterLayer *snowEmitter = [CAEmitterLayer layer];
    
    //指定发射源的位置
    snowEmitter.emitterPosition = CGPointMake(self.view.bounds.size.width / 2.0, -5);
    //指定发射源的大小  这个直线的高度是被忽略的
    snowEmitter.emitterSize  = CGSizeMake(self.view.bounds.size.width, 0);
    //指定发射源的形状 和 模式
    snowEmitter.emitterShape = kCAEmitterLayerLine;
    snowEmitter.emitterMode  = kCAEmitterLayerOutline;
    //创建CAEmitterCell
    CAEmitterCell *snowflake = [CAEmitterCell emitterCell];
    //每秒多少个
    snowflake.birthRate = 10.0;
    //存活时间
    snowflake.lifetime = 50.0;
    //初速度
    snowflake.velocity = 10;//因为动画属于落体效果，所以我们只需要设置它在 y 方向上的加速度就行了。
    //初速度范围
    snowflake.velocityRange = 5;
    //y方向的加速度
    snowflake.yAcceleration = 2;
    snowflake.emissionRange = 0;
    snowflake.contents  = (id) [[UIImage imageNamed:@"snow"] CGImage];
    //缩小
    snowflake.scale = 0.5;
    
    snowEmitter.emitterCells = [NSArray arrayWithObject:snowflake];

    
    [self.view.layer insertSublayer:snowEmitter atIndex:0];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
