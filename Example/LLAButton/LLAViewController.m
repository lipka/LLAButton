//
//  LLAViewController.m
//  LLAButton
//
//  Created by Lukas Lipka on 04/17/2015.
//  Copyright (c) 2014 Lukas Lipka. All rights reserved.
//

#import "LLAViewController.h"
#import <LLAButton/LLAButton.h>

@interface LLAViewController ()

@end

@implementation LLAViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    self.view.backgroundColor = [UIColor whiteColor];
    
    LLAButton *button1 = [[LLAButton alloc] initWithFrame:CGRectMake(0, 0, 0, 56)];
    [button1 setTitle:@"Tap me" forState:UIControlStateNormal];
    [button1 setBackgroundColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    [button1 setBackgroundColor:[UIColor blackColor] forState:UIControlStateHighlighted];
    
    LLAButton *button2 = [[LLAButton alloc] initWithFrame:CGRectMake(0, 0, 0, 56)];
    button2.enabled = NO;
    [button2 setTitle:@"Tap me" forState:UIControlStateNormal];
    [button2 setBackgroundColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    [button2 setBackgroundColor:[UIColor lightGrayColor] forState:UIControlStateDisabled];
    [button2 setBackgroundColor:[UIColor blackColor] forState:UIControlStateHighlighted];
    
    LLAButton *button3 = [[LLAButton alloc] initWithFrame:CGRectMake(0, 0, 0, 56)];
    button3.hitAreaInsets = UIEdgeInsetsMake(-20, -20, -20, -20);
    [button3 setTitle:@"Tap me" forState:UIControlStateNormal];
    [button3 setBackgroundColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    [button3 setBackgroundColor:[UIColor blackColor] forState:UIControlStateHighlighted];
    [button3 setBorderColor:[UIColor yellowColor] forState:UIControlStateNormal];
    [button3 setBorderColor:[UIColor redColor] forState:UIControlStateHighlighted];
    [button3 setBorderWidth:3 forState:UIControlStateNormal];
    
    UIStackView *stackView = [[UIStackView alloc] initWithArrangedSubviews:@[button1, button2, button3]];
    stackView.axis = UILayoutConstraintAxisVertical;
    stackView.spacing = 32;
    stackView.distribution = UIStackViewDistributionEqualCentering;
    stackView.frame = self.view.bounds;
    [self.view addSubview:stackView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
