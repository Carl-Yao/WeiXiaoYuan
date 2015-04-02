//
//  BodyTemp.h
//  WeiXiaoYuan
//
//  Created by 姚振兴 on 14/12/11.
//  Copyright (c) 2014年 Dukeland. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WebServiceController.h"
#import "JsPluginBase.h"
@interface BodyTemp : JsPluginBase
{
    WebServiceController *_webServiceController;
}
- (NSString*)getBodyTemperaturesForParent:(NSString*)student_id: (NSString*)search_date;
- (NSString*)getBodyTemperatures:(NSString*)student_id: (NSString*)search_date;
- (NSString*)bodyTemperatureTrade:(NSString*)student_id;
- (NSString*)bodyTemperatureTradeParent;
- (NSString*)getAlarmBodyTemperatures:(NSString*)search_date;
- (NSString*)getWidth;
- (NSString*)getHeight;
@end
