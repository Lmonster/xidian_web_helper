//
//  changeBackImahe.h
//  网页助手
//
//  Created by 付国强 on 14/10/30.
//  Copyright (c) 2014年 付国强. All rights reserved.
//

#import <UIKit/UIKit.h>
#define BUTTONFRAME1 CGRectMake(20,68,80,142)
#define BUTTONFRAME2 CGRectMake(120,68,80,142)
#define BUTTONFRAME3 CGRectMake(220,68,80,142)

#define BUTTONFRAME4 CGRectMake(20,217,80,142)
#define BUTTONFRAME5 CGRectMake(120,217,80,142)
#define BUTTONFRAME6 CGRectMake(220,217,80,142)


@interface changeBackImahe : UIViewController{
    NSArray * buttonArray;
}

@property (strong ,nonatomic) UIButton *button1;
@property (strong ,nonatomic) UIButton *button2;
@property (strong ,nonatomic) UIButton *button3;
@property (strong ,nonatomic) UIButton *button4;
@property (strong ,nonatomic) UIButton *button5;
@property (strong ,nonatomic) UIButton *button6;

@property (strong ,nonatomic) UIButton *BackButton;

@end
