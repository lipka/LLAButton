//
//  LLAButton.m
//  LLAButton
//
//  Created by Lukas Lipka on 13/02/14.
//  Copyright (c) 2014 Lukas Lipka. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LLAButton : UIButton

@property (nonatomic) UIEdgeInsets hitAreaInsets;

- (void)setBackgroundColor:(UIColor *)backgroundColor forState:(UIControlState)state;
- (void)setBorderColor:(UIColor *)borderColor forState:(UIControlState)state;
- (void)setBorderWidth:(CGFloat)borderWidth forState:(UIControlState)state;
- (void)setTintColor:(UIColor *)tintColor forState:(UIControlState)state;

@end
