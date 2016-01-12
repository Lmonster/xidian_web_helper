//
//  ViewController.m
//  网页助手
//
//  Created by 付国强 on 14/10/28.
//  Copyright (c) 2014年 付国强. All rights reserved.
//

#import "ViewController.h"
#import "subMainVeiw.h"
#import "UIImageView+LBBlurredImage.h"
#import "webViewController.h"
#import "setVeiwController.h"
#import "subViewController10.h"
#import "dataModal.h"

@implementation ViewController

-(id)init{
    self = [super init];
    if(self){
        
    }
    return self;
}

-(void)viewDidLoad{
    
    [super viewDidLoad];
    self.navigationController.navigationBarHidden = NO;
    self.title = @"首页";
    UIBarButtonItem * settingButton= [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"setting.png"]
                                                                      style:UIBarButtonItemStylePlain
                                                                     target:self
                                                                     action:@selector(setting)];
    UIBarButtonItem *Message = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"Message.png"]
                                                                style:UIBarButtonItemStylePlain
                                                               target:self
                                                               action:@selector(ourMessage)];
    self.navigationItem.leftBarButtonItem = settingButton;
    self.navigationItem.rightBarButtonItem = Message;
    
    [[NSNotificationCenter defaultCenter]addObserver:self
                                            selector:@selector(selectBakcImage)
                                                name:@"refreshBackImage"
                                              object:nil];
//
    CGRect screen = MAIN_SCREEN;
    float x = screen.size.width;
    float y =screen.size.height;
    
