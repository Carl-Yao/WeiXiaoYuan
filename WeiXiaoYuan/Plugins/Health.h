//
//  Health.h
//  WeiXiaoYuan
//
//  Created by 姚振兴 on 14/12/20.
//  Copyright (c) 2014年 Dukeland. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WebServiceController.h"
#import "JsPluginBase.h"
@interface Health : JsPluginBase
{
    WebServiceController *_webServiceController;
}
- (NSString*)getWidth;
- (NSString*)getHeight;
- (NSString*)getExaminationTrade:(NSString*)student_id:(NSString*)examination_type;
- (NSString*)getExaminationDates:(NSString*)group_id;
- (NSString*)getExaminationRecords:(NSString*)group_id:(NSString*)search_date;
- (NSString*)getExaminationDatesForParent:(NSString*)student_id;
- (NSString*)getExaminationRecordsForParent:(NSString*)student_id:(NSString*)search_date;
- (NSString*)getExaminationType;
@end
