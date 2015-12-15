//
//  HMView.m
//  05-UIKit演练
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
   UIImage *image = [UIImage imageNamed:@"头像"];
    
//    [image drawAtPoint:CGPointZero];
    
//    [image drawInRect:CGRectMake(0, 0, 100, 100)];
    
    // 设置裁剪区域，超出裁剪区域的都会被裁剪掉
    UIRectClip(CGRectMake(0, 0, 100, 100));
    
    UIImage *pImage = [UIImage imageNamed:@"001"];
    [pImage drawAsPatternInRect:rect];

}

- (void)drawText
{
    NSString *text = @"hello motolosdmotolosdmotolosdmotolosdmotolosdmotolosdmotolosdmotolosdmotolosdmotolosdmotolosdmotolosdmotolosd";
    CGRect textFrame = CGRectMake(0, 0, 250, 250);
    
    NSDictionary *dict = @{
                           NSFontAttributeName : [UIFont systemFontOfSize:20],
                           NSForegroundColorAttributeName : [UIColor redColor],
                           NSStrokeWidthAttributeName : @5
                           };
    //    UIRectFill(textFrame);
    //    [text drawInRect:textFrame withAttributes:dict];
    
    /*
     [text drawInRect:textFrame withAttributes:dict]; 会自动换行
     [text drawAtPoint:CGPointZero withAttributes:dict]; 不会自动换行
     */
    [text drawAtPoint:CGPointZero withAttributes:dict];
}


@end
