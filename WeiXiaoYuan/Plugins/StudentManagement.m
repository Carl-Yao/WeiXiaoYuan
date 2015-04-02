//
//  StudentManagement.m
//  WeiXiaoYuan
//
//  Created by 姚振兴 on 14/12/20.
//  Copyright (c) 2014年 Dukeland. All rights reserved.
//

#import "StudentManagement.h"

@implementation StudentManagement
-(NSString*)getStudents:(NSString*)group_id
{
    _webServiceController = [WebServiceController shareController:nil];
    
    NSString * str = [_webServiceController getStudents:group_id];
    return str;
}
-(NSString*)searchStudents:(NSString*)group_id:(NSString*)studentName:(NSString*)xjh:(NSString*)studentNumber
{
    _webServiceController = [WebServiceController shareController:nil];
    
    NSString * str = [_webServiceController searchStudents:group_id:studentName:xjh:studentNumber];
    return str;
}
-(NSString*)studenttj:(NSString*)group_id:(NSString*)type
{
    _webServiceController = [WebServiceController shareController:nil];
    
    NSString * str = [_webServiceController studenttj:group_id:type];
    return str;
}
-(NSString*)showInfo:(NSString*)Id
{
    _webServiceController = [WebServiceController shareController:nil];
    
    NSString * str = [_webServiceController showInfo:Id];
    return str;
}

- (NSString*)getWidth
{
    //not do
    return @"320";
}
- (NSString*)getHeight
{
    //not do
    return @"400";
}

@end
