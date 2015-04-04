//
//  ForwardArrowButton.m
//  CYLWebViewController
//
//  Created by chenyilong on 15/4/4.
//  Copyright (c) 2015年 chenyilong. All rights reserved.
//

#import "ForwardArrowButton.h"

@implementation ForwardArrowButton

- (void)drawRect:(CGRect)rect
{
    [super drawRect:rect];
    
    //// Path drawing
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(2.5, 11)];
    [path addLineToPoint:CGPointMake(26.5, 11)];
    [path addLineToPoint:CGPointMake(20.725, 5.225)];
    [path addCurveToPoint:CGPointMake(20, 3.5) controlPoint1:CGPointMake(20.232, 4.733) controlPoint2:CGPointMake(20, 4.145)];
    [path addCurveToPoint:CGPointMake(22.5, 1) controlPoint1:CGPointMake(20, 2.27) controlPoint2:CGPointMake(21.016, 1)];
    [path addCurveToPoint:CGPointMake(24.225, 1.725) controlPoint1:CGPointMake(23.164, 1) controlPoint2:CGPointMake(23.742, 1.241)];
    [path addLineToPoint:CGPointMake(34.172, 11.672)];
    [path addCurveToPoint:CGPointMake(35, 13.5) controlPoint1:CGPointMake(34.582, 12.082) controlPoint2:CGPointMake(35, 12.589)];
    [path addCurveToPoint:CGPointMake(34.192, 15.309) controlPoint1:CGPointMake(35, 14.411) controlPoint2:CGPointMake(34.651, 14.85)];
    [path addLineToPoint:CGPointMake(24.225, 25.275)];
    [path addCurveToPoint:CGPointMake(22.5, 26) controlPoint1:CGPointMake(23.742, 25.759) controlPoint2:CGPointMake(23.164, 26)];
    [path addCurveToPoint:CGPointMake(20, 23.5) controlPoint1:CGPointMake(21.015, 26) controlPoint2:CGPointMake(20, 24.73)];
    [path addCurveToPoint:CGPointMake(20.725, 21.775) controlPoint1:CGPointMake(20, 22.855) controlPoint2:CGPointMake(20.232, 22.267)];
    [path addLineToPoint:CGPointMake(26.5, 16)];
    [path addLineToPoint:CGPointMake(2.5, 16)];
    [path addCurveToPoint:CGPointMake(0, 13.5) controlPoint1:CGPointMake(1.12, 16) controlPoint2:CGPointMake(0, 14.88)];
    [path addCurveToPoint:CGPointMake(2.5, 11) controlPoint1:CGPointMake(0, 12.12) controlPoint2:CGPointMake(1.12, 11)];
    [path closePath];
    
    //Path color fill
    [self.tintColor setFill];
    [path fill];
}
@end
