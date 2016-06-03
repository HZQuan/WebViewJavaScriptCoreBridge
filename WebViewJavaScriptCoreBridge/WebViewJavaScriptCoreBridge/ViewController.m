//
//  ViewController.m
//  WebViewJavaScriptCoreBridge
//
//  Created by huangzengquan on 16/6/2.
//  Copyright © 2016年 huangzengquan. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
- (IBAction)click:(id)sender;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)click:(id)sender {
    NSString *url = [[NSBundle mainBundle] pathForResource:@"test" ofType:@"html"];
    WebViewController* webViewController = [[WebViewController alloc] initWebviewWithUrl:url];
    [self presentViewController:webViewController animated:YES completion:^{
        
    }];

}
@end
