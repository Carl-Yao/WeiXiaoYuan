//
//  Score.m
//  WeiXiaoYuan
//
//  Created by 姚振兴 on 14/12/20.
//  Copyright (c) 2014年 Dukeland. All rights reserved.
//

#import "Score.h"

@implementation Score
-(NSString*)ksList:(NSString*)student_id
{
    _webServiceController = [WebServiceController shareController:nil];
    
    NSString * str = [_webServiceController ksList:student_id];
    return str;
}
-(NSString*)ksLessonListforGroup:(NSString*)group_id
{
    _webServiceController = [WebServiceController shareController:nil];
    
    NSString * str = [_webServiceController ksLessonListforGroup:group_id];
    return str;
}
-(NSString*)getExaminationSubject:(NSString*)student_id
{
    _webServiceController = [WebServiceController shareController:nil];
    
    NSString * str = [_webServiceController getExaminationSubject:student_id];
    return str;

}
-(NSString*)groupScoreFenxi:(NSString*)group_id:(NSString*)lesson
{
    _webServiceController = [WebServiceController shareController:nil];
    
    NSString * str = [_webServiceController groupScoreFenxi:group_id:lesson];
    return str;
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
-(NSString*)studentScoreFenxi:(NSString*)student_id:(NSString*)lesson
{
    _webServiceController = [WebServiceController shareController:nil];
    
    NSString * str = [_webServiceController studentScoreFenxi:student_id:lesson];
    return str;
}
-(NSString*)scoreInquiry:(NSString*)student_id:(NSString*)record_name
{
    _webServiceController = [WebServiceController shareController:nil];
    
    NSString * str = [_webServiceController scoreInquiry:student_id:record_name];
    return str;
}
@end
