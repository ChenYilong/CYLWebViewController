//
//  ShareButton.m
//  CYLWebViewController
//
//  Created by chenyilong on 15/4/4.
//  Copyright (c) 2015年 chenyilong. All rights reserved.
//

#import "ShareButton.h"


@implementation ShareButton

- (void)drawRect:(CGRect)rect
{
    [super drawRect:rect];
    
    [self.tintColor setFill];
    
    //// Path drawing
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(7.846, 10.138)];
    [path addCurveToPoint:CGPointMake(9.201, 11.493) controlPoint1:CGPointMake(8.594, 10.138) controlPoint2:CGPointMake(9.201, 10.745)];
    [path addCurveToPoint:CGPointMake(7.846, 12.848) controlPoint1:CGPointMake(9.201, 12.241) controlPoint2:CGPointMake(8.594, 12.848)];
    [path addLineToPoint:CGPointMake(4.613, 12.848)];
    [path addCurveToPoint:CGPointMake(3.71, 13.751) controlPoint1:CGPointMake(4.114, 12.848) controlPoint2:CGPointMake(3.71, 13.252)];
    [path addLineToPoint:CGPointMake(3.71, 24.387)];
    [path addCurveToPoint:CGPointMake(4.613, 25.29) controlPoint1:CGPointMake(3.71, 24.886) controlPoint2:CGPointMake(4.114, 25.29)];
    [path addLineToPoint:CGPointMake(18.26, 25.29)];
    [path addCurveToPoint:CGPointMake(19.163, 24.387) controlPoint1:CGPointMake(18.759, 25.29) controlPoint2:CGPointMake(19.163, 24.886)];
    [path addLineToPoint:CGPointMake(19.163, 13.751)];
    [path addCurveToPoint:CGPointMake(18.26, 12.848) controlPoint1:CGPointMake(19.163, 13.252) controlPoint2:CGPointMake(18.759, 12.848)];
    [path addLineToPoint:CGPointMake(15.337, 12.848)];
    [path addCurveToPoint:CGPointMake(13.983, 11.493) controlPoint1:CGPointMake(14.589, 12.848) controlPoint2:CGPointMake(13.983, 12.241)];
    [path addCurveToPoint:CGPointMake(15.337, 10.138) controlPoint1:CGPointMake(13.983, 10.745) controlPoint2:CGPointMake(14.589, 10.138)];
    [path addLineToPoint:CGPointMake(18.26, 10.138)];
    [path addCurveToPoint:CGPointMake(21.873, 13.751) controlPoint1:CGPointMake(20.256, 10.138) controlPoint2:CGPointMake(21.873, 11.756)];
    [path addLineToPoint:CGPointMake(21.873, 24.387)];
    [path addCurveToPoint:CGPointMake(18.26, 28) controlPoint1:CGPointMake(21.873, 26.382) controlPoint2:CGPointMake(20.256, 28)];
    [path addLineToPoint:CGPointMake(4.613, 28)];
    [path addCurveToPoint:CGPointMake(1, 24.387) controlPoint1:CGPointMake(2.618, 28) controlPoint2:CGPointMake(1, 26.382)];
    [path addLineToPoint:CGPointMake(1, 13.751)];
    [path addCurveToPoint:CGPointMake(4.613, 10.138) controlPoint1:CGPointMake(1, 11.756) controlPoint2:CGPointMake(2.618, 10.138)];
    [path closePath];
    
    //Path color fill
    [path fill];
    
    //// Path2 drawing
    UIBezierPath *path2 = [UIBezierPath bezierPath];
    [path2 moveToPoint:CGPointMake(11.613, 6.186)];
    [path2 addCurveToPoint:CGPointMake(12.968, 7.541) controlPoint1:CGPointMake(12.361, 6.186) controlPoint2:CGPointMake(12.968, 6.793)];
    [path2 addLineToPoint:CGPointMake(12.968, 19.989)];
    [path2 addCurveToPoint:CGPointMake(11.613, 21.344) controlPoint1:CGPointMake(12.968, 20.737) controlPoint2:CGPointMake(12.361, 21.344)];
    [path2 addCurveToPoint:CGPointMake(10.258, 19.989) controlPoint1:CGPointMake(10.865, 21.344) controlPoint2:CGPointMake(10.258, 20.737)];
    [path2 addLineToPoint:CGPointMake(10.258, 7.541)];
    [path2 addCurveToPoint:CGPointMake(11.613, 6.186) controlPoint1:CGPointMake(10.258, 6.793) controlPoint2:CGPointMake(10.865, 6.186)];
    [path2 closePath];
    
    //Path2 color fill
    [path2 fill];
    
    //// Path3 drawing
    UIBezierPath *path3 = [UIBezierPath bezierPath];
    [path3 moveToPoint:CGPointMake(12.846, 1.397)];
    [path3 addLineToPoint:CGPointMake(17.399, 5.95)];
    [path3 addCurveToPoint:CGPointMake(17.399, 7.866) controlPoint1:CGPointMake(17.928, 6.479) controlPoint2:CGPointMake(17.928, 7.337)];
    [path3 addCurveToPoint:CGPointMake(15.483, 7.866) controlPoint1:CGPointMake(16.87, 8.395) controlPoint2:CGPointMake(16.012, 8.395)];
    [path3 addLineToPoint:CGPointMake(11.888, 4.271)];
    [path3 addLineToPoint:CGPointMake(8.293, 7.866)];
    [path3 addCurveToPoint:CGPointMake(6.377, 7.866) controlPoint1:CGPointMake(7.764, 8.395) controlPoint2:CGPointMake(6.906, 8.395)];
    [path3 addCurveToPoint:CGPointMake(6.377, 5.95) controlPoint1:CGPointMake(5.848, 7.337) controlPoint2:CGPointMake(5.848, 6.479)];
    [path3 addLineToPoint:CGPointMake(10.93, 1.396)];
    [path3 addCurveToPoint:CGPointMake(12.846, 1.397) controlPoint1:CGPointMake(11.459, .868) controlPoint2:CGPointMake(12.317, .868)];
    [path3 closePath];
    
    //Path3 color fill
    [path3 fill];
}

@end


