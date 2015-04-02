//
//  Notify.m
//  WeiXiaoYuan
//
//  Created by 姚振兴 on 14/12/12.
//  Copyright (c) 2014年 Dukeland. All rights reserved.
//

#import "Notify.h"

@implementation Notify
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
- (NSString*)noticeadd:(NSString*)group_id:(NSString*)rangeValue:(NSString*)title:(NSString*)notice_info:(NSString*)imgPath
{
    _webServiceController = [WebServiceController shareController:nil];
    
    NSString* str = [_webServiceController noticeadd:group_id:rangeValue:title:notice_info:[super Base64OfTestPhote:imgPath]];
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
- (NSString*)noticeinfo:notice_id
{
    _webServiceController = [WebServiceController shareController:nil];
    
    NSString * str = [_webServiceController noticeinfo:notice_id];
    return str;
}
- (NSString*)noticelist
{
    _webServiceController = [WebServiceController shareController:nil];
    
    NSString * str = [_webServiceController noticelist];
    return str;
}
-(NSString*)judgeUrlFromCache:(NSString*)picUrl
{
    return [super judgeUrlFromCache:picUrl];
}

@end
