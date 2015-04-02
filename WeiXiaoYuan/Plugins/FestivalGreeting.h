//
//  FestivalGreeting.h
//  WeiXiaoYuan
//
//  Created by 姚振兴 on 14/12/12.
//  Copyright (c) 2014年 Dukeland. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WebServiceController.h"
#import "JsPluginBase.h"
@interface FestivalGreeting : JsPluginBase
{
    WebServiceController *_webServiceController;
}
- (NSString*)jrzfinfo:jrzf_id;
- (NSString*)jrzflist;
- (NSString*)getUserSchoolAndName;
- (NSString*)hkList;
- (NSString*)jrzfadd:object:content:inscribe:rangeValue:greetingCard;
- (void)closePage;
@end
