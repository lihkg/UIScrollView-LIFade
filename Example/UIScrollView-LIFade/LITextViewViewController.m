//
//  LITextViewViewController.m
//  UIScrollView-LIFade_Example
//
//  Created by lihkg-foresight on 28/11/2018.
//  Copyright © 2018 lihkg-foresight. All rights reserved.
//

#import "LITextViewViewController.h"
#import "UIScrollView+LIFade.h"

@interface LITextViewViewController ()

@end

@implementation LITextViewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.textView.fade = UIEdgeInsetsMake(88, 0, 88, 0);

    //Fix for UITextView initial contentOffset bug
    __weak UITextView *weakTextView = self.textView;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        weakTextView.contentOffset = CGPointMake(-weakTextView.contentInset.left, -weakTextView.contentInset.top);
    });
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
