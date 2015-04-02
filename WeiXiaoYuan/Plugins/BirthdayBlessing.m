//
//  BirthdayBlessing.m
//  WeiXiaoYuan
//
//  Created by 姚振兴 on 14/12/19.
//  Copyright (c) 2014年 Dukeland. All rights reserved.
//

#import "BirthdayBlessing.h"

@implementation BirthdayBlessing
-(NSString*)srzflist
{
    _webServiceController = [WebServiceController shareController:nil];
    
    NSString * str = [_webServiceController srzflist];
    return str;
}
-(NSString*)srzfadd:(NSString*)student_id:(NSString*)student_name:(NSString*)birthday
{
    _webServiceController = [WebServiceController shareController:nil];
    
    NSString * str = [_webServiceController srzfadd:student_id:student_name:birthday];
    return str;
}
-(NSString*)srzftx
{
    _webServiceController = [WebServiceController shareController:nil];
    
    NSString * str = [_webServiceController srzftx];
    return str;
}
-(void)closePage
{
    return;
}
@end
