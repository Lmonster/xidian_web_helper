//
//  dataModal.m
//  西电网站助手for iPhone5
//
//  Created by 付国强 on 14/10/26.
//  Copyright (c) 2014年 付国强. All rights reserved.
//

#import "dataModal.h"

@implementation dataModal


+(id)sharedDataModal{
    static dataModal *data = nil;
    if(!data){
        data = [[super allocWithZone:nil] init];
    }
    return data;
}


-(id)initData{
    self = [super init];
    if(self){
        backgroundImage =[NSMutableArray arrayWithObjects:@"1",@"0",@"0",@"0",@"0",@"0",nil];
        webName1 = [NSMutableArray arrayWithObjects:
                    @"学校官网",
                    @"通信工程学院",
                    @"电子工程学院",
                    @"计算机学院",
                    @"机电工程学院",
                    @"物理与光电工程学院",
                    @"经济与管理学院",
                    @"数学与统计学院",
                    @"人文学院",
                    @"外国语学院",
                    @"软件学院",
                    @"微电子学院",
                    @"生命科学技术学院",
                    @"空间科学与技术学院",
                    @"先进材料与纳米科技学院",
                    @"国际教育学院",
                    nil];
        webName2 = [NSMutableArray arrayWithObjects:
                    @"高数学习网",
                    @"大学物理",
                    @"线性代数",
                    @"计算机基础",
                    @"电路基础",
                    nil];
        webName3 = [NSMutableArray arrayWithObjects:
                    @"通院导师",
                    @"电院导师",
                    @"计算机院导师",
                    @"微电子院导师",
                    @"机电院导师",
                    @"软院导师",
                    @"生科院 ",
                    @"经济管理学院",
                    @"西电导师个人网页",
                    nil];
        webName4 = [NSMutableArray arrayWithObjects:
                    @"西电官网",
                    @"教务处",
                    @"财务处",
                    @"人事处",
                    @"团委",
                    @"后勤处",
                    @"信息化建设处",
                    @"学工处",
                    nil];
        webName5 = [NSMutableArray arrayWithObjects:
                    @"国家图书馆",
                    @"西电图书馆",
                    @"陕西省图书馆",
                    @"亚马逊图书",
                    @"IT eBooks(编辑倾心推荐)",
                    @"万方数据库",
                    @"code4App",
                    @"bigNerd",
                    nil];
        webName6 = [NSMutableArray arrayWithObjects:
                    @"中国研究生招生信息网",
                    @"考研论坛",
                    @"考研网",
                    @"考研复习网",
                    @"考研资料网",
                    nil];
        webUrl1 = [NSMutableArray arrayWithObjects:
                   @"http://www.xidian.edu.cn",
                   @"http://jwc.xidian.edu.cn",
                   @"http://cwc.xidian.edu.cn/index.html",
                   @"http://rsc.xidian.edu.cn",
                   @"http://youth.xidian.edu.cn",
                   @"http://hqc.xidian.edu.cn",
                   @"http://old.xidian.edu.cn/xxhjsc/index.htm",
                   @"http://xgc.xidian.edu.cn",
                   nil];
        webUrl2 = [NSMutableArray arrayWithObjects:
                   @"http://hmaths.mnu.cn",
                   @"http://www.dxwl.org",
                   @"http://math.qhnu.edu.cn/jpkc/xxds/index.asp",
                   @"http://www.chinafix.com/forum-22-1.html",
                   @"http://www.jialidun.com/video/play-660.html",
                   nil];
        webUrl3 = [NSMutableArray arrayWithObjects:
                   @"http://ste.xidian.edu.cn/plus/list.php?tid=56",
                   @"http://see.xidian.edu.cn/graduate/advisor.asp",
                   @"http://cs.xidian.edu.cn/faculty/",
                   @"http://sme.xidian.edu.cn/yjspy.asp?id=97",
                   @"http://eme.xidian.edu.cn/ReadNews.asp?NewsID=730",
                   @"http://sc.xidian.edu.cn/html/teachers/teachers.htm",
                   @"http://life.xidian.edu.cn/html/zhaoshengjiuye/yanjiushengzhaosheng/2011/0817/343.html",
                   @"http://em.xidian.edu.cn/teachers.asp?pkId=5",
                   @"http://web.xidian.edu.cn",
                   nil];
        webUrl4 = [NSMutableArray arrayWithObjects:
                   @"http://www.xidian.edu.cn",
                   @"http://ste.xidian.edu.cn",
                   @"http://see.xidian.edu.cn",
                   @"http://cs.xidian.edu.cn",
                   @"http://eme.xidian.edu.cn",
                   @"http://stp.xidian.edu.cn",
                   @"http://em.xidian.edu.cn",
                   @"http://math.xidian.edu.cn",
                   @"http://rwxy.xidian.edu.cn",
                   @"http://sfl.xidian.edu.cn",
                   @"http://sc.xidian.edu.cn",
                   @"http://sme.xidian.edu.cn",
                   @"http://life.xidian.edu.cn",
                   @"http://sast.xidian.edu.cn",
                   @"http://amn.xidian.edu.cn",
                   @"http://sie.xidian.edu.cn",
                   nil];
        webUrl5 = [[NSMutableArray alloc] initWithObjects:
                   @"http://www.nlc.gov.cn",
                   @"http://www.lib.xidian.edu.cn",
                   @"http://www.sxlib.org.cn",
                   @"http://www.amazon.cn/b/?ie=UTF8&node=82635071&tag=baiduiclickcn-23&ref=pz_ic_xmo_db_j_pp79",
                   @"http://www.it-ebooks.info",
                   @"http://www.wanfangdata.com.cn",
                   @"http://www.code4app.com",
                   @"http://www.bignerdranch.com",
                   nil];
        webUrl6 = [NSMutableArray arrayWithObjects:
                   @"http://yz.chsi.com.cn",
                   @"http://bbs.kaoyan.com",
                   @"http://www.kaoyan.com",
                   @"http://www.kaoyanfuxi.com",
                   @"http://www.kyzlw.com",
                   nil];
        
    }
    dictionary = [[NSDictionary alloc] initWithObjectsAndKeys:
                  webName1,@"webName1",
                  webName2,@"webName2",
                  webName3,@"webName3",
                  webName4,@"webName4",
                  webName5,@"webName5",
                  webName6,@"webName6",
                  webUrl1,@"webUrl1",
                  webUrl2,@"webUrl2",
                  webUrl3,@"webUrl3",
                  webUrl4,@"webUrl4",
                  webUrl5,@"webUrl5",
                  webUrl6,@"webUrl6",
                  backgroundImage,@"backgroundImage",
                  nil];
    [self writeFileToPath:[self getStoragePath]];
    return self;
}



-(NSString *)getStoragePath{
    NSArray * directionaries = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory , NSUserDomainMask, YES);
    NSString * directionary = [directionaries objectAtIndex:0];
    return [directionary stringByAppendingPathComponent:@"userData.plist"];
}


-(BOOL)writeFileToPath:(NSString *)path{
    
    return [dictionary writeToFile:path atomically:YES];
}


-(void)getDataFromFile:(NSString *)path{
    dictionary = [NSDictionary dictionaryWithContentsOfFile:path];
}



@end
