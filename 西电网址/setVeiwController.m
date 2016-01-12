//
//  setVeiwController.m
//  网页助手
//
//  Created by 付国强 on 14/10/29.
//  Copyright (c) 2014年 付国强. All rights reserved.
//

#import "setVeiwController.h"
#import "UIImageView+LBBlurredImage.h"
#import "subViewController10.h"
#import "introductionView.h"
#import "changeBackImahe.h"
#import "dataModal.h"

@implementation setVeiwController

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
    
    self.title = @"设置";
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 65, x, y-65) style:UITableViewStylePlain];
    _backgroundImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, x, y)];
    
    
    [self refreshBackImage];
    
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.backgroundColor = [UIColor clearColor];
    
    [self.view addSubview:_backgroundImageView];
    [self.view addSubview:_tableView];
    
    
}

#pragma tableView协议的实现
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 4;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString * cellIdentifier = @"CellIdentifier";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    CGRect screen = [[UIScreen mainScreen] bounds];
    float x = screen.size.width;
    
    if(cell == nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                      reuseIdentifier:cellIdentifier];
    }
    if(indexPath.row == 0){
        
        UILabel *infoLabel = [[UILabel alloc] initWithFrame:CGRectMake((x-200)/2+30, 30, 200, 40)];
        infoLabel.font = [UIFont fontWithName:@"Heiti SC" size:35];
        infoLabel.text = @"软件介绍";
        infoLabel.textColor = [UIColor colorWithHue:0 saturation:0 brightness:50 alpha:1.0];
        [cell.contentView addSubview:infoLabel];
    }
    if(indexPath.row == 1){
        
        UILabel *infoLabel = [[UILabel alloc] initWithFrame:CGRectMake((x-200)/2+30, 30, 200, 40)];
        infoLabel.font = [UIFont fontWithName:@"Heiti SC" size:35];
        infoLabel.text = @"清理缓存";
        infoLabel.textColor = [UIColor colorWithHue:0 saturation:0 brightness:50 alpha:1.0];
        [cell.contentView addSubview:infoLabel];
    }
    if(indexPath.row == 2){
        UILabel *infoLabel = [[UILabel alloc] initWithFrame:CGRectMake((x-200)/2+30, 30, 200, 40)];
        infoLabel.font = [UIFont fontWithName:@"Heiti SC" size:35];
        infoLabel.text = @"了解我们";
        infoLabel.textColor = [UIColor colorWithHue:0 saturation:0 brightness:50 alpha:1.0];
        [cell.contentView addSubview:infoLabel];
 
    }
    if(indexPath.row == 3){
        UILabel *infoLabel = [[UILabel alloc] initWithFrame:CGRectMake((x-200)/2+30, 30, 200, 40)];
        infoLabel.font = [UIFont fontWithName:@"Heiti SC" size:35];
        infoLabel.text = @"更改背景";
        infoLabel.textColor = [UIColor colorWithHue:0 saturation:0 brightness:50 alpha:1.0];
        [cell.contentView addSubview:infoLabel];
    }
    cell.backgroundColor =[UIColor clearColor];
    return cell;
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if(indexPath.row == 0){
        introductionView * view = [[introductionView alloc] init];
        [self.navigationController pushViewController:view animated:YES];
    }
    if(indexPath.row == 1){
        dispatch_async(
                       dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)
                       , ^{
                           NSString *cachPath = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory,NSUserDomainMask, YES) objectAtIndex:0];
                           
                           NSArray *files = [[NSFileManager defaultManager] subpathsAtPath:cachPath];
                           NSLog(@"files :%lu",(unsigned long)[files count]);
                           for (NSString *p in files) {
                               NSError *error;
                               NSString *path = [cachPath stringByAppendingPathComponent:p];
                               if ([[NSFileManager defaultManager] fileExistsAtPath:path]) {
                                   [[NSFileManager defaultManager] removeItemAtPath:path error:&error];
                               }
                           }
                           [self performSelectorOnMainThread:@selector(clearCacheSuccess) withObject:nil waitUntilDone:YES];});
    }
    if(indexPath.row == 2){
        subViewController10 * view = [[subViewController10 alloc] init];
        [self.navigationController pushViewController:view animated:YES];
    }
    if(indexPath.row == 3){
        changeBackImahe *view = [[changeBackImahe alloc] init];
        [self presentViewController:view animated:YES completion:^{
            [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(refreshBackImage) name:@"refreshBackImage" object:view];
        }];
        
    }
    [_tableView deselectRowAtIndexPath:indexPath animated:YES];
}


-(void)refreshBackImage{
    dataModal *data = [dataModal sharedDataModal];
    [data getDataFromFile:[data getStoragePath]];
    NSMutableArray *temp =[NSMutableArray arrayWithArray:[data->dictionary objectForKey:@"backgroundImage"]];
    for(int i =0;i<=5;i++){
        if([[temp objectAtIndex:i] isEqualToString:@"1"]){
            [_backgroundImageView setImageToBlur:[UIImage imageNamed:[NSString stringWithFormat:@"picture%d.png",i+1]] blurRadius:5 completionBlock:nil];
        }
    }
}


-(void)clearCacheSuccess
{
    UIAlertView * alertView = [[UIAlertView alloc] initWithTitle:@"提示"
                                                         message:@"清理成功"
                                                        delegate:nil
                                               cancelButtonTitle:@"返回"
                                               otherButtonTitles:nil, nil];
    [alertView show];
}





@end
