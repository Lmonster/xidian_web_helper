//
//  guideViewController.m
//  网页助手
//
//  Created by 付国强 on 14/10/29.
//  Copyright (c) 2014年 付国强. All rights reserved.
//

#import "guideViewController.h"
#import "ViewController.h"

@implementation guideViewController

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
    
    self.view.backgroundColor = [UIColor whiteColor];
    _ScrollView = [[UIScrollView alloc] initWithFrame:screen];
    _imageView1 = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, x, y)];
    _imageView2 = [[UIImageView alloc] initWithFrame:CGRectMake(x, 0, x, y)];
    _imageView3 = [[UIImageView alloc] initWithFrame:CGRectMake(x*2, 0, x, y)];
    _imageView4 = [[UIImageView alloc] initWithFrame:CGRectMake(x*3, 0, x, y)];
    
    _imageView1.image = [UIImage imageNamed:@"开始1.png"];
    _imageView2.image = [UIImage imageNamed:@"开始2.png"];
    _imageView3.image = [UIImage imageNamed:@"开始3.png"];
    _imageView4.image = [UIImage imageNamed:@"开始4.png"];
    _ScrollView.contentSize = CGSizeMake(x*4, y);
    _ScrollView.pagingEnabled = YES;
    _imageView1.layer.shadowColor = [[UIColor blueColor] CGColor];
    _imageView2.layer.shadowColor = [[UIColor redColor] CGColor];
    _imageView3.layer.shadowColor = [[UIColor greenColor] CGColor];
    _imageView4.layer.shadowColor = [[UIColor orangeColor] CGColor];
    _imageView1.layer.shadowPath = [[UIBezierPath bezierPathWithRect:[_imageView1 bounds]] CGPath];
    _imageView2.layer.shadowPath = [[UIBezierPath bezierPathWithRect:[_imageView2 bounds]] CGPath];
    _imageView3.layer.shadowPath = [[UIBezierPath bezierPathWithRect:[_imageView3 bounds]] CGPath];
    _imageView4.layer.shadowPath = [[UIBezierPath bezierPathWithRect:[_imageView4 bounds]] CGPath];
    _imageView1.layer.shadowOpacity = 0.3;
    _imageView2.layer.shadowOpacity = 0.3;
    _imageView3.layer.shadowOpacity = 0.3;
    _imageView4.layer.shadowOpacity = 0.3;
    
    [self.view addSubview:_ScrollView];
    [_ScrollView addSubview:_imageView1];
    [_ScrollView addSubview:_imageView2];
    [_ScrollView addSubview:_imageView3];
    [_ScrollView addSubview:_imageView4];
    
    UIButton * goIn = [[UIButton alloc] initWithFrame:CGRectMake(x*3+115, y*(3.0/4.0f), 140, 30)];
    [goIn setBackgroundColor:[UIColor clearColor]];
    [goIn addTarget:self action:@selector(goIn) forControlEvents:UIControlEventTouchDown];
    [self.ScrollView addSubview:goIn];

    
}

-(void)goIn{
    ViewController * view = [[ViewController alloc] init];
    view.navigationController.navigationBarHidden = NO;
    CATransition * transition = [[CATransition alloc] init];
    transition.type = @"rippleEffect ";
    [self.navigationController.view.layer addAnimation:transition forKey:nil];
    [self.navigationController pushViewController:view animated:NO];
}
@end
