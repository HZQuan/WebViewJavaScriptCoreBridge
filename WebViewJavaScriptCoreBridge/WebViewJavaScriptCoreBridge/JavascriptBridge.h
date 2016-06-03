//
//  JavascriptBridge.h
//  WebViewJavaScriptCoreBridge
//
//  Created by huangzengquan on 16/6/3.
//  Copyright © 2016年 huangzengquan. All rights reserved.
//

#import <JavaScriptCore/JavaScriptCore.h>
@protocol WebViewBridgeDelegate <JSExport>

- (void)processRequestWithData:(NSDictionary *)diconary callback:(JSValue *)value;
- (void)processRequestWithJson:(NSDictionary *)dictonary;
@end
