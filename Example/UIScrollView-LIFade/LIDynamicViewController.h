//
//  LIDynamicViewController.h
//  UIScrollView-LIFade_Example
//
//  Created by lihkg-foresight on 11/27/2018.
//  Copyright (c) 2018 lihkg-foresight. All rights reserved.
//

@import UIKit;

@interface LIDynamicViewController : UIViewController
@property (nonatomic, weak) IBOutlet UIScrollView *scrollView;
@property (nonatomic, weak) IBOutlet UISwitch *horizontalSwitch;
@property (nonatomic, weak) IBOutlet UISwitch *verticalSwitch;
@property (nonatomic, assign) UIEdgeInsets fadeEdgeInsets;
@end
