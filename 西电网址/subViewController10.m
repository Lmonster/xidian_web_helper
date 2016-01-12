//
//  subViewController10.m
//  NewWebViewController1.01
//
//  Created by 付国强 on 14/10/13.
//  Copyright (c) 2014年 付国强. All rights reserved.
//

#import "subViewController10.h"
#import "UIImageView+LBBlurredImage.h"
#import "dataModal.h"

@interface subViewController10 ()

@end

@implementation subViewController10

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    CGRect screen = [[UIScreen mainScreen] bounds];
    float x = screen.size.width;
    float y =screen.size.height;
    
    self.title =@"软件介绍";
    self.title = @"了解我们";
    
    _backImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, x, y)];
    [self selectBakcImage];
    
    
    UILabel * CorOperation = [[UILabel alloc] initWithFrame:CGRectMake((x-200)/2, 70, 200, 40)];
    CorOperation.font = [UIFont fontWithName:@"ZapFino" size:20];
    CorOperation.textColor = [UIColor orangeColor];
    CorOperation.text = @"Snow&Team";
    
    UILabel * detailLabel = [[UILabel alloc] initWithFrame:CGRectMake((x-200)/2, 80, 200, 200)];
    detailLabel.font = [UIFont fontWithName:@"STHeitiSC-Light" size:18];
    detailLabel.numberOfLines = 10;
    detailLabel.text =
    @"\nSnow&Team is a team that controbutes to iOS program."
    @"\n"
    @"\nWe remain the faith that 'Customer's Experience Is The Best'";
    
    
    
    UILabel * contactLabel = [[UILabel alloc] initWithFrame:CGRectMake((x-140)/2, 300, 200, 100)];
    contactLabel.numberOfLines = 3;
    contactLabel.textColor = [UIColor whiteColor];
    contactLabel.text =
    @"Contact us at\nTEL:13289819761\n"
    @"QQ:2695851920";
    
    UIButton * contantButton = [[UIButton alloc] initWithFrame:CGRectMake((x-120)/2, 400, 120, 40)];
    [contantButton setTitle:@"联系我们" forState:UIControlStateNormal];
    contantButton.layer.cornerRadius =10;
    contantButton.layer.borderColor = [[UIColor whiteColor] CGColor];
    contantButton.layer.borderWidth = 2;
    [contantButton addTarget:self
                      action:@selector(contactMe)
            forControlEvents:UIControlEventTouchDown];
    
    UILabel * rightLabel = [[UILabel alloc] initWithFrame:CGRectMake((x-210)/2, 450, 320, 30)];
    rightLabel.textColor = [UIColor whiteColor];
    rightLabel.text =@"Copyright (c)网络精灵实验室";
    
    [self.view addSubview:_backImage];
    [self.view addSubview:contantButton];
    [self.view addSubview:CorOperation];
    [self.view addSubview:detailLabel];
    [self.view addSubview:contactLabel];
    [self.view addSubview:rightLabel];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)contactMe{
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"sms:13289819761"]];
}

-(void)selectBakcImage{
    dataModal *data = [dataModal sharedDataModal];
    [data getDataFromFile:[data getStoragePath]];
    NSMutableArray *temp =[NSMutableArray arrayWithArray:[data->dictionary objectForKey:@"backgroundImage"]];
    for(int i =0;i<=5;i++){
        if([[temp objectAtIndex:i] isEqualToString:@"1"]){
            [_backImage setImageToBlur:[UIImage imageNamed:[NSString stringWithFormat:@"picture%d.png",i+1]] blurRadius:10 completionBlock:nil];
        }
    }
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
