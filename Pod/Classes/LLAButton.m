//
//  LLAButton.m
//  LLAButton
//
//  Created by Lukas Lipka on 13/02/14.
//  Copyright (c) 2014 Lukas Lipka. All rights reserved.
//

#import "LLAButton.h"

@interface LLAButton ()

@property (nonatomic, readonly) NSMutableDictionary *stateConfigurations;

@end

@implementation LLAButton

@synthesize stateConfigurations = _stateConfigurations;

#pragma mark - UIControl

- (void)setHighlighted:(BOOL)highlighted {
    [super setHighlighted:highlighted];
    [self updateWithConfigurationForCurrentState];
}

- (void)setSelected:(BOOL)selected {
    [super setSelected:selected];
    [self updateWithConfigurationForCurrentState];
}

- (void)setEnabled:(BOOL)enabled {
    [super setEnabled:enabled];
    [self updateWithConfigurationForCurrentState];
}

#pragma mark - UIView

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    if (!UIEdgeInsetsEqualToEdgeInsets (self.hitAreaInsets, UIEdgeInsetsZero)) {
        CGRect extendedHitArea = UIEdgeInsetsInsetRect(self.bounds, self.hitAreaInsets);
        return CGRectContainsPoint(extendedHitArea, point) ? self : nil;
    }

    return [super hitTest:point withEvent:event];
}

#pragma mark - Public

- (void)setBackgroundColor:(UIColor *)backgroundColor forState:(UIControlState)state {
    [self setValue:backgroundColor forKeyPath:@"backgroundColor" state:state];
}

- (void)setBorderColor:(UIColor *)borderColor forState:(UIControlState)state {
    [self setValue:(id)borderColor.CGColor forKeyPath:@"layer.borderColor" state:state];
}

- (void)setBorderWidth:(CGFloat)borderWidth forState:(UIControlState)state {
    [self setValue:@(borderWidth) forKeyPath:@"layer.borderWidth" state:state];
}

- (void)setTintColor:(UIColor *)tintColor forState:(UIControlState)state {
    [self setValue:tintColor forKeyPath:@"tintColor" state:state];
}

#pragma mark - Private

- (NSMutableDictionary *)stateConfigurationForState:(UIControlState)state {
    NSMutableDictionary *stateConfiguration = self.stateConfigurations[@(state)];
    if (!stateConfiguration) {
        stateConfiguration = [NSMutableDictionary new];
        self.stateConfigurations[@(state)] = stateConfiguration;
    }
    return stateConfiguration;
}

- (void)setValue:(id)value forKeyPath:(NSString *)keyPath state:(UIControlState)state {
    NSMutableDictionary *stateConfiguration = [self stateConfigurationForState:state];
    stateConfiguration[keyPath] = value;
    [self updateWithConfigurationForCurrentState];
}

- (void)updateWithConfigurationForCurrentState {
    NSDictionary *normalStateConfiguration = [self stateConfigurationForState:UIControlStateNormal];
    NSDictionary *currentStateConfiguration = [self stateConfigurationForState:self.state];
    NSMutableDictionary *stateConfiguration = [NSMutableDictionary new];
    [stateConfiguration addEntriesFromDictionary:normalStateConfiguration];
    [stateConfiguration addEntriesFromDictionary:currentStateConfiguration];
    [stateConfiguration enumerateKeysAndObjectsUsingBlock:^(NSString *key, id object, BOOL *stop) {
        [self setValue:object forKeyPath:key];
    }];
}

#pragma mark - Properties

- (NSMutableDictionary *)stateConfigurations {
    if (!_stateConfigurations) {
        _stateConfigurations = [NSMutableDictionary new];
    }
    return _stateConfigurations;
}

@end
