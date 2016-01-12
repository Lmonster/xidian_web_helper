//
//  addWebView.m
//  网页助手
//
//  Created by 付国强 on 14/10/28.
//  Copyright (c) 2014年 付国强. All rights reserved.
//

#import "addWebView.h"
#import "UIImageView+LBBlurredImage.h"
#import "dataModal.h"

@implementation addWebView
-(id)init{
    self = [super init];
    if(self){
        
        
    }
    return self;
}

-(void)viewDidLoad{
    [super viewDidLoad];
    self.title = @"添加网页信息";
    
    CGRect screen = [[UIScreen mainScreen] bounds];
    float x = screen.size.width;
    float y =screen.size.height;
    
    _imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, x, y)];
    
    [[NSNotificationCenter defaultCenter]
     addObserver:self
     selector:@selector(selectBakcImage)
     name:@"selectBakcImage"
     object:nil];
    [self selectBakcImage];

    
    
    _guideLabel = [[UILabel allocWithZone:nil] initWithFrame:CGRectMake((x-200)/2, 70, 250, 50)];
    _guideLabel.text = @"网页信息添加页面";
    _guideLabel.textColor = [UIColor whiteColor];
    _guideLabel.font = [UIFont fontWithName:@"Thonburi" size:25];
    _confirmButton = [[UIButton allocWithZone:nil] initWithFrame:CGRectMake((x-200)/2, 300, 200, 30)];
    _BackButton  = [[UIButton allocWithZone:nil] initWithFrame:CGRectMake((x-200)/2, 350, 200, 30)];
    _webSite = [[UITextField allocWithZone:nil] initWithFrame:CGRectMake((x-200)/2, 230, 200, 30)];
    _webName = [[UITextField alloc] initWithFrame:CGRectMake((x-200)/2, 190, 200, 30 )];
    _webName.layer.borderColor = [[UIColor whiteColor] CGColor];
    _webName.placeholder = @"             网站名称";
    _webName.layer.borderWidth = 1.0;
    _webName.layer.cornerRadius = 10;
    _webName.textColor = [UIColor whiteColor];
    _webName.delegate = self;
    
    _webSite.layer.borderColor = [[UIColor whiteColor] CGColor];
    _webSite.placeholder = @"             网站地址";
    _webSite.layer.borderWidth = 1.0;
    _webSite.layer.cornerRadius = 10;
    _webSite.textColor = [UIColor blackColor];
    _webSite.delegate = self;
    
    [_confirmButton setTitle:@"保存" forState:UIControlStateNormal];
    [_confirmButton addTarget:self action:@selector(saveData) forControlEvents:UIControlEventTouchDown];
    _confirmButton.layer.cornerRadius = 10;
    _confirmButton.layer.borderWidth = 1.0;
    _confirmButton.layer.borderColor = [[UIColor whiteColor] CGColor];
    
    [_BackButton setTitle:@"退出" forState:UIControlStateNormal];
    [_BackButton addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchDown];
    _BackButton.layer.cornerRadius = 10;
    _BackButton.layer.borderWidth = 1.0f;
    _BackButton.layer.borderColor = [[UIColor whiteColor] CGColor];
    
    [self.view addSubview:_imageView];
    [self.view addSubview:_webName];
    [self.view addSubview:_webSite];
    [self.view addSubview:_confirmButton];
    [self.view addSubview:_guideLabel];
    [self.view addSubview:_BackButton];

    
}

-(void)saveData{
    
    dataModal *data = [dataModal sharedDataModal];
    [data getDataFromFile:[data getStoragePath]];
    
//真正的插入新增加的内容的部分
    [[data->dictionary objectForKey:[NSString stringWithFormat:@"webName%ld",(long)index1]] addObject:_webName.text];
    [[data->dictionary objectForKey:[NSString stringWithFormat:@"webUrl%ld",(long)index2]] addObject:_webSite.text];
    
    [data writeFileToPath:[data getStoragePath]];
    
//发送一个通知
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"dataRefresh" object:self];
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)back{
    [self.navigationController popViewControllerAnimated:YES];
    
}
-(void)getNumber:(NSInteger)number1 number2:(NSInteger)number2{
    index1 = number1;
    index2 = number2;
    
}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [_webName resignFirstResponder];
    [_webSite resignFirstResponder];
}

-(void)selectBakcImage{
    dataModal *data = [dataModal sharedDataModal];
    [data getDataFromFile:[data getStoragePath]];
    NSMutableArray *temp =[NSMutableArray arrayWithArray:[data->dictionary objectForKey:@"backgroundImage"]];
    for(int i =0;i<=5;i++){
        if([[temp objectAtIndex:i] isEqualToString:@"1"]){
            [_imageView setImageToBlur:[UIImage imageNamed:[NSString stringWithFormat:@"picture%d.png",i+1]] blurRadius:10 completionBlock:nil];
        }
    }
}


@end
