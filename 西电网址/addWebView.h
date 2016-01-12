//
//  addWebView.h
//  网页助手
//
//  Created by 付国强 on 14/10/28.
//  Copyright (c) 2014年 付国强. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface addWebView : UIViewController<UITextFieldDelegate>{
    NSInteger index1,index2;
    
}
@property(strong ,nonatomic) UIImageView * imageView;
@property(strong ,nonatomic) UITextField *webName;
@property(strong ,nonatomic) UITextField *webSite;
@property(strong ,nonatomic) UILabel *guideLabel;
@property(strong ,nonatomic) UIButton *BackButton;
@property(strong ,nonatomic) UIButton *confirmButton;
-(void)getNumber:(NSInteger)number1 number2:(NSInteger)number2;

@end
