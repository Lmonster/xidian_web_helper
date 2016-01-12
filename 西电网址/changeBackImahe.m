//
//  changeBackImahe.m
//  网页助手
//
//  Created by 付国强 on 14/10/30.
//  Copyright (c) 2014年 付国强. All rights reserved.
//

#import "changeBackImahe.h"
#import "dataModal.h"

@implementation changeBackImahe

-(id)init{
    self=[super init];
    if(self){
        
    }
    return self;
}

-(void)viewDidLoad{
    [super viewDidLoad];
    
    CGRect screen = [[UIScreen mainScreen] bounds];
    float x = screen.size.width;
    
    
    [self.view setBackgroundColor:[UIColor colorWithRed:41/255.0 green:127/255.0 blue:184/255.0 alpha:1.0]];
    UILabel *lable = [[UILabel alloc] initWithFrame:CGRectMake((x-300)/2, 350, 300, 120)];
    
    
    lable.text = @"选择你喜欢的一张图片作为背景吧";
    lable.textColor =[UIColor whiteColor];
    _button1 = [[UIButton alloc] initWithFrame:BUTTONFRAME1];
    _button2 = [[UIButton alloc] initWithFrame:BUTTONFRAME2];
    _button3 = [[UIButton alloc] initWithFrame:BUTTONFRAME3];
    _button4 = [[UIButton alloc] initWithFrame:BUTTONFRAME4];
    _button5 = [[UIButton alloc] initWithFrame:BUTTONFRAME5];
    _button6 = [[UIButton alloc] initWithFrame:BUTTONFRAME6];
    
    _BackButton = [[UIButton alloc] initWithFrame:CGRectMake(100,450,120,30)];
    [_BackButton setTitle:@"返回" forState:UIControlStateNormal];
    _BackButton.layer.borderWidth =2;
    _BackButton.layer.cornerRadius = 10;
    [_BackButton addTarget:self
                    action:@selector(backToView)
          forControlEvents:UIControlEventTouchDown];
    _BackButton.layer.borderColor = [[UIColor whiteColor] CGColor];
    
    [_button1 setImage:[UIImage imageNamed:@"picture1.png"] forState:UIControlStateNormal];
    [_button2 setImage:[UIImage imageNamed:@"picture2.png"] forState:UIControlStateNormal];
    [_button3 setImage:[UIImage imageNamed:@"picture3.png"] forState:UIControlStateNormal];
    [_button4 setImage:[UIImage imageNamed:@"picture4.png"] forState:UIControlStateNormal];
    [_button5 setImage:[UIImage imageNamed:@"picture5.png"] forState:UIControlStateNormal];
    [_button6 setImage:[UIImage imageNamed:@"picture6.png"] forState:UIControlStateNormal];
    buttonArray = [NSArray arrayWithObjects:_button1,
                   _button2,
                   _button3,
                   _button4,
                   _button5,
                   _button6,
                   nil];
    dataModal *data = [dataModal sharedDataModal];
    [data getDataFromFile:[data getStoragePath]];
    NSArray *temp = [data->dictionary objectForKey:@"backgroundImage"];
    
    for (int i =0; i<=5; i++) {
        if([[temp objectAtIndex:i] isEqualToString:@"0"]){
            ((UIButton *)[buttonArray objectAtIndex:i]).layer.shadowColor =[[UIColor blackColor] CGColor];
            ((UIButton *)[buttonArray objectAtIndex:i]).layer.shadowOpacity = 0.7;
            ((UIButton *)[buttonArray objectAtIndex:i]).selected = NO;
        }else{
            ((UIButton *)[buttonArray objectAtIndex:i]).selected = YES;
        }
    }
    
    [_button1 addTarget:self action:@selector(buttonTouched) forControlEvents:UIControlEventTouchDown];
    [_button2 addTarget:self action:@selector(buttonTouched) forControlEvents:UIControlEventTouchDown];
    [_button3 addTarget:self action:@selector(buttonTouched) forControlEvents:UIControlEventTouchDown];
    [_button4 addTarget:self action:@selector(buttonTouched) forControlEvents:UIControlEventTouchDown];
    [_button5 addTarget:self action:@selector(buttonTouched) forControlEvents:UIControlEventTouchDown];
    [_button6 addTarget:self action:@selector(buttonTouched) forControlEvents:UIControlEventTouchDown];
    
    [self.view addSubview:_button1];
    [self.view addSubview:_button2];
    [self.view addSubview:_button3];
    [self.view addSubview:_button4];
    [self.view addSubview:_button5];
    [self.view addSubview:_button6];
    [self.view addSubview:lable];
    [self.view addSubview:_BackButton];
}


