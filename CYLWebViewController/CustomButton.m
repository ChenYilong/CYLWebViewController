//
//  CustomButton.m
//  CYLWebViewController
//
//  Created by chenyilong on 15/4/4.
//  Copyright (c) 2015年 chenyilong. All rights reserved.
//

#import "CustomButton.h"

#define floatVal(val) ((float)val/(float)255)
#define lightBlueColor [UIColor colorWithRed:floatVal(1) green:floatVal(126) blue:floatVal(204) alpha:1.0f]
@implementation CustomButton

- (void)setEnabled:(BOOL)enabled
{
    [super setEnabled:enabled];
    
    [UIView transitionWithView:self
                      duration:0.2f
                       options:UIViewAnimationOptionTransitionCrossDissolve
                    animations:^{
                        self.tintColor = (enabled) ? lightBlueColor : [UIColor grayColor];
                    }
                    completion:nil];
}

@end

