//
//  ViewController.h
//  网页助手
//
//  Created by 付国强 on 14/10/28.
//  Copyright (c) 2014年 付国强. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UIScrollViewDelegate>

#define SCROLVIEWFRAME CGRectMake(0,65,320,520)
#define BUTTON1FRAME CGRectMake(0,0,197,75)
#define BUTTON2FRAME CGRectMake(0,90,197,75)
#define BUTTON3FRAME CGRectMake(200,0,120,160)
#define BUTTON4FRAME CGRectMake(0,175,125,130)
#define BUTTON5FRAME CGRectMake(135,175,180,130)
#define BUTTON6FRAME CGRectMake(0,315,80,193)
#define BUTTON7FRAME CGRectMake(90,320,140,85)
#define BUTTON8FRAME CGRectMake(90,420,140,94)
#define BUTTON9FRAME CGRectMake(240,320,80,200)

#define BUTTON10FRAME CGRectMake(320,0,150,140)
#define BUTTON11FRAME CGRectMake(480,0,155,140)
#define BUTTON12FRAME CGRectMake(320,142,100,105)
#define BUTTON13FRAME CGRectMake(425,142,124,128)
#define BUTTON14FRAME CGRectMake(320,252,100,120)
#define BUTTON15FRAME CGRectMake(425,278,126,100)
#define BUTTON16FRAME CGRectMake(560,142,90,180)
#define BUTTON17FRAME CGRectMake(320,380,130,200)
#define BUTTON18FRAME CGRectMake(455,380,100,200)
#define BUTTON19FRAME CGRectMake(560,335,90,200)


#define BACKGROUNDIMAGE1 CGRectMake(0,0,320,520)
#define BACKGROUNDIMAGE2 CGRectMake(320,0,320,520)
#define MAIN_SCREEN [[UIScreen mainScreen] bounds]



@property (strong ,nonatomic) UIScrollView * scrolView;
@property (strong ,nonatomic) UIImageView * backgroundImage1;
@property (strong ,nonatomic) UIImageView * backgroundImage2;
@property (strong ,nonatomic) UIImageView * backImage;
@property (strong ,nonatomic) UIButton * button1;
@property (strong ,nonatomic) UIButton * button2;
@property (strong ,nonatomic) UIButton * button3;
@property (strong ,nonatomic) UIButton * button4;
@property (strong ,nonatomic) UIButton * button5;
@property (strong ,nonatomic) UIButton * button6;
@property (strong ,nonatomic) UIButton * button7;
@property (strong ,nonatomic) UIButton * button8;
@property (strong ,nonatomic) UIButton * button9;

@property (strong ,nonatomic) UIButton * button10;
@property (strong ,nonatomic) UIButton * button11;
@property (strong ,nonatomic) UIButton * button12;
@property (strong ,nonatomic) UIButton * button13;
@property (strong ,nonatomic) UIButton * button14;
@property (strong ,nonatomic) UIButton * button15;
@property (strong ,nonatomic) UIButton * button16;
@property (strong ,nonatomic) UIButton * button17;
@property (strong ,nonatomic) UIButton * button18;
@property (strong ,nonatomic) UIButton * button19;

@property (strong ,nonatomic) UIPageControl * pageControl;

-(void)selectBakcImage;


@end