//
    
    _scrolView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 65, x, y-65)];//(0,50,320,520)
    _backgroundImage1 = [[UIImageView alloc] initWithFrame:CGRectMake(0,0,x,y-65)];//(0,0,320,520)
    _backgroundImage2 = [[UIImageView alloc] initWithFrame:CGRectMake(screen.size.width,0,screen.size.width,y-65)];
    _button1 = [[UIButton alloc] initWithFrame:BUTTON1FRAME];
    _button2 = [[UIButton alloc] initWithFrame:BUTTON2FRAME];
    _button3 = [[UIButton alloc] initWithFrame:BUTTON3FRAME];
    _button4 = [[UIButton alloc] initWithFrame:BUTTON4FRAME];
    _button5 = [[UIButton alloc] initWithFrame:BUTTON5FRAME];
    _button6 = [[UIButton alloc] initWithFrame:BUTTON6FRAME];
    _button7 = [[UIButton alloc] initWithFrame:BUTTON7FRAME];
    _button8 = [[UIButton alloc] initWithFrame:BUTTON8FRAME];
    _button9 = [[UIButton alloc] initWithFrame:BUTTON9FRAME];
    _button10 = [[UIButton alloc] initWithFrame:BUTTON10FRAME];
    _button11 = [[UIButton alloc] initWithFrame:BUTTON11FRAME];
    _button12 = [[UIButton alloc] initWithFrame:BUTTON12FRAME];
    _button13 = [[UIButton alloc] initWithFrame:BUTTON13FRAME];
    _button14 = [[UIButton alloc] initWithFrame:BUTTON14FRAME];
    _button15 = [[UIButton alloc] initWithFrame:BUTTON15FRAME];
    _button16 = [[UIButton alloc] initWithFrame:BUTTON16FRAME];
    _button17 = [[UIButton alloc] initWithFrame:BUTTON17FRAME];
    _button18 = [[UIButton alloc] initWithFrame:BUTTON18FRAME];
    _button19 = [[UIButton alloc] initWithFrame:BUTTON19FRAME];
    
    
    _pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(x/2,y-30, 40, 20)];
    _pageControl.numberOfPages =2;


    
    _backImage = [[UIImageView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
//    [_backImage setImageToBlur:[UIImage imageNamed:@"picture2.jpg"] blurRadius:20 completionBlock:nil];
    
    _scrolView.contentSize = CGSizeMake(screen.size.width*2, screen.size.height);
    _scrolView.pagingEnabled = YES;
    _scrolView.delegate = self;
    _backgroundImage1.image = [UIImage imageNamed:@"图标2.png"];
    _backgroundImage2.image = [UIImage imageNamed:@"图标1.png"];
    
    [_button1 addTarget:self action:@selector(buttonTouched1)forControlEvents:UIControlEventTouchDown];
    [_button2 addTarget:self action:@selector(buttonTouched2)forControlEvents:UIControlEventTouchDown];
    [_button3 addTarget:self action:@selector(buttonTouched3)forControlEvents:UIControlEventTouchDown];
    [_button4 addTarget:self action:@selector(buttonTouched4)forControlEvents:UIControlEventTouchDown];
    [_button5 addTarget:self action:@selector(buttonTouched5)forControlEvents:UIControlEventTouchDown];
    [_button6 addTarget:self action:@selector(buttonTouched6)forControlEvents:UIControlEventTouchDown];
    [_button7 addTarget:self action:@selector(buttonTouched7)forControlEvents:UIControlEventTouchDown];
    [_button8 addTarget:self action:@selector(buttonTouched8)forControlEvents:UIControlEventTouchDown];
    [_button9 addTarget:self action:@selector(buttonTouched9)forControlEvents:UIControlEventTouchDown];
    [_button10 addTarget:self action:@selector(buttonTouched10) forControlEvents:UIControlEventTouchDown];
    [_button11 addTarget:self action:@selector(buttonTouched11) forControlEvents:UIControlEventTouchDown];
    [_button12 addTarget:self action:@selector(buttonTouched12) forControlEvents:UIControlEventTouchDown];
    [_button13 addTarget:self action:@selector(buttonTouched13) forControlEvents:UIControlEventTouchDown];
    [_button14 addTarget:self action:@selector(buttonTouched14) forControlEvents:UIControlEventTouchDown];
    [_button15 addTarget:self action:@selector(buttonTouched15) forControlEvents:UIControlEventTouchDown];
    [_button16 addTarget:self action:@selector(buttonTouched16) forControlEvents:UIControlEventTouchDown];
    [_button17 addTarget:self action:@selector(buttonTouched17) forControlEvents:UIControlEventTouchDown];
    [_button18 addTarget:self action:@selector(buttonTouched18) forControlEvents:UIControlEventTouchDown];
    [_button19 addTarget:self action:@selector(buttonTouched19) forControlEvents:UIControlEventTouchDown];
    
    
    
    
    
    
    
    
    
    
    [self.view addSubview:_backImage];
    [self.view addSubview:_scrolView];
    [_scrolView addSubview:_backgroundImage1];
    [_scrolView addSubview:_backgroundImage2];
    [_scrolView addSubview:_button1];
    [_scrolView addSubview:_button2];
    [_scrolView addSubview:_button3];
    [_scrolView addSubview:_button4];
    [_scrolView addSubview:_button5];
    [_scrolView addSubview:_button6];
    [_scrolView addSubview:_button7];
    [_scrolView addSubview:_button8];
    [_scrolView addSubview:_button9];
    
    [_scrolView addSubview:_button10];
    [_scrolView addSubview:_button11];
    [_scrolView addSubview:_button12];
    [_scrolView addSubview:_button13];
    [_scrolView addSubview:_button14];
    [_scrolView addSubview:_button15];
    [_scrolView addSubview:_button16];
    [_scrolView addSubview:_button17];
    [_scrolView addSubview:_button18];
    [_scrolView addSubview:_button19];
    [self.view addSubview:_pageControl];
    [self selectBakcImage];
    
    
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)buttonTouched1{
    webViewController * view = [[webViewController alloc] init];
    [view getUrlRequest:@"http://rs.xde6.net"];
    view.title = @"移动版睿思";
    [self.navigationController pushViewController:view animated:YES];
}

-(void)buttonTouched2{
    webViewController * view = [[webViewController alloc] init];
    [view getUrlRequest:@"http://shop.xidian.cc"];
    view.title = @"校园生活";
    [self.navigationController pushViewController:view animated:YES];
    
}

-(void)buttonTouched3{
    subMainVeiw * view = [[subMainVeiw alloc] init];
    [view getIndex1:4 Index2:1];
    [self.navigationController pushViewController:view animated:YES];

}

-(void)buttonTouched4{
    webViewController * view = [[webViewController alloc] init];
    [view getUrlRequest:@"http://tel.xidian.cc/m"];
    view.title = @"西电电话";
    [self.navigationController pushViewController:view animated:YES];
    
}

-(void)buttonTouched5{
    subMainVeiw * view = [[subMainVeiw alloc] init];
    [view getIndex1:5 Index2:5];
    [self.navigationController pushViewController:view animated:YES];
    
}

-(void)buttonTouched6{
    webViewController * view = [[webViewController alloc] init];
    [view getUrlRequest:@"http://job.xidian.edu.cn/index.html"];
    view.title = @"招聘信息";
    [self.navigationController pushViewController:view animated:YES];
    
}

-(void)buttonTouched7{
    webViewController * view = [[webViewController alloc] init];
    [view getUrlRequest:@"http://1000.xidian.edu.cn/m"];
    view.title = @"后勤报修";
    [self.navigationController pushViewController:view animated:YES];
    
    
}

-(void)buttonTouched8{
    webViewController * view = [[webViewController alloc] init];
    [view getUrlRequest:@"http://10.255.44.1:8800/"];
    view.title = @"流量查询";
    [self.navigationController pushViewController:view animated:YES];
    
}

-(void)buttonTouched9{
    webViewController * view = [[webViewController alloc] init];
    [view getUrlRequest:@"http://find.xidian.cc"];
    view.title = @"失物招领";
    [self.navigationController pushViewController:view animated:YES];
    
}

-(void)buttonTouched10{
    webViewController * view = [[webViewController alloc] init];
    [view getUrlRequest:@"http://kb.xidian.cc/m"];
    view.title = @"课表查询";
    [self.navigationController pushViewController:view animated:YES];
    
}
-(void)buttonTouched11{
    
    subMainVeiw * view = [[subMainVeiw alloc] init];
    [view getIndex1:2 Index2:2];
    [self.navigationController pushViewController:view animated:YES];
}

-(void)buttonTouched12{
    webViewController * view = [[webViewController alloc] init];
    [view getUrlRequest:@"http://time.xidian.cc"];
    view.title = @"时间查询";
    [self.navigationController pushViewController:view animated:YES];
    
}

-(void)buttonTouched13{
    subMainVeiw * view = [[subMainVeiw alloc] init];
    [view getIndex1:1 Index2:4];
    [self.navigationController pushViewController:view animated:YES];
    
}

-(void)buttonTouched14{
    subMainVeiw * view = [[subMainVeiw alloc] init];
    [view getIndex1:3 Index2:3];
    [self.navigationController pushViewController:view animated:YES];
    
}

-(void)buttonTouched15{
    webViewController * view = [[webViewController alloc] init];
    [view getUrlRequest:@"http://shop.xidian.cc"];
    view.title = @"吃喝玩儿乐在西电";
    [self.navigationController pushViewController:view animated:YES];
}

-(void)buttonTouched16{
    webViewController * view = [[webViewController alloc] init];
    [view getUrlRequest:@"http://jwxt.xidian.edu.cn/"];
    view.title = @"成绩查询";
    [self.navigationController pushViewController:view animated:YES];
}

-(void)buttonTouched17{
    subMainVeiw * view = [[subMainVeiw alloc] init];
    [view getIndex1:6 Index2:6];
    [self.navigationController pushViewController:view animated:YES];
    
}

-(void)buttonTouched18{
    subViewController10 * view = [[subViewController10 alloc] init];
    [self.navigationController pushViewController:view animated:YES];

    
}

-(void)buttonTouched19{
    webViewController * view = [[webViewController alloc] init];
    [view getUrlRequest:@"http://wlsy.xidian.edu.cn"];
    view.title = @"物理实验";
    [self.navigationController pushViewController:view animated:YES];
    
}




-(void)setting{
    
    setVeiwController * view = [[setVeiwController alloc] init];
    CATransition *tran=[CATransition animation];
    tran.type = @"cube";
    tran.duration = 1.0;
    [self.navigationController.view.layer addAnimation:tran forKey:nil];
 
    
    [self.navigationController pushViewController:view
                                         animated:NO];
 
 }

-(void)ourMessage{
    subViewController10 *view = [[subViewController10 alloc] init];
    [self.navigationController pushViewController:view animated:YES];
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    int pageNumber = _scrolView.contentOffset.x/320;
    _pageControl.currentPage = pageNumber;
}


-(void)selectBakcImage{
    dataModal *data = [dataModal sharedDataModal];
    [data getDataFromFile:[data getStoragePath]];
    NSMutableArray *temp =[NSMutableArray arrayWithArray:[data->dictionary objectForKey:@"backgroundImage"]];
    for(int i =0;i<=5;i++){
        if([[temp objectAtIndex:i] isEqualToString:@"1"]){
            [_backImage setImageToBlur:[UIImage imageNamed:[NSString stringWithFormat:@"picture%d.png",i+1]] blurRadius:5 completionBlock:nil];
        }
    }
    

}
@end
