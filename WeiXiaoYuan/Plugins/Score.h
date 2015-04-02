//
//  Score.h
//  WeiXiaoYuan
//
//  Created by 姚振兴 on 14/12/20.
//  Copyright (c) 2014年 Dukeland. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WebServiceController.h"
#import "JsPluginBase.h"
@interface Score : JsPluginBase
{
    WebServiceController *_webServiceController;
}
-(NSString*)ksList:(NSString*)student_id;
-(NSString*)ksLessonListforGroup:(NSString*)group_id;
-(NSString*)getExaminationSubject:(NSString*)student_id;
-(NSString*)groupScoreFenxi:(NSString*)group_id:(NSString*)lesson;
-(NSString*)getWidth;
-(NSString*)getHeight;
-(NSString*)studentScoreFenxi:(NSString*)student_id:(NSString*)lesson;
-(NSString*)scoreInquiry:(NSString*)student_id:(NSString*)record_name;
@end
