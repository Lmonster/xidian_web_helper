//
//  webViewController.m
//  西电网站助手for iPhone5
//
//  Created by 付国强 on 14/10/26.
//  Copyright (c) 2014年 付国强. All rights reserved.
//

#import "webViewController.h"
#import "dataModal.h"

@implementation webViewController

-(id)init{
    self = [super init];
    if(self){
        
    }
    return self;
}

-(void)viewDidLoad{
    [super viewDidLoad];
    CGRect screen = [[UIScreen mainScreen] bounds];
    float x = screen.size.width;
    float y =screen.size.height;
    
    
    _activityView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    
    
    self.title = titleString;

    _toolBar = [[UIToolbar alloc] initWithFrame:CGRectMake(0,y-60, x, 60)];
    _webView.delegate = self;
    _webView.scalesPageToFit = YES;
    
    UIBarButtonItem * item1 = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"navigationbar_back.png"]
                                                               style:UIBarButtonItemStylePlain
                                                              target:self
                                                              action:@selector(back)];
    
    UIBarButtonItem *item2 = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"refresh.png"]
                                                              style:UIBarButtonItemStylePlain
                                                             target:self
                                                             action:@selector(refresh)];
    
    UIBarButtonItem *item3 = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"navigationbar_forward.png"]
                                                              style:UIBarButtonItemStylePlain
                                                             target:self
                                                             action:@selector(forward)];
    
    
    UIBarButtonItem * space =[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace
                                                                           target:nil
                                                                           action:nil];
                              
    NSArray * items = [NSArray arrayWithObjects:item1,space,item2,space,item3, nil];
    _toolBar.items = items;

    [self.view addSubview:_toolBar];

}


#pragma webView协议的实现


-(void)webViewDidStartLoad:(UIWebView *)webView{
    [_activityView startAnimating];
}
-(void)webViewDidFinishLoad:(UIWebView *)webView{
    [_activityView stopAnimating];
}

#pragma 按钮的响应

-(void)back{
    [_webView goBack];
    
}

-(void)refresh{
    [_webView reload];
    
}
-(void)forward{
    [_webView goForward];
    
}
-(void)exit{
    [self.navigationController popViewControllerAnimated:YES];
}

-(NSURLRequest *)getUrlRequest:(NSString *)Url{
    CGRect screen = [[UIScreen mainScreen] bounds];
    float x = screen.size.width;
    float y =screen.size.height;
    _webView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 65, x,y-120)];
    [self.view addSubview:_webView];
    [_webView addSubview:_activityView];
    _activityView.frame = CGRectMake(160, 232, 20, 20);
    NSURL *urls = [NSURL URLWithString:Url];
    NSURLRequest * request = [NSURLRequest requestWithURL:urls];
    [_webView loadRequest:request];
    return request;
}

-(void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error{
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"❌"
                                                        message:[error localizedDescription]
                                                       delegate:nil
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil, nil];
    [alertView show];
}

-(void)getTitleString:(NSString *)string{
   
    titleString = string;
    
}

@end
