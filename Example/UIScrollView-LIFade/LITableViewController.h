//
//  LITableViewController.h
//  UIScrollView-LIFade_Example
//
//  Created by lihkg-foresight on 28/11/2018.
//  Copyright © 2018 lihkg-foresight. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface LITableViewController : UITableViewController
@property (nonatomic, weak) IBOutlet UITextField *topEdgeTextField;
@property (nonatomic, weak) IBOutlet UITextField *leftEdgeTextField;
@property (nonatomic, weak) IBOutlet UITextField *bottomEdgeTextField;
@property (nonatomic, weak) IBOutlet UITextField *rightEdgeTextField;
@end

NS_ASSUME_NONNULL_END
