//
//  FestivalGreeting.m
//  WeiXiaoYuan
//
//  Created by 姚振兴 on 14/12/12.
//  Copyright (c) 2014年 Dukeland. All rights reserved.
//

#import "FestivalGreeting.h"

@implementation FestivalGreeting
- (NSString*)jrzfinfo:jrzf_id
{
    _webServiceController = [WebServiceController shareController:nil];
    
    NSString * str = [_webServiceController jrzfinfo:jrzf_id];
    return str;
}
- (NSString*)jrzflist
{
    _webServiceController = [WebServiceController shareController:nil];
    
    NSString * str = [_webServiceController jrzflist];
    return str;
}
- (NSString*)getUserSchoolAndName
{
    _webServiceController = [WebServiceController shareController:nil];
    
    NSString * str = [_webServiceController getUserSchoolAndName];
    return str;
}
- (NSString*)hkList
{
    _webServiceController = [WebServiceController shareController:nil];
    
    NSString * str = [_webServiceController hkList];
    return str;
}
- (NSString*)jrzfadd:object:content:inscribe:rangeValue:greetingCard
{
    _webServiceController = [WebServiceController shareController:nil];
    
    NSString * str = [_webServiceController jrzfadd:object :content :inscribe :rangeValue :greetingCard];
    return str;
}
- (void)closePage
{
    //not do
    return;
}
-(NSString*)judgeUrlFromCache:(NSString*)picUrl
{
    return [super judgeUrlFromCache:picUrl];
}

@end
