//
//  HomeWork.h
//  WeiXiaoYuan
//
//  Created by 姚振兴 on 14/12/12.
//  Copyright (c) 2014年 Dukeland. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WebServiceController.h"
#import "JsPluginBase.h"
@interface HomeWork : JsPluginBase
{
    WebServiceController *_webServiceController;
}
- (NSString*)getWidth;
- (NSString*)getHeight;
- (NSString*)lessonlist:(NSString*)group_id;
- (NSString*)homeworkPublish:(NSString*)group_id:(NSString*)lesson_id:(NSString*)homework_content:(NSString*)edit_date:(NSString*)imgPath;
- (void)closePage;
- (void)setImage;
- (void)viewPhoto;
- (NSString*)homeworksearch:(NSString*)groupId:(NSString*)esson_id:(NSString*)beginDate:(NSString*)endDate;
- (NSString*)homeworkinfo:(NSString*)homework_id;
- (NSString*)lessonlistForParent:(NSString*)group_id;
- (NSString*)todayChildrenHomework;

@end
