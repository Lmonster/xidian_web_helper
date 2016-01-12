//
//  subMainVeiw.m
//  西电网站助手for iPhone5
//
//  Created by 付国强 on 14/10/26.
//  Copyright (c) 2014年 付国强. All rights reserved.
//

#import "subMainVeiw.h"
#import "webViewController.h"
#import "dataModal.h"
#import "addWebView.h"
#import "UIImageView+LBBlurredImage.h"

@implementation subMainVeiw

#define TABLEVIEWFRAME  CGRectMake(0,65,320,530)
#define BACKGROUNDIAMGEVIEW  CGRectMake(0,0,320,570)
#define TOOLBARFRAME CGRectMake(0,530,320,40)

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
    float y = screen.size.height;
    
    [[NSNotificationCenter defaultCenter]
     addObserver:self
     selector:@selector(selectBakcImage)
     name:@"selectBakcImage"
     object:nil];
    
//数据的初始化
    
    dataModal * data = [dataModal sharedDataModal];
    [data getDataFromFile:[data getStoragePath]];
    webName = [data->dictionary objectForKey:[NSString stringWithFormat:@"webName%ld",(long)indexForWebName]];
    webUrl = [data->dictionary objectForKey:[NSString stringWithFormat:@"webUrl%ld",(long)indexForWebUrl]];
    [data writeFileToPath:[data getStoragePath]];
    
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 65, x, y-65)];
    _backgroundImageView = [[UIImageView alloc] initWithFrame:screen];
    _toolBar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, y-40, x, 40)];
    
    _tableView.delegate = self;
    _tableView.dataSource = self;

    [self selectBakcImage];
    _tableView.backgroundColor = [UIColor clearColor];
    
    [self.view addSubview:_backgroundImageView];
    [self.view addSubview:_tableView];
    [self.view addSubview:_toolBar];

    UIBarButtonItem * addWebButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd
                                                                                   target:self
                                                                                   action:@selector(addWeb)];
    UIBarButtonItem * deleteButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemTrash
                                                                                   target:self
                                                                                   action:@selector(deleteWeb)];
    UIBarButtonItem * space = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace
                                                                            target:nil
                                                                            action:nil];
    UIBarButtonItem *refreshButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemRefresh
                                                                                   target:self
                                                                                   action:@selector(refresh)];
    UIBarButtonItem * flexSpace = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace
                                                                                target:nil
                                                                                action:nil];
    
    UIBarButtonItem *item4 =[[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"Message"]
                                                             style:UIBarButtonItemStylePlain
                                                            target:self
                                                            action:@selector(message)];
    
    NSArray * items = [NSArray arrayWithObjects:addWebButton,space,deleteButton, nil];
    NSArray *item = [NSArray arrayWithObjects:refreshButton,flexSpace,item4,nil];
    _toolBar.items = item;
    self.navigationItem.rightBarButtonItems = items;
    
}

#pragma tableView协议的实现

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [webName count];
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString * cellIdentifier = @"cellIdentifier";
    UITableViewCell * cell =[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if(cell == nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
        cell.textLabel.text = [webName objectAtIndex:indexPath.row];
    }
    cell.backgroundColor = [UIColor clearColor];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.textLabel.text = [webName objectAtIndex:indexPath.row];
    cell.textLabel.textColor = [UIColor whiteColor];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    webViewController * webView = [[webViewController alloc] init];
    [self.navigationController pushViewController:webView animated:YES];
    [webView getTitleString:[webName objectAtIndex:indexPath.row]];
    [webView getUrlRequest:[webUrl objectAtIndex:indexPath.row]];
    [_tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 70;
}


-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    if(editingStyle == UITableViewCellEditingStyleDelete){
        [webName removeObjectAtIndex:indexPath.row];
        dataModal *data = [dataModal sharedDataModal];
        
        [data getDataFromFile:[data getStoragePath]];
        
//真正的删除的内容的部分,数据处理
        [[data->dictionary objectForKey:[NSString stringWithFormat:@"webName%ld",(long)indexForWebName]]
         removeObjectAtIndex:indexPath.row];
        
        [[data->dictionary objectForKey:[NSString stringWithFormat:@"webUrl%ld",(long)indexForWebUrl]]
         removeObjectAtIndex:indexPath.row];
        [data writeFileToPath:[data getStoragePath]];
        
//外部样式的处理
        [_tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
        
    }
}





#pragma  自定义的方法
-(void)getIndex1:(NSInteger)number1 Index2:(NSInteger)number2{
    indexForWebName = number1;
    indexForWebUrl = number2;
}

-(void)addWeb{
    [_tableView setEditing:NO animated:YES];
    addWebView * view = [[addWebView alloc] init];
    [view getNumber:indexForWebName number2:indexForWebUrl];
    [self.navigationController pushViewController:view animated:YES];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(dataRefresh)
                                                 name:@"dataRefresh"
                                               object:view];
}


-(void)deleteWeb{
    
    [_tableView setEditing:YES animated:YES];
    
}

-(void)refresh{
    [_tableView setEditing:NO animated:YES];
}

#pragma 通知的执行方法


-(void)dataRefresh{
    dataModal * data = [dataModal sharedDataModal];
    [data getDataFromFile:[data getStoragePath]];
    webName = [data->dictionary objectForKey:[NSString stringWithFormat:@"webName%ld",(long)indexForWebName]];
    webUrl = [data->dictionary objectForKey:[NSString stringWithFormat:@"webUrl%ld",(long)indexForWebUrl]];
    [data writeFileToPath:[data getStoragePath]];
    [_tableView reloadData]; 
}

#pragma 
-(void)selectBakcImage{
    dataModal *data = [dataModal sharedDataModal];
    [data getDataFromFile:[data getStoragePath]];
    NSMutableArray *temp =[NSMutableArray arrayWithArray:[data->dictionary objectForKey:@"backgroundImage"]];
    for(int i =0;i<=5;i++){
        if([[temp objectAtIndex:i] isEqualToString:@"1"]){
            [_backgroundImageView setImageToBlur:[UIImage imageNamed:[NSString stringWithFormat:@"picture%d",i+1]] blurRadius:7 completionBlock:nil];
        }
    }
}







@end
