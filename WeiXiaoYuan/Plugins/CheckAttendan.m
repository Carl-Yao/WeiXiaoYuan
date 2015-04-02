//
//  AttendancePlugin.m
//  WeiXiaoYuan
//
//  Created by 姚振兴 on 14/12/9.
//  Copyright (c) 2014年 Dukeland. All rights reserved.
//

#import "CheckAttendan.h"

@implementation CheckAttendan
- (NSString*)todayAttendance:(NSString*)param :(NSString*)param1
{
    _webServiceController = [WebServiceController shareController:nil];
    
    if (param != nil
        && [param length] > 0
        && param1 != nil
        && [param1 length])
    {
        NSString * str = [_webServiceController todayAttendance:param :param1];
        return str;
    }
    return @"";
}
- (NSString*)todayChildrenAttendance
{
    _webServiceController = [WebServiceController shareController:nil];
    
    {
        NSString * str = [_webServiceController todayChildrenAttendance];
        return str;
    }
    return @"";
}
- (NSString*)searchAttendanceforstudents:(NSString*)groupId:(NSString*)studentNumber:(NSString*)studentName:(NSString*)attendanceType:(NSString*)xjh:(NSString*)beginDate:(NSString*)endDate
{
    _webServiceController = [WebServiceController shareController:nil];
    
    if (groupId != nil
        && [groupId length] > 0)
    {
        NSString * str = [_webServiceController searchAttendanceforstudents:groupId:studentNumber:studentName:attendanceType:xjh:beginDate:endDate];
        return str;
    }
    return @"";
}
- (NSString*)searchAttendanceForParent:(NSString*)student_id:(NSString*)attendanceType:(NSString*)beginDate:(NSString*)endDate
{
    _webServiceController = [WebServiceController shareController:nil];
    
    if (student_id != nil
        && [student_id length] > 0)
    {
        NSString * str = [_webServiceController searchAttendanceForParent:student_id:attendanceType:beginDate:endDate];
        return str;
    }
    return @"";
}

- (NSString*)historyAttendance:(NSString*)group_id:(NSString*)cycle_code
{
    _webServiceController = [WebServiceController shareController:nil];
    
    NSString * str = [_webServiceController historyAttendance:group_id:cycle_code];
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
-(NSString*)judgeUrlFromCache:(NSString*)picUrl
{
    return [super judgeUrlFromCache:picUrl];
}

- (NSString*)todayAttendanceforstudents:(NSString*)group_id:(NSString*)attendanceType
{
    _webServiceController = [WebServiceController shareController:nil];
    
    NSString * str = [_webServiceController todayAttendanceforstudents:group_id:attendanceType];
    return str;
}

- (NSString*)vacationlist
{
    _webServiceController = [WebServiceController shareController:nil];
    
    NSString * str = [_webServiceController vacationlist];
    return str;
}

- (NSString*)getVacation_id
{
    //not to do
    return @"001";
}
- (NSString*)vacationinfo:(NSString*)vacation_id
{
    _webServiceController = [WebServiceController shareController:nil];
    
    NSString * str = [_webServiceController vacationinfo:vacation_id];
    return str;
}
- (NSString*)vacationaudit:(NSString*)vacation_id:(NSString*)auditflag
{
    _webServiceController = [WebServiceController shareController:nil];
    
    NSString * str = [_webServiceController vacationaudit:vacation_id:auditflag];
    return str;
}
- (NSString*)vacationadd:(NSString*)student_id:(NSString*)start_date:(NSString*)start_time:(NSString*)end_date:(NSString*)end_time:(NSString*)reason
{
    _webServiceController = [WebServiceController shareController:nil];
    
    NSString * str = [_webServiceController vacationadd:student_id:start_date:start_time:end_date:end_time:reason];
    return str;
}
-(void)closePage
{
    return ;
}
@end
