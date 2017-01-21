//
//  WebViewController.h
//  WebViewJavaScriptCoreBridge
//
//  Created by huangzengquan on 16/6/2.
//  Copyright © 2016年 huangzengquan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <JavaScriptCore/JavaScriptCore.h>



@interface WebViewController : UIViewController
- (instancetype) initWebviewWithUrl:(NSString *)url;
@end
