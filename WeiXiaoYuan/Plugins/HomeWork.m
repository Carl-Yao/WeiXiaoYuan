//
//  HomeWork.m
//  WeiXiaoYuan
//
//  Created by 姚振兴 on 14/12/12.
//  Copyright (c) 2014年 Dukeland. All rights reserved.
//

#import "HomeWork.h"

@implementation HomeWork
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
- (NSString*)lessonlist:(NSString*)group_id
{
    _webServiceController = [WebServiceController shareController:nil];
    
    NSString * str = [_webServiceController lessonlist:group_id];
    return str;
}
- (NSString*)homeworkPublish:(NSString*)group_id:(NSString*)lesson_id:(NSString*)homework_content:(NSString*)edit_date:(NSString*)imgPath
{
    _webServiceController = [WebServiceController shareController:nil];
    
    NSString * str = [_webServiceController homeworkPublish:group_id:lesson_id:homework_content:edit_date:[super Base64OfTestPhote:imgPath]];
    return str;
}
- (void)closePage
{
    //not do
    return;
}
- (void)setImage
{
    //not do
    return;
}
- (void)viewPhoto:imgPath
{
    //not do
    return;
}
- (NSString*)homeworksearch:(NSString*)groupId:(NSString*)esson_id:(NSString*)beginDate:(NSString*)endDate
{
    _webServiceController = [WebServiceController shareController:nil];
    
    NSString *str = [_webServiceController homeworksearch:groupId:esson_id:beginDate:endDate];
    return str;
}
- (NSString*)homeworkinfo:(NSString*)homework_id
{
    _webServiceController = [WebServiceController shareController:nil];
    
    NSString * str = [_webServiceController homeworkinfo:homework_id];
    return str;
}
- (NSString*)lessonlistForParent:(NSString*)group_id
{
    _webServiceController = [WebServiceController shareController:nil];
    
    NSString * str = [_webServiceController lessonlistForParent:group_id];
    return str;
}
- (NSString*)todayChildrenHomework
{
    _webServiceController = [WebServiceController shareController:nil];
    
    NSString * str = [_webServiceController todayChildrenHomework];
    return str;
}
//不写这个，无法调超类里的函数
-(NSString*)judgeUrlFromCache:(NSString*)picUrl
{
    return [super judgeUrlFromCache:picUrl];
}

@end
