//
//  HMBarView.m
//  04-柱状图
//
//  Created by apple on 14-9-2.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "HMBarView.h"
#import "UIColor+Random.h"
@implementation HMBarView

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
    NSArray *data = @[@25,@25,@50];
    int count = data.count;
    
    CGFloat w = rect.size.width / (2 * count - 1);
    CGFloat h = 0;
    CGFloat x = 0;
    CGFloat y = 0;
    CGFloat viewH = rect.size.height;
    // 1.获取上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    for (int i = 0; i < count; i++) {
        h = viewH * [data[i] intValue] / 100.0;
        x = 2 * w * i;
        y = viewH - h;
        // 2.拼接路径
        UIBezierPath *path = [UIBezierPath bezierPathWithRect:CGRectMake(x, y, w, h)];
        
        // 3.添加路径到上下文
        CGContextAddPath(ctx, path.CGPath);
        
        [[UIColor randomColor] set];
        
        // 4.渲染
        CGContextFillPath(ctx);
    }
    
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self setNeedsDisplay];
}


@end
