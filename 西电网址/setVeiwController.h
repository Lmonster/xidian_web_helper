//
//  setVeiwController.h
//  网页助手
//
//  Created by 付国强 on 14/10/29.
//  Copyright (c) 2014年 付国强. All rights reserved.
//

#import <UIKit/UIKit.h>


#define SCROLLVIEWFRAME CGRectMake(0,65,320,480)


@interface setVeiwController : UIViewController<UITableViewDataSource,UITableViewDelegate>
@property (strong ,nonatomic) UIImageView * backgroundImageView;
@property (strong ,nonatomic) UITableView * tableView;

@end
