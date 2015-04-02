//
//  Teach.m
//  WeiXiaoYuan
//
//  Created by 姚振兴 on 14/12/20.
//  Copyright (c) 2014年 Dukeland. All rights reserved.
//

#import "Teach.h"

@implementation Teach
-(NSString*)getSemesterList:(NSString*)group_id
{
    _webServiceController = [WebServiceController shareController:nil];
    
    NSString * str = [_webServiceController getSemesterList:group_id];
    return str;
}
-(NSString*)getSchedule:(NSString*)group_id:(NSString*)xq_id
{
    _webServiceController = [WebServiceController shareController:nil];
    
    NSString * str = [_webServiceController getSchedule:group_id:xq_id];
    return str;
}
-(NSString*)teacherList:(NSString*)group_id
{
    _webServiceController = [WebServiceController shareController:nil];
    
    NSString * str = [_webServiceController teacherList:group_id];
    return str;
}
@end
