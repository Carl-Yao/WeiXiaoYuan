//
//  AttendancePlugin.h
//  WeiXiaoYuan
//
//  Created by 姚振兴 on 14/12/9.
//  Copyright (c) 2014年 Dukeland. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WebServiceController.h"
#import "JsPluginBase.h"
@interface CheckAttendan : JsPluginBase
{
    WebServiceController *_webServiceController;
}
- (NSString*)todayAttendance:(NSString*)param :(NSString*)param1;
- (NSString*)todayChildrenAttendance;
- (NSString*)searchAttendanceforstudents:(NSString*)groupId:(NSString*)studentNumber:(NSString*)studentName:(NSString*)attendanceType:(NSString*)xjh:(NSString*)beginDate:(NSString*)endDate;
- (NSString*)searchAttendanceForParent:(NSString*)student_id:(NSString*)attendanceType:(NSString*)beginDate:(NSString*)endDate;

- (NSString*)historyAttendance:(NSString*)group_id:(NSString*)cycle_code;
- (NSString*)getWidth;
- (NSString*)getHeight;

- (NSString*)todayAttendanceforstudents:(NSString*)group_id:(NSString*)attendanceType;
- (NSString*)vacationlist;
- (NSString*)getVacation_id;
- (NSString*)vacationinfo:(NSString*)vacation_id;
- (NSString*)vacationaudit:(NSString*)vacation_id:(NSString*)auditflag;
- (NSString*)vacationadd:(NSString*)student_id:(NSString*)start_date:(NSString*)start_time:(NSString*)end_date:(NSString*)end_time:(NSString*)reason;
-(void)closePage;
@end
//vacationlist();

//getVacation_id();
//vacationinfo(vacation_id);vacationadd(parameters.student_id,parameters.start_date,parameters.start_time,parameters.end_date,parameters.end_time,parameters.reason)