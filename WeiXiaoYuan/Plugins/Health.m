//
//  Health.m
//  WeiXiaoYuan
//
//  Created by 姚振兴 on 14/12/20.
//  Copyright (c) 2014年 Dukeland. All rights reserved.
//

#import "Health.h"

@implementation Health
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
- (NSString*)getExaminationTrade:(NSString*)student_id:(NSString*)examination_type
{
    _webServiceController = [WebServiceController shareController:nil];
    
    NSString * str = [_webServiceController getExaminationTrade:student_id:examination_type];
    return str;
}
- (NSString*)getExaminationDates:(NSString*)group_id
{
    _webServiceController = [WebServiceController shareController:nil];
    
    NSString * str = [_webServiceController getExaminationDates:group_id];
    return str;
}
- (NSString*)getExaminationRecords:(NSString*)group_id:(NSString*)search_date
{
    _webServiceController = [WebServiceController shareController:nil];
    
    NSString * str = [_webServiceController getExaminationRecords:group_id:search_date];
    return str;
}
- (NSString*)getExaminationDatesForParent:(NSString*)student_id
{
    _webServiceController = [WebServiceController shareController:nil];
    
    NSString * str = [_webServiceController getExaminationDatesForParent:student_id];
    return str;
}
- (NSString*)getExaminationRecordsForParent:(NSString*)student_id:(NSString*)search_date
{
    _webServiceController = [WebServiceController shareController:nil];
    
    NSString * str = [_webServiceController getExaminationRecordsForParent:student_id:search_date];
    return str;
}
- (NSString*)getExaminationType
{
    _webServiceController = [WebServiceController shareController:nil];
    
    NSString * str = [_webServiceController getExaminationType];
    return str;
}
@end
