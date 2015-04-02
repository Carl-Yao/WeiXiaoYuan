//
//  Teach.h
//  WeiXiaoYuan
//
//  Created by 姚振兴 on 14/12/20.
//  Copyright (c) 2014年 Dukeland. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WebServiceController.h"
#import "JsPluginBase.h"
@interface Teach : JsPluginBase
{
    WebServiceController *_webServiceController;
}
-(NSString*)getSemesterList:(NSString*)group_id;
-(NSString*)getSchedule:(NSString*)group_id:(NSString*)xq_id;
-(NSString*)teacherList:(NSString*)group_id;
@end
