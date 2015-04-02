//
//  BodyTemp.m
//  WeiXiaoYuan
//
//  Created by 姚振兴 on 14/12/11.
//  Copyright (c) 2014年 Dukeland. All rights reserved.
//

#import "BodyTemp.h"

@implementation BodyTemp
- (NSString*)getBodyTemperaturesForParent:(NSString*)student_id: (NSString*)search_date
{
    _webServiceController = [WebServiceController shareController:nil];
    
    {
        NSString * str = [_webServiceController getBodyTemperaturesForParent:student_id:search_date];
        return str;
    }
    return @"";
}
- (NSString*)getBodyTemperatures:(NSString*)student_id: (NSString*)search_date
{
    _webServiceController = [WebServiceController shareController:nil];
    
    {
        NSString * str = [_webServiceController getBodyTemperatures:student_id:search_date];
        return str;
    }
    return @"";
}
- (NSString*)bodyTemperatureTrade:(NSString*)student_id
{
    _webServiceController = [WebServiceController shareController:nil];
    
    {
        NSString * str = [_webServiceController bodyTemperatureTrade:student_id];
        return str;
    }
    return @"";
}
- (NSString*)bodyTemperatureTradeParent
{
    _webServiceController = [WebServiceController shareController:nil];
    
    {
        NSString * str = [_webServiceController bodyTemperatureTradeParent];
        return str;
    }
    return @"";
}
- (NSString*)getAlarmBodyTemperatures:(NSString*)search_date
{
    _webServiceController = [WebServiceController shareController:nil];
    
    {
        NSString * str = [_webServiceController getAlarmBodyTemperatures:search_date];
        return str;
    }
    return @"";
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
