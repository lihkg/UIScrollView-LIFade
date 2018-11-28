//
//  LIWKWebViewViewController.m
//  UIScrollView-LIFade_Example
//
//  Created by lihkg-foresight on 28/11/2018.
//  Copyright © 2018 lihkg-foresight. All rights reserved.
//

#import "LIWKWebViewViewController.h"
#import "UIScrollView+LIFade.h"

@interface LIWKWebViewViewController ()

@end

@implementation LIWKWebViewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.webView.scrollView.fade = UIEdgeInsetsMake(64, 0, 64, 0);
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"https://apple.com"]]];
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
