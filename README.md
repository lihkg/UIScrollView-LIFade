# UIScrollView-LIFade

[![CI Status](https://img.shields.io/travis/lihkg/UIScrollView-LIFade.svg?style=flat)](https://travis-ci.org/lihkg/UIScrollView-LIFade)
[![Version](https://img.shields.io/cocoapods/v/UIScrollView-LIFade.svg?style=flat)](https://cocoapods.org/pods/UIScrollView-LIFade)
[![License](https://img.shields.io/cocoapods/l/UIScrollView-LIFade.svg?style=flat)](https://cocoapods.org/pods/UIScrollView-LIFade)
[![Platform](https://img.shields.io/cocoapods/p/UIScrollView-LIFade.svg?style=flat)](https://cocoapods.org/pods/UIScrollView-LIFade)

UIScrollView-LIFade is a lightweight, fancy and non-intrusive `UIScrollView` fade effect category.

## Features

- Lightweight: This library contains only 2 files.
- Easy-to-use: Just one line of code can add a fade effect to any of scrollview.
- Non-intrusive: There is no need to make the `UIScrollView` class inherit from other base class.
- Category: Works on all of `UIScrollView` including `UITextView`, `UITableView`, `UICollectionView` or `UI/WKWebView` (scrollView), etc.

## Screeshot

![UIScrollView Example](https://github.com/lihkg/UIScrollView-LIFade/raw/master/README-images/UIScrollView-example.gif)
![UITextView Example](https://github.com/lihkg/UIScrollView-LIFade/raw/master/README-images/UITextView-example.gif)

## Showcase

![LIHKG Menu](https://github.com/lihkg/UIScrollView-LIFade/raw/master/README-images/lihkg-menu-showcase.gif)

## Usage

UIScrollView-LIFade add a `fade` property to `UIScrollView` witch is a `UIEdgeInsets` to represent the fading insets.

```objc
#import "UIScrollView+LIFade.h"
```

```objc
UIScrollView *scrollView;
scrollView.fade = UIEdgeInsetsMake(64, 0, 64, 0); //Fade vertically (top 64 and bottom 64)
scrollView.fade = UIEdgeInsetsMake(0, 64, 0, 64); //Fade horizontally (left 64 and right 64)
scrollView.fade = UIEdgeInsetsMake(64, 64, 64, 64); //Fade 4 edges with 64
scrollView.fade = UIEdgeZero; //Remove fade effect
```

For webview (`WKWebView` or `UIWebView`)
```objc
WKWebView *webView;
webView.scrollView.fade = UIEdgeInsetsMake(64, 0, 64, 0);
```

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

Only tested on iOS 8 or higher.

## Installation

### CocoaPods

1. Add `pod 'UIScrollView-LIFade'` to your Podfile.
2. Run `pod install` or `pod update`.

### Manually

1. Put `UIScrollView+LIFade.h` and `UIScrollView+LIFade.m` to  your Xcode project.

## License

UIScrollView-LIFade is available under the MIT license. See the LICENSE file for more info.
