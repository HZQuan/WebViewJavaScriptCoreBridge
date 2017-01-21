//
//  WebViewController.m
//  WebViewJavaScriptCoreBridge
//
//  Created by huangzengquan on 16/6/2.
//  Copyright © 2016年 huangzengquan. All rights reserved.
//

#import "WebViewController.h"
#import <JavaScriptCore/JavaScriptCore.h>
@interface WebViewController () <UIWebViewDelegate>
@property (nonatomic ,strong)UIWebView *webView;
@property (nonatomic ,strong)JSContext *jsContext;
@property (nonatomic ,copy)NSString *url;
@end

@implementation WebViewController

- (instancetype) initWebviewWithUrl:(NSString *)url{
    if (self = [super init]) {
        self.url = url;
        
    }
    return self;


}

- (void)viewDidLoad {
    [super viewDidLoad];
    UIWebView *webView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
    [self.view addSubview:webView];
    webView.scalesPageToFit = YES;
    webView.delegate = self;
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL fileURLWithPath:self.url]];
    [webView loadRequest:request];
    
}





- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
}

#pragma mark - webviewdelegate
- (void)webViewDidFinishLoad:(UIWebView *)webView {
    self.jsContext = [webView valueForKeyPath:@"documentView.webView.mainFrame.javaScriptContext"];
    NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"js_plugin" ofType:@"plist"];
    NSMutableDictionary *dictonary = [[NSMutableDictionary alloc] initWithContentsOfFile:plistPath];
    NSEnumerator *enumeratorkey = [dictonary keyEnumerator];
    for (NSString *key in enumeratorkey) {
        NSString *value = [dictonary objectForKey:key];
        Class objectClass = NSClassFromString(value);
        self.jsContext[key] = [[objectClass alloc] init];
    }
    
    self.jsContext.exceptionHandler = ^(JSContext *context, JSValue *exception) {
        context.exception  = exception;
        NSLog(@"jsContext错误:%@",exception);
    };
    
}



@end
