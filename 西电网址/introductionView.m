
//
//  introductionView.m
//  网页助手
//
//  Created by 付国强 on 14/10/30.
//  Copyright (c) 2014年 付国强. All rights reserved.
//
#import "introductionView.h"

@implementation introductionView
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
    self.title =@"软件介绍";
    
    
    self.view.backgroundColor = [UIColor orangeColor];
    _scrolView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, x, y)];
    _scrolView.contentSize = CGSizeMake(320, 1140);
    _scrolView.showsHorizontalScrollIndicator = NO;
    _scrolView.showsVerticalScrollIndicator = NO;
    
    UILabel *label1 = [[UILabel alloc] initWithFrame:CGRectMake(70, -20, 200, 120)];
    label1.text = @"感谢您使用我们的产品";
    UILabel *label2 =[[UILabel alloc] initWithFrame:CGRectMake(20, 90, 300, 240)];
    label2.numberOfLines = 2;
    label2.text = @"点击左侧的设置按钮进入设置界面\n点击右侧的按钮进入开发团队介绍界面";
    UILabel *label3 = [[UILabel alloc] initWithFrame:CGRectMake(1, 500, 350, 120)];
    label3.text = @"亲，首页可是有两面的啊，不要忘记了^-^";
    UILabel *label4 = [[UILabel alloc] initWithFrame:CGRectMake(40, 665, 200, 120)];
    label4.numberOfLines = 4;
    label4.text = @"点击右边可以自己定制自己的网站（你懂的）->_->\n点击左边的按钮则可以删除你认为没有用的网站 -!-";
    UILabel *label5 = [[UILabel alloc] initWithFrame:CGRectMake(20, 850, 300, 120)];
    label5.numberOfLines = 2;
    label5.text = @"记得在删除完后点左边的按钮，虽然不是必需的，但是还是弄一下为好";
    UILabel *label6 = [[UILabel alloc] initWithFrame:CGRectMake(20, 950, 300, 120)];
    label6.numberOfLines = 3;
    label6.textColor = [UIColor greenColor];
    label6.text = @"好了，那些易错点就是这些\n你要还是不会的话，就联系我们吧\n知道联系我们在哪里吧？";
    
    
    UIButton * contantButton = [[UIButton alloc] initWithFrame:CGRectMake(90, 1050, 120, 40)];
    [contantButton setTitle:@"联系我们" forState:UIControlStateNormal];
    contantButton.layer.cornerRadius =10;
    contantButton.layer.borderColor = [[UIColor whiteColor] CGColor];
    contantButton.layer.borderWidth = 2;
    [contantButton addTarget:self
                      action:@selector(contactMe)
            forControlEvents:UIControlEventTouchDown];
    
    _imageView1 = [[UIImageView alloc] initWithFrame:CGRectMake(30, 90, 260, 100)];
    _imageView2 = [[UIImageView alloc] initWithFrame:CGRectMake(20, 260, 140, 248)];
    _imageView3 = [[UIImageView alloc] initWithFrame:CGRectMake(160, 260, 140, 248)];
    _imageView4 = [[UIImageView alloc] initWithFrame:CGRectMake(30, 600, 260, 80)];
    _imageView5 = [[UIImageView alloc] initWithFrame:CGRectMake(0, 800, 320, 60)];
    _imageView1.image = [UIImage imageNamed:@"screenShot1.png"];
    _imageView2.image = [UIImage imageNamed:@"screenShot2.png"];
    _imageView3.image = [UIImage imageNamed:@"screenShot3.png"];
    _imageView4.image = [UIImage imageNamed:@"screenShot4.png"];
    _imageView5.image = [UIImage imageNamed:@"screenShot5.png"];
    
    
    
    
    [self.view addSubview:_scrolView];
    [self.scrolView addSubview:_imageView1];
    [self.scrolView addSubview:_imageView2];
    [self.scrolView addSubview:_imageView3];
    [self.scrolView addSubview:_imageView4];
    [self.scrolView addSubview:_imageView5];

    [self.scrolView addSubview:label1];
    [self.scrolView addSubview:label2];
    [self.scrolView addSubview:label3];
    [self.scrolView addSubview:label4];
    [self.scrolView addSubview:label5];
    [self.scrolView addSubview:label6];
    [self.scrolView addSubview:contantButton];
}

-(void)contactMe{
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"sms:13289819761"]];
}
 
@end
