//
//  TestModel.m
//  WebViewJavaScriptCoreBridge
//
//  Created by huangzengquan on 16/6/2.
//  Copyright © 2016年 huangzengquan. All rights reserved.
//

#import "TestModel.h"
#import "WebViewController.h"

@implementation TestModel
//processRequestWithDataCallback(,);



- (void)processRequestWithData:(NSDictionary *)diconary callback:(JSValue *)value{
    NSLog(@"%@",diconary);
    NSMutableArray *array = [NSMutableArray array];
    [array addObject:[NSArray arrayWithObjects:@"oc传过来的数据一",@"oc传过来的数据二",@"oc传过来的数据三",nil]];
    [value callWithArguments:array];
}
- (void)processRequestWithJson:(NSDictionary *)dictonary {
    NSString *title = dictonary[@"title"];
    NSString *message = dictonary[@"message"];
    UIAlertView *alertView =[[UIAlertView alloc] initWithTitle:title message:message delegate:self cancelButtonTitle:@"cancal" otherButtonTitles: nil];
    [alertView show];
}

@end
