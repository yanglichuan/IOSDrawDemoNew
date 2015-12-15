//
//  HMView.m
//  08-图形上下文栈
//
//  Created by apple on 14-9-2.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "HMView.h"

@implementation HMView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
    
    // 1.获取上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    // 把ctx拷贝一份放在栈中
    CGContextSaveGState(ctx);
    
    // 2.拼接路径（绘图的信息）
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(10, 125)];
    [path addLineToPoint:CGPointMake(240, 125)];
    
    // 3.路径添加到上下文
    CGContextAddPath(ctx, path.CGPath);
    
    // 设置绘图的状态
    [[UIColor redColor] set];
    CGContextSetLineWidth(ctx, 10);
    CGContextSetLineCap(ctx, kCGLineCapRound);
    
    // 4.渲染
    CGContextStrokePath(ctx);
    
    
    // 第二根线
    UIBezierPath *path1 = [UIBezierPath bezierPath];
    [path1 moveToPoint:CGPointMake(125, 10)];
    [path1 addLineToPoint:CGPointMake(125, 240)];
    CGContextAddPath(ctx, path1.CGPath);
    
    // 把栈顶上下文取出来，替换当前上下文
    CGContextRestoreGState(ctx);
    
    // 设置绘图的状态
//    [[UIColor blackColor] set];
//    CGContextSetLineWidth(ctx, 1);
//    CGContextSetLineCap(ctx, kCGLineCapButt);
    
    
    // 4.渲染
    CGContextStrokePath(ctx);


}


@end
