//
//  webViewController.h
//  西电网站助手for iPhone5
//
//  Created by 付国强 on 14/10/26.
//  Copyright (c) 2014年 付国强. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface webViewController : UIViewController<UIWebViewDelegate>{
    NSURLRequest * urlRequest;
    NSString *titleString;
}
@property (strong ,nonatomic) UIWebView * webView;
@property (strong ,nonatomic) UIToolbar * toolBar;
@property (strong ,nonatomic) UIActivityIndicatorView *activityView;


-(NSURLRequest *)getUrlRequest:(NSString *)Url;
-(void)getTitleString:(NSString *)string;
@end
