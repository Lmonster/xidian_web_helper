//
//  dataModal.h
//  西电网站助手for iPhone5
//
//  Created by 付国强 on 14/10/26.
//  Copyright (c) 2014年 付国强. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface dataModal : NSObject{
    @public
    NSMutableArray * webName1 ,
    *webUrl1,
    *webName2,
    *webUrl2,
    *webName3,
    *webUrl3,
    *webName4,
    *webUrl4,
    *webName5,
    *webUrl5,
    *webName6,
    *webUrl6,
    *backgroundImage;
    NSDictionary * dictionary;
}

+(id)sharedDataModal;
-(id)initData;
-(NSString *)getStoragePath;
-(BOOL)writeFileToPath:(NSString *)path;
-(void)getDataFromFile:(NSString *)path;

@end
