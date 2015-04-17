//
//  LLAButton.m
//  LLAButton
//
//  Created by Lukas Lipka on 13/02/14.
//  Copyright (c) 2014 Lukas Lipka. All rights reserved.
//

#import "LLAButton.h"

@interface LLAButton ()

@property (nonatomic, strong) NSMutableDictionary *backgroundColorStates;
@property (nonatomic, strong) NSMutableDictionary *borderColorStates;

@end

@implementation LLAButton

- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self addTarget:self action:@selector(didTouchUp:) forControlEvents:UIControlEventTouchUpInside];
        [self addTarget:self action:@selector(didTouchUp:) forControlEvents:UIControlEventTouchUpOutside];
        [self addTarget:self action:@selector(didTouchUp:) forControlEvents:UIControlEventTouchDragExit];
        [self addTarget:self action:@selector(didTouchDown:) forControlEvents:UIControlEventTouchDragEnter];
        [self addTarget:self action:@selector(didTouchDown:) forControlEvents:UIControlEventTouchDown];
    }
    return self;
}

- (void)setBackgroundColor:(UIColor *)backgroundColor forState:(UIControlState)state {
    if (state == UIControlStateNormal) {
        self.backgroundColor = backgroundColor;
    }
    
    if (!self.backgroundColorStates) {
        self.backgroundColorStates = [NSMutableDictionary new];
    }
    
    [self.backgroundColorStates setObject:backgroundColor forKey:[NSNumber numberWithInt:state]];
}

- (void)setBorderColor:(UIColor *)borderColor forState:(UIControlState)state {
    if (state == UIControlStateNormal) {
        self.layer.borderColor = borderColor.CGColor;
    }
    
    if (!self.borderColorStates) {
        self.borderColorStates = [NSMutableDictionary new];
    }
    
    [self.borderColorStates setObject:borderColor forKey:[NSNumber numberWithInt:state]];
}

- (void)setEnabled:(BOOL)enabled {
    [super setEnabled:enabled];
    
    UIColor *backgroundColor = [self.backgroundColorStates objectForKey:@(UIControlStateDisabled)];
    [self updateBackgroundColor:backgroundColor animated:NO];
    
    UIColor *borderColor = [self.borderColorStates objectForKey:@(UIControlStateDisabled)];
    [self updateBorderColor:borderColor animated:NO];
}

#pragma mark - Private

- (void)didTouchDown:(id)sender {
    UIColor *backgroundColor = [self.backgroundColorStates objectForKey:@(UIControlStateHighlighted)];
    [self updateBackgroundColor:backgroundColor animated:NO];
    
    UIColor *borderColor = [self.borderColorStates objectForKey:@(UIControlStateHighlighted)];
    [self updateBorderColor:borderColor animated:NO];
}

- (void)didTouchUp:(id)sender {
    UIColor *backgroundColor = [self.backgroundColorStates objectForKey:@(UIControlStateNormal)];
    [self updateBackgroundColor:backgroundColor animated:YES];
    
    UIColor *borderColor = [self.borderColorStates objectForKey:@(UIControlStateNormal)];
    [self updateBorderColor:borderColor animated:YES];
}

- (void)updateBackgroundColor:(UIColor *)color animated:(BOOL)animated {
    if (!color)
        return;
    
    if (animated) {
        [UIView animateWithDuration:0.3f delay:0 options:UIViewAnimationOptionBeginFromCurrentState animations:^{
            UIColor *backgroundColor = [self.backgroundColorStates objectForKey:@(UIControlStateNormal)];
            if (backgroundColor) {
                self.backgroundColor = color;
            }
        } completion:nil];
    } else {
        self.backgroundColor = color;
    }
}

- (void)updateBorderColor:(UIColor *)color animated:(BOOL)animated {
    if (!color)
        return;
    
    if (animated) {
        CABasicAnimation *animation = [CABasicAnimation animation];
        animation.duration = 0.3f;
        animation.keyPath = NSStringFromSelector(@selector(borderColor));
        animation.toValue = (id)color.CGColor;
        animation.fillMode = kCAFillModeForwards;
        [self.layer addAnimation:animation forKey:@"borderColor"];
        self.layer.borderColor = color.CGColor;
    } else {
        [self.layer removeAnimationForKey:@"borderColor"];
        self.layer.borderColor = color.CGColor;
    }
}

@end
