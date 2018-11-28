//
//  LIWKWebViewViewController.h
//  UIScrollView-LIFade_Example
//
//  Created by lihkg-foresight on 28/11/2018.
//  Copyright © 2018 lihkg-foresight. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <WebKit/WebKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface LIWKWebViewViewController : UIViewController
@property (nonatomic, weak) IBOutlet WKWebView *webView;
@property (nonatomic, assign) UIEdgeInsets fadeEdgeInsets;
@end

NS_ASSUME_NONNULL_END
