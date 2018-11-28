//
//  LITableViewController.m
//  UIScrollView-LIFade_Example
//
//  Created by lihkg-foresight on 28/11/2018.
//  Copyright © 2018 lihkg-foresight. All rights reserved.
//

#import "LITableViewController.h"
#import "LIDynamicViewController.h"
#import "LIWKWebViewViewController.h"

@interface LITableViewController ()

@end

@implementation LITableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (UIEdgeInsets)fadeEdgeInsets {
    return UIEdgeInsetsMake([self.topEdgeTextField.text floatValue], [self.leftEdgeTextField.text floatValue], [self.bottomEdgeTextField.text floatValue], [self.rightEdgeTextField.text floatValue]);
}

#pragma mark - UIStoryboard

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"dynamic"]) {
        LIDynamicViewController *vc = segue.destinationViewController;
        vc.fadeEdgeInsets = [self fadeEdgeInsets];
    }
}

@end
