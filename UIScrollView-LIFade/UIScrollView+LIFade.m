//
//  UIScrollView+LIFade.m
//  UIScrollView-LIFade
//
//  Created by lihkg-foresight on 26/11/2018.
//  Copyright © 2018 lihkg-foresight. All rights reserved.
//

#import "UIScrollView+LIFade.h"
#import <objc/runtime.h>

static void *LIFadeKey = &LIFadeKey;
static void *LIFadeProgressKey = &LIFadeProgressKey;
static void *LIFadeContainerLayerKey = &LIFadeContainerLayerKey;
static void *LIHorizontalFadeLayerKey = &LIHorizontalFadeLayerKey;
static void *LIVerticalFadeLayerKey = &LIVerticalFadeLayerKey;

@implementation UIScrollView (LIFade)

#pragma mark - Swizzle

+ (void)load {
    method_exchangeImplementations(class_getInstanceMethod(self.class, NSSelectorFromString(@"dealloc")),
                                   class_getInstanceMethod(self.class, @selector(li_fadeSwizzledDealloc)));
}

- (void)li_fadeSwizzledDealloc {
    if (objc_getAssociatedObject(self, LIFadeKey) != nil) {
        @try {
            [self removeObserver:self forKeyPath:@"contentOffset"];
            [self removeObserver:self forKeyPath:@"frame"];
            [self removeObserver:self forKeyPath:@"bounds"];
        }
        @catch (NSException *exception) {
        }
    }
    [self li_fadeSwizzledDealloc];
}

#pragma mark - Property

- (UIEdgeInsets)fade {
    NSValue *value = objc_getAssociatedObject(self, LIFadeKey);
    return value ? [value UIEdgeInsetsValue] : UIEdgeInsetsZero;
}

- (void)setFade:(UIEdgeInsets)fade {
    if (objc_getAssociatedObject(self, LIFadeKey) == nil) {
        [self addObserver:self forKeyPath:@"contentOffset" options:NSKeyValueObservingOptionNew context:nil];
        [self addObserver:self forKeyPath:@"frame" options:NSKeyValueObservingOptionNew context:nil];
        [self addObserver:self forKeyPath:@"bounds" options:NSKeyValueObservingOptionNew context:nil];
    }
    objc_setAssociatedObject(self, LIFadeKey, [NSValue valueWithUIEdgeInsets:fade], OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    if (UIEdgeInsetsEqualToEdgeInsets(fade, UIEdgeInsetsZero) == NO) {
        self.layer.mask = self.fadeContainerLayer;
    } else {
        self.layer.mask = nil;
    }
    [self li_updateFadeProgress];
}

- (UIEdgeInsets)li_fadeProgress {
    NSValue *value = objc_getAssociatedObject(self, LIFadeProgressKey);
    return value ? [value UIEdgeInsetsValue] : UIEdgeInsetsZero;
}

- (void)setLi_fadeProgress:(UIEdgeInsets)li_fadeProgress {
    objc_setAssociatedObject(self, LIFadeProgressKey, [NSValue valueWithUIEdgeInsets:li_fadeProgress], OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

#pragma mark - Fade Layers

- (CALayer *)fadeContainerLayer {
    CALayer *_layer = objc_getAssociatedObject(self, LIFadeContainerLayerKey);
    if (!_layer) {
        _layer = [CALayer layer];
        _layer.backgroundColor = [UIColor clearColor].CGColor;
        self.verticalFadeLayer.mask = self.horizontalFadeLayer;
        [_layer addSublayer:self.verticalFadeLayer];
        objc_setAssociatedObject(self, LIFadeContainerLayerKey, _layer, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return _layer;
}

- (CAGradientLayer *)horizontalFadeLayer {
    CAGradientLayer *_fadeLayer = objc_getAssociatedObject(self, LIHorizontalFadeLayerKey);
    if (!_fadeLayer) {
        _fadeLayer = [CAGradientLayer layer];
        _fadeLayer.colors = @[ (id)[UIColor clearColor].CGColor, (id)[UIColor whiteColor].CGColor, (id)[UIColor whiteColor].CGColor, (id)[UIColor clearColor].CGColor ];
        _fadeLayer.startPoint = CGPointMake(0.0, 0.5);
        _fadeLayer.endPoint = CGPointMake(1.0, 0.5);
        objc_setAssociatedObject(self, LIHorizontalFadeLayerKey, _fadeLayer, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return _fadeLayer;
}

- (CAGradientLayer *)verticalFadeLayer {
    CAGradientLayer *_fadeLayer = objc_getAssociatedObject(self, LIVerticalFadeLayerKey);
    if (!_fadeLayer) {
        _fadeLayer = [CAGradientLayer layer];
        _fadeLayer.colors = @[ (id)[UIColor clearColor].CGColor, (id)[UIColor whiteColor].CGColor, (id)[UIColor whiteColor].CGColor, (id)[UIColor clearColor].CGColor ];
        _fadeLayer.startPoint = CGPointMake(0.5, 0.0);
        _fadeLayer.endPoint = CGPointMake(0.5, 1.0);
        objc_setAssociatedObject(self, LIVerticalFadeLayerKey, _fadeLayer, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return _fadeLayer;
}

#pragma mark - Private Method

- (void)li_updateFadeProgress {
    if (objc_getAssociatedObject(self, LIFadeKey) == nil)
        return;
    
    self.li_fadeProgress = UIEdgeInsetsMake(MAX(0, MIN(1, (self.contentOffset.y + self.contentInset.top) / self.fade.top)),
                                            MAX(0, MIN(1, (self.contentOffset.x + self.contentInset.left) / self.fade.left)),
                                            MAX(0, MIN(1, (self.contentSize.height - (self.contentOffset.y - self.contentInset.bottom) - self.bounds.size.height) / self.fade.bottom)),
                                            MAX(0, MIN(1, (self.contentSize.width - (self.contentOffset.x - self.contentInset.right) - self.bounds.size.width) / self.fade.right)));
    
    [CATransaction begin];
    [CATransaction setDisableActions:YES];
    [self li_layoutFade];
    [CATransaction commit];
}

- (void)li_layoutFade {
    UIEdgeInsets fade = self.fade;
    if (UIEdgeInsetsEqualToEdgeInsets(fade, UIEdgeInsetsZero))
        return;
    
    CGRect frame = CGRectMake(self.contentInset.left + self.contentOffset.x,
                              self.contentInset.top + self.contentOffset.y,
                              self.bounds.size.width - self.contentInset.left - self.contentInset.right,
                              self.bounds.size.height - self.contentInset.top - self.contentInset.bottom);
    self.fadeContainerLayer.frame = frame;
    
    CGRect bounds = self.fadeContainerLayer.bounds;
    self.verticalFadeLayer.frame = bounds;
    self.horizontalFadeLayer.frame = bounds;
    
    CGFloat topScale = (self.li_fadeProgress.top * fade.top) / frame.size.height;
    CGFloat bottomScale = (self.li_fadeProgress.bottom * fade.bottom) / frame.size.height;
    self.verticalFadeLayer.locations = @[ @0.0f, @(topScale), @(1 - bottomScale), @1.f ];
    
    CGFloat leftScale = (self.li_fadeProgress.left * fade.left) / frame.size.width;
    CGFloat rightScale = (self.li_fadeProgress.right * fade.right) / frame.size.width;
    self.horizontalFadeLayer.locations = @[ @0.0f, @(leftScale), @(1 - rightScale), @1.f ];
}

#pragma mark - KVO

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    if (object == self) {
        [self li_updateFadeProgress];
    }
}

@end