-(void)buttonTouched{
    
    if([_button1 isTouchInside])
    {
        if([_button1 isSelected])
        {
            [self dismissViewControllerAnimated:YES completion:nil];
            return;
        }else
        {
            _button1.selected = YES;
            dataModal *data = [dataModal sharedDataModal];
            [data getDataFromFile:[data getStoragePath]];
            for(int i=0;i<=5;i++)
            {
                if(i==0)
                {
                    [[data->dictionary objectForKey:@"backgroundImage"] replaceObjectAtIndex:i withObject:@"1"];
                }
                else{
                    [[data->dictionary objectForKey:@"backgroundImage"] replaceObjectAtIndex:i withObject:@"0"];
                }
            }
            [data writeFileToPath:[data getStoragePath]];
        }
    }
    
    if([_button2 isTouchInside])
    {
        if([_button2 isSelected])
        {
            [self dismissViewControllerAnimated:YES completion:nil];
            return;
        }else
        {
            _button2.selected = YES;
            dataModal *data = [dataModal sharedDataModal];
            [data getDataFromFile:[data getStoragePath]];
            for(int i=0;i<=5;i++)
            {
                if(i==1)
                {
                    [[data->dictionary objectForKey:@"backgroundImage"] replaceObjectAtIndex:i withObject:@"1"];
                }
                else{
                    [[data->dictionary objectForKey:@"backgroundImage"] replaceObjectAtIndex:i withObject:@"0"];
                }
            }
            [data writeFileToPath:[data getStoragePath]];
        }
    }
    
    if([_button3 isTouchInside])
    {
        if([_button3 isSelected])
        {
            [self dismissViewControllerAnimated:YES completion:nil];
            return;
        }else
        {
            _button3.selected = YES;
            dataModal *data = [dataModal sharedDataModal];
            [data getDataFromFile:[data getStoragePath]];
            for(int i=0;i<=5;i++)
            {
                if(i==2)
                {
                    [[data->dictionary objectForKey:@"backgroundImage"] replaceObjectAtIndex:i withObject:@"1"];
                }
                else{
                    [[data->dictionary objectForKey:@"backgroundImage"] replaceObjectAtIndex:i withObject:@"0"];
                }
            }
            [data writeFileToPath:[data getStoragePath]];
        }
    }
    
    if([_button4 isTouchInside])
    {
        if([_button4 isSelected])
        {
            [self dismissViewControllerAnimated:YES completion:nil];
            return;
        }else
        {
            _button4.selected = YES;
            dataModal *data = [dataModal sharedDataModal];
            [data getDataFromFile:[data getStoragePath]];
            for(int i=0;i<=5;i++)
            {
                if(i==3)
                {
                    [[data->dictionary objectForKey:@"backgroundImage"] replaceObjectAtIndex:i withObject:@"1"];
                }
                else{
                    [[data->dictionary objectForKey:@"backgroundImage"] replaceObjectAtIndex:i withObject:@"0"];
                }
            }
            [data writeFileToPath:[data getStoragePath]];
        }
    }
    
    if([_button5 isTouchInside])
    {
        if([_button5 isSelected])
        {
            [self dismissViewControllerAnimated:YES completion:nil];
            return;
        }else
        {
            _button5.selected = YES;
            dataModal *data = [dataModal sharedDataModal];
            [data getDataFromFile:[data getStoragePath]];
            for(int i=0;i<=5;i++)
            {
                if(i==4)
                {
                    [[data->dictionary objectForKey:@"backgroundImage"] replaceObjectAtIndex:i withObject:@"1"];
                }
                else{
                    [[data->dictionary objectForKey:@"backgroundImage"] replaceObjectAtIndex:i withObject:@"0"];
                }
            }
            [data writeFileToPath:[data getStoragePath]];
        }
    }
    
    if([_button6 isTouchInside])
    {
        if([_button6 isSelected])
        {
            [self dismissViewControllerAnimated:YES completion:nil];
            return;
        }else
        {
            _button6.selected = YES;
            dataModal *data = [dataModal sharedDataModal];
            [data getDataFromFile:[data getStoragePath]];
            for(int i=0;i<=5;i++)
            {
                if(i==5)
                {
                    [[data->dictionary objectForKey:@"backgroundImage"] replaceObjectAtIndex:i withObject:@"1"];
                }
                else{
                    [[data->dictionary objectForKey:@"backgroundImage"] replaceObjectAtIndex:i withObject:@"0"];
                }
            }
            [data writeFileToPath:[data getStoragePath]];
        }
    }
    
    [self dismissViewControllerAnimated:YES completion:^{
        [[NSNotificationCenter defaultCenter] postNotificationName:@"refreshBackImage" object:self];
    }];
}

-(void)backToView{
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
