//
//  HybridViewController.m
//  MyIOSBrain
//
//  Created by OKAR OU on 16/8/11.
//  Copyright © 2016年 OkarOu. All rights reserved.
//

#import "HybridViewController.h"

@interface HybridViewController ()

@end

@implementation HybridViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initBridge];
    [self initWebView];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)initWebView {
    _hybridWebView = [[WKWebView alloc] init];
    _hybridWebView.scrollView.scrollEnabled = NO;
    _hybridWebView.backgroundColor = [UIColor whiteColor];
    //    _hybridWebView.UIDelegate = self;
    //    _hybridWebView.navigationDelegate = self;
    NSString *htmlPath = [[NSBundle mainBundle] pathForResource:@"index" ofType:@"html" inDirectory:@"www/html/Main"];
    NSString *appHtml = [NSString stringWithContentsOfFile:htmlPath encoding:NSUTF8StringEncoding error:nil];
    NSURL *baseURL = [NSURL fileURLWithPath:htmlPath];
    [_hybridWebView loadHTMLString:appHtml baseURL:baseURL];
    [self.view addSubview:_hybridWebView];
    [_hybridWebView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.left.right.equalTo(self.view);
    }];
}

- (void)initBridge {
    _bridge = [WKWebViewJavascriptBridge bridgeForWebView:_hybridWebView];
}
//
//#pragma mark - WKWebView delegate and handler
//// 页面开始加载时调用
//- (void)webView:(WKWebView *)webView didStartProvisionalNavigation:(WKNavigation *)navigation {
//    
//}
//
//// 当内容开始返回时调用
//- (void)webView:(WKWebView *)webView didCommitNavigation:(WKNavigation *)navigation {
//    
//}
//
//// 页面加载完成之后调用
//- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation {
//    
//}
//
//// 页面加载失败时调用
//- (void)webView:(WKWebView *)webView didFailProvisionalNavigation:(WKNavigation *)navigation {
//    
//}
//
//// 接收到服务器跳转请求之后调用
//- (void)webView:(WKWebView *)webView didReceiveServerRedirectForProvisionalNavigation:(WKNavigation *)navigation {
//    
//}
//
//// 在收到响应后，决定是否跳转
//- (void)webView:(WKWebView *)webView decidePolicyForNavigationResponse:(WKNavigationResponse *)navigationResponse decisionHandler:(void (^)(WKNavigationResponsePolicy))decisionHandler {
//    
//}
//
//// 在发送请求之前，决定是否跳转
//- (void)webView:(WKWebView *)webView decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction decisionHandler:(void (^)(WKNavigationActionPolicy))decisionHandler {
//    
//}
//
///**
// *  web界面中有弹出警告框时调用
// *
// *  @param webView           实现该代理的webview
// *  @param message           警告框中的内容
// *  @param frame             主窗口
// *  @param completionHandler 警告框消失调用
// */
//- (void)webView:(WKWebView *)webView runJavaScriptAlertPanelWithMessage:(NSString *)message initiatedByFrame:(void (^)())completionHandler {
//    
//}

@end
