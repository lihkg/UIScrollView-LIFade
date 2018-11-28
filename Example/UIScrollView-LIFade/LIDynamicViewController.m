//
//  LIDynamicViewController.m
//  UIScrollView-LIFade_Example
//
//  Created by lihkg-foresight on 11/27/2018.
//  Copyright (c) 2018 lihkg-foresight. All rights reserved.
//

#import "LIDynamicViewController.h"
#import "UIScrollView+LIFade.h"

@interface LIDynamicViewController ()

@end

@implementation LIDynamicViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    [self updateFadeLayout];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)fadeSwitchValueChanged:(UISwitch *)sender
{
    [self updateFadeLayout];
}

- (void)updateFadeLayout {
    UIEdgeInsets fadeEdgeInsets = self.fadeEdgeInsets;
    if (!self.verticalSwitch.on) {
        fadeEdgeInsets.top = 0;
        fadeEdgeInsets.bottom = 0;
    }
    if (!self.horizontalSwitch.on) {
        fadeEdgeInsets.left = 0;
        fadeEdgeInsets.right = 0;
    }
    self.scrollView.fade = fadeEdgeInsets;
}

@end
