//
//  HybridViewController.h
//  MyIOSBrain
//
//  Created by OKAR OU on 16/8/11.
//  Copyright © 2016年 OkarOu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <WebKit/WebKit.h>
#import <WebViewJavascriptBridge/WKWebViewJavascriptBridge.h>
#import "Masonry.h"

@interface HybridViewController : UIViewController<WKNavigationDelegate, WKUIDelegate>

@property (strong, nonatomic) WKWebView *hybridWebView;
@property (strong, nonatomic) WKWebViewJavascriptBridge *bridge;

@end
