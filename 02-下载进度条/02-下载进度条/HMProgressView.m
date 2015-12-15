//
//  HMProgressView.m
//  02-下载进度条
//
//  Created by apple on 14-9-2.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "HMProgressView.h"

@interface HMProgressView()

@property (nonatomic, weak) UILabel *label;

@end



@implementation HMProgressView

- (UILabel *)label
{
    if (_label == nil) {
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
        label.textAlignment = NSTextAlignmentCenter;
        
        [self addSubview:label];
        _label = label;
    }
    return _label;
}

- (void)setProgress:(CGFloat)progress
{
    _progress = progress;
    self.label.text = [NSString stringWithFormat:@"%.2f%%",progress * 100];
    
//    [self drawRect:self.bounds];
    // 重新绘制
    // 在view上做一个重绘的标记，当下次屏幕刷新的时候，就会调用drawRect.
    [self setNeedsDisplay];
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
// 当视图显示的时候会调用 默认只会调用一次
- (void)drawRect:(CGRect)rect
{
    // Drawing code
    
    // 1.获取上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    // 2.拼接路径
    CGPoint center = CGPointMake(50, 50);
    CGFloat radius = 50 - 2;
    CGFloat startA = -M_PI_2;
    CGFloat endA = -M_PI_2 + _progress * M_PI * 2;
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:center radius:radius startAngle:startA endAngle:endA clockwise:YES];
    
    // 3.把路径添加到上下文
    CGContextAddPath(ctx, path.CGPath);
    
    // 4.把上下文渲染到视图
    CGContextStrokePath(ctx);
    
}


@end
