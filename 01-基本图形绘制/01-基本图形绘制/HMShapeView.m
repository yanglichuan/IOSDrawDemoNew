//
//  HMShapeView.m
//  01-基本图形绘制
//
//  Created by apple on 14-9-2.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "HMShapeView.h"

@interface HMShapeView()

@property (nonatomic, weak) UILabel *label;

@end

@implementation HMShapeView

- (UILabel *)label
{
    if (_label == nil) {
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 250, 100)];
        label.text = @"s";
        label.font = [UIFont systemFontOfSize:60];
        label.textColor = [UIColor yellowColor];
        label.textAlignment = NSTextAlignmentCenter;
        [self addSubview:label];
        _label = label;
    }
    return _label;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)awakeFromNib
{
//    self.label;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
   
    // 1.获取上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    // 2.拼接路径
    CGPoint center = CGPointMake(125, 125);
    CGFloat radius = 100;
    CGFloat startA = 0;
    CGFloat endA = M_PI_2;
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:center radius:radius startAngle:startA endAngle:endA clockwise:YES];
    
    [path addLineToPoint:center];
    
    // 3.把路径添加到上下文
    CGContextAddPath(ctx, path.CGPath);
    
    // 4.渲染上下文
//    CGContextStrokePath(ctx);
    CGContextFillPath(ctx);


}

- (void)drawArc
{
    // 1.获取上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    // 2.拼接路径
    CGPoint center = CGPointMake(125, 125);
    CGFloat radius = 100;
    CGFloat startA = 0;
    CGFloat endA = M_PI_2;
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:center radius:radius startAngle:startA endAngle:endA clockwise:YES];
    
    // 3.把路径添加到上下文
    CGContextAddPath(ctx, path.CGPath);
    
    // 4.渲染上下文
    CGContextStrokePath(ctx);
}

- (void)drawCircle
{
    // 1.获取上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    // 2.拼接路径
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(10, 10, 200, 100)];
    
    // 3.把路径添加到上下文
    CGContextAddPath(ctx, path.CGPath);
    
    // 4.渲染上下文
    CGContextStrokePath(ctx);

}

- (void)drawRectangle
{
    // 1.获取上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    // 2.拼接路径
    UIBezierPath *path = [UIBezierPath bezierPathWithRect:CGRectMake(10, 10, 200, 200)];
    path = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(10, 10, 200, 200) cornerRadius:20];
    
    // 3.把路径添加到上下文
    CGContextAddPath(ctx, path.CGPath);
    
    // 4.渲染上下文
    CGContextStrokePath(ctx);
}

- (void)drawSupernene
{
    // 1.获取上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    // 2.拼接路径
    UIBezierPath *path = [UIBezierPath bezierPath];
    
    CGPoint startP = CGPointMake(10, 10);
    
    [path moveToPoint:startP];
    
    [path addLineToPoint:CGPointMake(125, 125)];
    
    [path addLineToPoint:CGPointMake(240, 10)];
    
    // 从路径的终点连接到起点
    [path closePath];
    //    [path addLineToPoint:startP];
    
    // 3.把路径添加到上下文
    CGContextAddPath(ctx, path.CGPath);
    
    [[UIColor blueColor] setFill];
    [[UIColor redColor] setStroke];
    
    CGContextSetLineWidth(ctx, 15);
    
    // 4.渲染上下文
    //    CGContextStrokePath(ctx);
    //    CGContextFillPath(ctx);
    // 即填充又描边 kCGPathFillStroke
    CGContextDrawPath(ctx, kCGPathFillStroke);
}




@end
