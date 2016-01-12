//
//  subMainVeiw.h
//  西电网站助手for iPhone5
//
//  Created by 付国强 on 14/10/26.
//  Copyright (c) 2014年 付国强. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface subMainVeiw : UIViewController<UITableViewDataSource,UITableViewDelegate>{
    @public
    NSMutableArray * webName ,*webUrl;
    NSInteger indexForWebName ,indexForWebUrl;
    @private
    float blur;
}
@property (strong ,nonatomic) UITableView * tableView;
@property (strong ,nonatomic) UIToolbar * toolBar;
@property (strong ,nonatomic) UIImageView * backgroundImageView;

-(void)getIndex1:(NSInteger)number1 Index2:(NSInteger)number2;

@end
