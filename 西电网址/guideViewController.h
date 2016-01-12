//
//  guideViewController.h
//  网页助手
//
//  Created by 付国强 on 14/10/29.
//  Copyright (c) 2014年 付国强. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface guideViewController : UIViewController


#define SCROLLVIEWFRAME CGRectMake(-13,-20,382,590)
#define IMAGEVIEWFRAME1 CGRectMake(0,0,382,570)
#define IMAGEVIEWFRAME2 CGRectMake(366,0,382,570)
#define IMAGEVIEWFRAME3 CGRectMake(730,0,392,570)
#define IMAGEVIEWFRAME4 CGRectMake(1127,0,382,570)

@property (strong ,nonatomic) UIScrollView *ScrollView;
@property (strong ,nonatomic) UIImageView *imageView1;
@property (strong ,nonatomic) UIImageView *imageView2;
@property (strong ,nonatomic) UIImageView *imageView3;
@property (strong ,nonatomic) UIImageView *imageView4;

@end
