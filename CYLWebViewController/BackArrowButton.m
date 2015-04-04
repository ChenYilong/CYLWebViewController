//
//  BackArrowButton.m
//  CYLWebViewController
//
//  Created by chenyilong on 15/4/4.
//  Copyright (c) 2015年 chenyilong. All rights reserved.
//

#import "BackArrowButton.h"


@implementation BackArrowButton

- (void)drawRect:(CGRect)rect
{
    [super drawRect:rect];
    
    //// Path drawing
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(32.5, 11)];
    [path addLineToPoint:CGPointMake(8.5, 11)];
    [path addLineToPoint:CGPointMake(14.275, 5.225)];
    [path addCurveToPoint:CGPointMake(15, 3.5) controlPoint1:CGPointMake(14.768, 4.733) controlPoint2:CGPointMake(15, 4.145)];
    [path addCurveToPoint:CGPointMake(12.5, 1) controlPoint1:CGPointMake(15, 2.27) controlPoint2:CGPointMake(13.984, 1)];
    [path addCurveToPoint:CGPointMake(10.775, 1.725) controlPoint1:CGPointMake(11.836, 1) controlPoint2:CGPointMake(11.258, 1.241)];
    [path addLineToPoint:CGPointMake(.828, 11.672)];
    [path addCurveToPoint:CGPointMake(0, 13.5) controlPoint1:CGPointMake(.418, 12.082) controlPoint2:CGPointMake(0, 12.589)];
    [path addCurveToPoint:CGPointMake(.808, 15.309) controlPoint1:CGPointMake(0, 14.411) controlPoint2:CGPointMake(.349, 14.85)];
    [path addLineToPoint:CGPointMake(10.775, 25.275)];
    [path addCurveToPoint:CGPointMake(12.5, 26) controlPoint1:CGPointMake(11.258, 25.759) controlPoint2:CGPointMake(11.836, 26)];
    [path addCurveToPoint:CGPointMake(15, 23.5) controlPoint1:CGPointMake(13.985, 26) controlPoint2:CGPointMake(15, 24.73)];
    [path addCurveToPoint:CGPointMake(14.275, 21.775) controlPoint1:CGPointMake(15, 22.855) controlPoint2:CGPointMake(14.768, 22.267)];
    [path addLineToPoint:CGPointMake(8.5, 16)];
    [path addLineToPoint:CGPointMake(32.5, 16)];
    [path addCurveToPoint:CGPointMake(35, 13.5) controlPoint1:CGPointMake(33.88, 16) controlPoint2:CGPointMake(35, 14.88)];
    [path addCurveToPoint:CGPointMake(32.5, 11) controlPoint1:CGPointMake(35, 12.12) controlPoint2:CGPointMake(33.88, 11)];
    [path closePath];
    
    //Path color fill
    [self.tintColor setFill];
    [path fill];
}

@end

