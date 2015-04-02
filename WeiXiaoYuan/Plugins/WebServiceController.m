//
//  WebServiceController+WebServiceController.m
//  WeiXiaoYuan
//
//  Created by 姚振兴 on 14/11/2.
//
//

#import "WebServiceController.h"
//#import <ASIHTTPRequest/ASIHTTPRequestHeader.h>
#import "ASIHTTPRequest.h"
#import "ASIFormDataRequest.h"
#import "MBProgressHUD.h"
#import "SBJson.h"
#import "UserManager.h"

static NSString *allServiceUrl = @"http://113.105.139.58:8080/ismsall/webservice/loginservice.asmx?wsdl";
//@"http://113.105.139.58:8080/ismsall/webservice/loginservice.asmx?wsdl"]
static NSString *nameSpace1 = @"http://webService.aebell.com/";
static NSString *nameSpace2 = @"org.isms.server.server";
static WebServiceController* _instance = nil;
static METHOD_TYPE _methodType;
@implementation WebServiceController
-(WebServiceController*)init:(UIView*)view
{
    static WebServiceController* obj = nil;
    static dispatch_once_t onceToToken;
    dispatch_once(&onceToToken, ^{
        if ((obj=[super init]) != nil) {
            //初始化
            self->currentView = view;
        }
    });
    self = obj;
    return self;
}
+ (WebServiceController*)shareController:(UIView*)view
{
    @synchronized(self)
    {
        if (!_instance) {
            _instance = [[self alloc] init:view];
        }
    }
    return _instance;
}
+ (id)allocWithZone:(struct _NSZone *)zone
{
    @synchronized(self){
        if (!_instance) {
            _instance = [super allocWithZone:zone];
        }
    }
    return _instance;
}
+ (id)copyWithZone:(struct _NSZone *)zone
{
    return _instance;
}

- (void)GetServerAddr:(NSString*)userID:(NSString*)passWord
{
    _methodType = GETSERVERADDR;
    self->name = userID;
    self->password = passWord;
    [self SendHttpRequest:allServiceUrl :nameSpace1 :@"getServerAddr" :[NSString stringWithFormat:@"{\"condition\":{\"user_id\":\"%@\",\"mobile\":\"0\",\"password\":\"%@\"}}", userID,passWord]];
}
- (void)Login:(NSString*)userID:(NSString*)passWord
{
    _methodType = LOGIN;
    [self SendHttpRequest:[appServiceUrl stringByAppendingString:@"/webservice/loginservice?wsdl"] :nameSpace2 :@"login" :[NSString stringWithFormat:@"{\"condition\":{\"user_id\":\"%@\",\"mobile\":\"0\",\"password\":\"%@\"}}", userID,passWord]];
}
- (NSString*)setChannel:(NSString*)channelid:(NSString*)baiduUserId
{
    _methodType = Other;
    return [self SendHttpRequest1:[appServiceUrl stringByAppendingString:@"/webservice/loginservice?wsdl"] :nameSpace2 :@"setChannelnew" :[NSString stringWithFormat:@"{\"condition\":{\"login_user_id\":\"%@\",\"channelid\":\"%@\",\"baidu_user_id\":\"%@\",\"flag\":\"%@\"}}", self->name,channelid,baiduUserId,@"ios"]];
}
- (NSString*)SchoolsOfUser
{
    _methodType = Other;
    //校长
    if ([[UserManager shareController] UserType] == YEYPRESIDENT || [[UserManager shareController] UserType] == ZXXPRESIDENT) {
        return [self SendHttpRequest1:[appServiceUrl stringByAppendingString:@"/webservice/baseservice?wsdl"] :nameSpace2 :@"schoolsOfUser" :[NSString stringWithFormat:@"{\"condition\":{\"user_id\":\"%@\"}}", self->name]];
    }else{
        return [self SendHttpRequest1:[appServiceUrl stringByAppendingString:@"/webservice/baseservice?wsdl"] :nameSpace2 :@"userGetSchools" :[NSString stringWithFormat:@"{\"condition\":{\"user_id\":\"%@\"}}", self->name]];
    }
}
- (NSString*)getFirstGroupOfUser
{
    return [self SendHttpRequest1:[appServiceUrl stringByAppendingString:@"/webservice/baseservice?wsdl"] :nameSpace2 :@"getFirstGroupOfUser" :[NSString stringWithFormat:@"{\"condition\":{\"user_id\":\"%@\"}}", self->name]];
}

- (NSString*)getChildren
{
    return [self SendHttpRequest1:[appServiceUrl stringByAppendingString:@"/webservice/baseservice?wsdl"] :nameSpace2 :@"mychildren" :[NSString stringWithFormat:@"{\"condition\":{\"user_id\":\"%@\"}}", self->name]];
}
- (NSString*)studentinfo:(NSString*)param
{
    return [self SendHttpRequest1:[appServiceUrl stringByAppendingString:@"/webservice/studentmanagementservice?wsdl"] :nameSpace2 :@"studentinfo" :[NSString stringWithFormat:@"{\"condition\":{\"student_id\":\"%@\"}}", param]];
}
- (NSString*)getFirstClassOfUser
{
    return [self SendHttpRequest1:[appServiceUrl stringByAppendingString:@"/webservice/baseservice?wsdl"] :nameSpace2 :@"getFirstClassOfUser" :[NSString stringWithFormat:@"{\"condition\":{\"user_id\":\"%@\"}}", self->name]];
}
- (NSString*)getUserId
{
    return self->name;
}
-(NSString*)getClassesOfUser
{
    return [self SendHttpRequest1:[appServiceUrl stringByAppendingString:@"/webservice/baseservice?wsdl"] :nameSpace2 :@"classesOfUser" :[NSString stringWithFormat:@"{\"condition\":{\"user_id\":\"%@\"}}", self->name]];
}
-(NSString*)getGroupsOfUser
{
    return [self SendHttpRequest1:[appServiceUrl stringByAppendingString:@"/webservice/baseservice?wsdl"] :nameSpace2 :@"getGroupsOfUser" :[NSString stringWithFormat:@"{\"condition\":{\"user_id\":\"%@\"}}", self->name]];
}
-(NSString*)getStudentByGroup:(NSString*)group_id
{
    return [self SendHttpRequest1:[appServiceUrl stringByAppendingString:@"/webservice/baseservice?wsdl"] :nameSpace2 :@"groupstudents" :[NSString stringWithFormat:@"{\"condition\":{\"group_id\":\"%@\"}}", group_id]];
}

- (NSString*)Schoolintroduce:(NSString*)groupID
{
    return [self SendHttpRequest1:[appServiceUrl stringByAppendingString:@"/webservice/siteservice?wsdl"]:nameSpace2 :@"schoolintroduce" :[NSString stringWithFormat:@"{\"condition\":{\"group_id\":\"%@\"}}", groupID]];
}
- (NSString*)teachersintroduce:(NSString*)groupID
{
    return [self SendHttpRequest1:[appServiceUrl stringByAppendingString:@"/webservice/siteservice?wsdl"]:nameSpace2 :@"teachersintroduce" :[NSString stringWithFormat:@"{\"condition\":{\"group_id\":\"%@\"}}", groupID]];
}
- (NSString*)honerintroduce:(NSString*)groupID
{
    return [self SendHttpRequest1:[appServiceUrl stringByAppendingString:@"/webservice/siteservice?wsdl"]:nameSpace2 :@"honerintroduce" :[NSString stringWithFormat:@"{\"condition\":{\"group_id\":\"%@\"}}", groupID]];
}
- (NSString*)recruitstudentslist:(NSString*)groupID
{
    return [self SendHttpRequest1:[appServiceUrl stringByAppendingString:@"/webservice/siteservice?wsdl"]:nameSpace2 :@"recruitstudentslist" :[NSString stringWithFormat:@"{\"condition\":{\"group_id\":\"%@\"}}", groupID]];
}
- (NSString*)recruitstudentsinfo:(NSString*)ID
{
    return [self SendHttpRequest1:[appServiceUrl stringByAppendingString:@"/webservice/siteservice?wsdl"]:nameSpace2 :@"recruitstudentsinfo" :[NSString stringWithFormat:@"{\"condition\":{\"id\":\"%@\"}}", ID]];
}
- (NSString*)dynamiclist:(NSString*)groupID
{
    return [self SendHttpRequest1:[appServiceUrl stringByAppendingString:@"/webservice/siteservice?wsdl"]:nameSpace2 :@"dynamiclist" :[NSString stringWithFormat:@"{\"condition\":{\"group_id\":\"%@\"}}", groupID]];
}
- (NSString*)dynamicinfo:(NSString*)groupID
{
    return [self SendHttpRequest1:[appServiceUrl stringByAppendingString:@"/webservice/siteservice?wsdl"]:nameSpace2 :@"dynamicinfo" :[NSString stringWithFormat:@"{\"condition\":{\"id\":\"%@\"}}", groupID]];
}

- (NSString*)todayAttendance:(NSString*)param :(NSString*)param1
{
    return [self SendHttpRequest1:[appServiceUrl stringByAppendingString:@"/webservice/attendanceservice?wsdl"]:nameSpace2 :@"todayAttendance" :[NSString stringWithFormat:@"{\"condition\":{\"group_id\":\"%@\", \"group_type\":\"%@\"}}", param, param1]];
}
- (NSString*)todayChildrenAttendance
{
     return [self SendHttpRequest1:[appServiceUrl stringByAppendingString:@"/webservice/attendanceservice?wsdl"]:nameSpace2 :@"todayChildrenAttendance" :[NSString stringWithFormat:@"{\"condition\":{\"user_id\":\"%@\"}}", self->name]];
}
- (NSString*)searchAttendanceforstudents:(NSString*)groupId:(NSString*)studentNumber:(NSString*)studentName:(NSString*)attendanceType:(NSString*)xjh:(NSString*)beginDate:(NSString*)endDate
{
    return [self SendHttpRequest1:[appServiceUrl stringByAppendingString:@"/webservice/attendanceservice?wsdl"]:nameSpace2 :@"searchAttendance" :[NSString stringWithFormat:@"{\"condition\":{\"group_id\":\"%@\",\"xjh\":\"%@\", \"student_no\":\"%@\",\"student_name\":\"%@\",\"attendance_type\":\"%@\",\"start_date\":\"%@\",\"end_date\":\"%@\"}}", groupId,studentNumber,studentName,attendanceType,xjh,beginDate,endDate]];
}
- (NSString*)searchAttendanceForParent:(NSString*)student_id:(NSString*)attendanceType:(NSString*)beginDate:(NSString*)endDate
{
    return [self SendHttpRequest1:[appServiceUrl stringByAppendingString:@"/webservice/attendanceservice?wsdl"]:nameSpace2 :@"searchAttendanceForParent" :[NSString stringWithFormat:@"{\"condition\":{\"student_id\":\"%@\", \"attendance_type\":\"%@\",\"start_date\":\"%@\",\"end_date\":\"%@\"}}", student_id,attendanceType,beginDate,endDate]];
}
- (NSString*)historyAttendance:(NSString*)group_id:(NSString*)cycle_code;
{
    return [self SendHttpRequest1:[appServiceUrl stringByAppendingString:@"/webservice/attendanceservice?wsdl"]:nameSpace2 :@"historyAttendance" :[NSString stringWithFormat:@"{\"condition\":{\"group_id\":\"%@\", \"cycle\":\"%@\"}}", group_id,cycle_code]];
}
- (NSString*)todayAttendanceforstudents:(NSString*)group_id:(NSString*)attendanceType
{
    return [self SendHttpRequest1:[appServiceUrl stringByAppendingString:@"/webservice/attendanceservice?wsdl"]:nameSpace2 :@"todayAttendanceforstudents" :[NSString stringWithFormat:@"{\"condition\":{\"group_id\":\"%@\", \"attendance_type\":\"%@\"}}", group_id,attendanceType]];
}
- (NSString*)vacationlist
{
    return [self SendHttpRequest1:[appServiceUrl stringByAppendingString:@"/webservice/attendanceservice?wsdl"]:nameSpace2 :@"vacationlist" :[NSString stringWithFormat:@"{\"condition\":{\"user_id\":\"%@\"}}", self->name]];
}
- (NSString*)getVacation_id
{
    return [self SendHttpRequest1:[appServiceUrl stringByAppendingString:@"/webservice/attendanceservice?wsdl"]:nameSpace2 :@"getVacation_id" :[NSString stringWithFormat:@"{\"condition\":{\"user_id\":\"%@\"}}", self->name]];
}
- (NSString*)vacationinfo:(NSString*)vacation_id
{
    return [self SendHttpRequest1:[appServiceUrl stringByAppendingString:@"/webservice/attendanceservice?wsdl"]:nameSpace2 :@"vacationinfo" :[NSString stringWithFormat:@"{\"condition\":{\"vacation_id\":\"%@\"}}", vacation_id]];
}
- (NSString*)vacationaudit:(NSString*)vacation_id:(NSString*)auditflag
{
    return [self SendHttpRequest1:[appServiceUrl stringByAppendingString:@"/webservice/attendanceservice?wsdl"]:nameSpace2 :@"vacationauditxinge" :[NSString stringWithFormat:@"{\"condition\":{\"vacation_id\":\"%@\", \"flag\":\"%@\",\"user_id\":\"%@\"}}", vacation_id,auditflag,self->name]];
}
- (NSString*)vacationadd:(NSString*)student_id:(NSString*)start_date:(NSString*)start_time:(NSString*)end_date:(NSString*)end_time:(NSString*)reason
{
    return [self SendHttpRequest1:[appServiceUrl stringByAppendingString:@"/webservice/attendanceservice?wsdl"]:nameSpace2 :@"vacationaddxinge" :[NSString stringWithFormat:@"{\"condition\":{\"user_id\":\"%@\",\"student_id\":\"%@\", \"start_date\":\"%@\",\"start_time\":\"%@\", \"end_date\":\"%@\",\"end_time\":\"%@\",\"reason\":\"%@\"}}", self->name,student_id,start_date,start_time,end_date,end_time,reason]];
}

//
- (NSString*)getBodyTemperaturesForParent:(NSString*)student_id: (NSString*)search_date
{
    return [self SendHttpRequest1:[appServiceUrl stringByAppendingString:@"/webservice/bodytemperatureservice?wsdl"]:nameSpace2 :@"bodyTemperatureForParent" :[NSString stringWithFormat:@"{\"condition\":{\"student_id\":\"%@\", \"search_date\":\"%@\"}}", student_id,[self dateStringConverter:search_date]]];
}

- (NSString*)getBodyTemperatures:(NSString*)student_id: (NSString*)search_date
{
    return [self SendHttpRequest1:[appServiceUrl stringByAppendingString:@"/webservice/bodytemperatureservice?wsdl"]:nameSpace2 :@"bodyTemperature" :[NSString stringWithFormat:@"{\"condition\":{\"group_id\":\"%@\", \"search_date\":\"%@\"}}", student_id,[self dateStringConverter:search_date]]];
}
- (NSString*)bodyTemperatureTrade:(NSString*)student_id
{
    return [self SendHttpRequest1:[appServiceUrl stringByAppendingString:@"/webservice/bodytemperatureservice?wsdl"]:nameSpace2 :@"bodyTemperatureTrade" :[NSString stringWithFormat:@"{\"condition\":{\"student_id\":\"%@\"}}", student_id]];
}
- (NSString*)bodyTemperatureTradeParent
{
    return [self SendHttpRequest1:[appServiceUrl stringByAppendingString:@"/webservice/bodytemperatureservice?wsdl"]:nameSpace2 :@"bodyTemperatureTradeForParent" :[NSString stringWithFormat:@"{\"condition\":{\"user_id\":\"%@\"}}", self->name]];
}
- (NSString*)getAlarmBodyTemperatures:(NSString*)search_date
{
    return [self SendHttpRequest1:[appServiceUrl stringByAppendingString:@"/webservice/bodytemperatureservice?wsdl"]:nameSpace2 :@"bodyTemperatureAlarm" :[NSString stringWithFormat:@"{\"condition\":{\"user_id\":\"%@\",\"search_date\":\"%@\"}}", self->name,[self dateStringConverter:search_date]]];
}


- (NSString*)lessonlist:(NSString*)group_id
{
    return [self SendHttpRequest1:[appServiceUrl stringByAppendingString:@"/webservice/homeworkservice?wsdl"]:nameSpace2 :@"lessonlist" :[NSString stringWithFormat:@"{\"condition\":{\"user_id\":\"%@\",\"group_id\":\"%@\"}}", self->name,group_id]];
}
- (NSString*)homeworkPublish:(NSString*)group_id:(NSString*)lesson_id:(NSString*)homework_content:(NSString*)edit_date:(NSString*)imgPath
{
    return [self SendHttpRequest1:[appServiceUrl stringByAppendingString:@"/webservice/homeworkservice?wsdl"]:nameSpace2 :@"homeworkPublishxinge" :[NSString stringWithFormat:@"{\"condition\":{\"user_id\":\"%@\",\"group_id\":\"%@\",\"lesson_id\":\"%@\",\"homework_content\":\"%@\",\"edit_date\":\"%@\",\"picture\":\"%@\"}}", self->name,group_id,lesson_id,homework_content,edit_date,imgPath]];
}
- (NSString*)homeworksearch:(NSString*)groupId:(NSString*)esson_id:(NSString*)beginDate:(NSString*)endDate
{
//    if ([[UserManager shareController] UserType] == PARENT) {
//        return [self SendHttpRequest1:[appServiceUrl stringByAppendingString:@"/webservice/homeworkservice?wsdl"]:nameSpace2 :@"homeworksearchForParent" :[NSString stringWithFormat:@"{\"condition\":{\"student_id\":\"%@\",\"lesson_id\":\"%@\",\"searchbegindate\":\"%@\",\"searchenddate\":\"%@\"}}", groupId,esson_id,beginDate,endDate]];
//    }
//    else
    {
    return [self SendHttpRequest1:[appServiceUrl stringByAppendingString:@"/webservice/homeworkservice?wsdl"]:nameSpace2 :@"homeworksearch" :[NSString stringWithFormat:@"{\"condition\":{\"group_id\":\"%@\",\"lesson_id\":\"%@\",\"searchbegindate\":\"%@\",\"searchenddate\":\"%@\"}}", groupId,esson_id,beginDate,endDate]];
    }
}
- (NSString*)homeworkinfo:(NSString*)homework_id
{
    return [self SendHttpRequest1:[appServiceUrl stringByAppendingString:@"/webservice/homeworkservice?wsdl"]:nameSpace2 :@"homeworkinfo" :[NSString stringWithFormat:@"{\"condition\":{\"homework_id\":\"%@\"}}", homework_id]];
}
- (NSString*)lessonlistForParent:(NSString*)group_id
{
    return [self SendHttpRequest1:[appServiceUrl stringByAppendingString:@"/webservice/homeworkservice?wsdl"]:nameSpace2 :@"lessonlistForParent" :[NSString stringWithFormat:@"{\"condition\":{\"student_id\":\"%@\"}}", group_id]];
}
- (NSString*)todayChildrenHomework
{
    return [self SendHttpRequest1:[appServiceUrl stringByAppendingString:@"/webservice/homeworkservice?wsdl"]:nameSpace2 :@"todayChildrenHomework" :[NSString stringWithFormat:@"{\"condition\":{\"user_id\":\"%@\"}}", self->name]];
}


- (NSString*)noticeadd:(NSString*)group_id:(NSString*)rangeValue:(NSString*)title:(NSString*)notice_info:(NSString*)imgPath
{
    return [self SendHttpRequest1:[appServiceUrl stringByAppendingString:@"/webservice/noticeservice?wsdl"]:nameSpace2 :@"noticeaddxinge" :[NSString stringWithFormat:@"{\"condition\":{\"user_id\":\"%@\",\"group_id\":\"%@\",\"type\":\"%@\",\"title\":\"%@\",\"notice_info\":\"%@\",\"picture\":\"%@\"}}", self->name,group_id,rangeValue,title,notice_info,imgPath]];
}
- (NSString*)noticeinfo:notice_id
{
    return [self SendHttpRequest1:[appServiceUrl stringByAppendingString:@"/webservice/noticeservice?wsdl"]:nameSpace2 :@"noticeinfo" :[NSString stringWithFormat:@"{\"condition\":{\"notice_id\":\"%@\"}}", notice_id]];
}
- (NSString*)noticelist
{
    return [self SendHttpRequest1:[appServiceUrl stringByAppendingString:@"/webservice/noticeservice?wsdl"]:nameSpace2 :@"noticelist" :[NSString stringWithFormat:@"{\"condition\":{\"user_id\":\"%@\"}}", self->name]];
}


- (NSString*)jrzfinfo:jrzf_id
{
    return [self SendHttpRequest1:[appServiceUrl stringByAppendingString:@"/webservice/noticeservice?wsdl"]:nameSpace2 :@"jrzfinfo" :[NSString stringWithFormat:@"{\"condition\":{\"jrzf_id\":\"%@\"}}", jrzf_id]];
}
- (NSString*)jrzflist
{
    return [self SendHttpRequest1:[appServiceUrl stringByAppendingString:@"/webservice/noticeservice?wsdl"]:nameSpace2 :@"jrzflist" :[NSString stringWithFormat:@"{\"condition\":{\"user_id\":\"%@\"}}", self->name]];
}
- (NSString*)getUserSchoolAndName
{
    return [self SendHttpRequest1:[appServiceUrl stringByAppendingString:@"/webservice/noticeservice?wsdl"]:nameSpace2 :@"getUserSchoolAndName" :[NSString stringWithFormat:@"{\"condition\":{\"user_id\":\"%@\"}}", self->name]];
}
- (NSString*)hkList
{
    return [self SendHttpRequest1:[appServiceUrl stringByAppendingString:@"/webservice/noticeservice?wsdl"]:nameSpace2 :@"hklist" :[NSString stringWithFormat:@"{\"condition\":{\"user_id\":\"%@\"}}", self->name]];
}
- (NSString*)jrzfadd:object:content:inscribe:rangeValue:greetingCard
{
    return [self SendHttpRequest1:[appServiceUrl stringByAppendingString:@"/webservice/noticeservice?wsdl"]:nameSpace2 :@"jrzfaddxinge" :[NSString stringWithFormat:@"{\"condition\":{\"user_id\":\"%@\",\"ch\":\"%@\",\"zf\":\"%@\",\"lk\":\"%@\",\"type\":\"%@\",\"hk_name\":\"%@\"}}", self->name,object,content,inscribe,rangeValue,greetingCard]];
}

-(NSString*)srzflist
{
    return [self SendHttpRequest1:[appServiceUrl stringByAppendingString:@"/webservice/noticeservice?wsdl"]:nameSpace2 :@"srzflist" :[NSString stringWithFormat:@"{\"condition\":{\"user_id\":\"%@\"}}", self->name]];
}

-(NSString*)srzfadd:(NSString*)student_id:(NSString*)student_name:(NSString*)birthday
{
    return [self SendHttpRequest1:[appServiceUrl stringByAppendingString:@"/webservice/noticeservice?wsdl"]:nameSpace2 :@"srzfaddxinge" :[NSString stringWithFormat:@"{\"condition\":{\"user_id\":\"%@\",\"student_id\":\"%@\",\"student_name\":\"%@\",\"birthday\":\"%@\"}}", self->name,student_id,student_name,birthday]];
}

-(NSString*)srzftx
{
    NSString *res = [self SendHttpRequest1:[appServiceUrl stringByAppendingString:@"/webservice/noticeservice?wsdl"]:nameSpace2 :@"srzftx" :[NSString stringWithFormat:@"{\"condition\":{\"user_id\":\"%@\"}}", self->name]];
    return res;
}

//
-(NSString*)getStudents:(NSString*)group_id
{
    return [self SendHttpRequest1:[appServiceUrl stringByAppendingString:@"/webservice/studentmanagementservice?wsdl"]:nameSpace2 :@"studentlist" :[NSString stringWithFormat:@"{\"condition\":{\"group_id\":\"%@\"}}", group_id]];
}
-(NSString*)searchStudents:(NSString*)group_id:(NSString*)studentName:(NSString*)xjh:(NSString*)studentNumber
{
    return [self SendHttpRequest1:[appServiceUrl stringByAppendingString:@"/webservice/studentmanagementservice?wsdl"]:nameSpace2 :@"studentsearch" :[NSString stringWithFormat:@"{\"condition\":{\"group_id\":\"%@\",\"student_name\":\"%@\",\"xjh\":\"%@\",\"student_no\":\"%@\"}}", group_id,studentName,xjh,studentNumber]];
}
-(NSString*)studenttj:(NSString*)group_id:(NSString*)type
{
    return [self SendHttpRequest1:[appServiceUrl stringByAppendingString:@"/webservice/studentmanagementservice?wsdl"]:nameSpace2 :@"studenttj" :[NSString stringWithFormat:@"{\"condition\":{\"group_id\":\"%@\",\"tj_type\":\"%@\"}}", group_id,type]];
}

-(NSString*)showInfo:(NSString*)Id
{
    return [self SendHttpRequest1:[appServiceUrl stringByAppendingString:@"/webservice/studentmanagementservice?wsdl"]:nameSpace2 :@"studentinfo" :[NSString stringWithFormat:@"{\"condition\":{\"student_id\":\"%@\"}}", Id]];
    
}

//
-(NSString*)getSemesterList:(NSString*)group_id
{
    return [self SendHttpRequest1:[appServiceUrl stringByAppendingString:@"/webservice/scheduleservice?wsdl"]:nameSpace2 :@"xqlist" :[NSString stringWithFormat:@"{\"condition\":{\"group_id\":\"%@\"}}", group_id]];
}
-(NSString*)getSchedule:(NSString*)group_id:(NSString*)xq_id
{
    return [self SendHttpRequest1:[appServiceUrl stringByAppendingString:@"/webservice/scheduleservice?wsdl"]:nameSpace2 :@"schedule" :[NSString stringWithFormat:@"{\"condition\":{\"group_id\":\"%@\",\"xq_id\":\"%@\"}}", group_id,xq_id]];
}
-(NSString*)teacherList:(NSString*)group_id
{
    return [self SendHttpRequest1:[appServiceUrl stringByAppendingString:@"/webservice/scheduleservice?wsdl"]:nameSpace2 :@"teacherlist" :[NSString stringWithFormat:@"{\"condition\":{\"group_id\":\"%@\"}}", group_id]];
}

//
-(NSString*)ksList:(NSString*)student_id
{
    return [self SendHttpRequest1:[appServiceUrl stringByAppendingString:@"/webservice/scoreservice?wsdl"]:nameSpace2 :@"ksList" :[NSString stringWithFormat:@"{\"condition\":{\"student_id\":\"%@\"}}", student_id]];
}
//kslessonlist函数未用到
-(NSString*)ksLessonListforGroup:(NSString*)group_id
{
    return [self SendHttpRequest1:[appServiceUrl stringByAppendingString:@"/webservice/scoreservice?wsdl"]:nameSpace2 :@"ksLessonListforGroup" :[NSString stringWithFormat:@"{\"condition\":{\"group_id\":\"%@\"}}", group_id]];
}
-(NSString*)getExaminationSubject:(NSString*)student_id
{
    return [self SendHttpRequest1:[appServiceUrl stringByAppendingString:@"/webservice/scoreservice?wsdl"]:nameSpace2 :@"getExaminationSubject" :[NSString stringWithFormat:@"{\"condition\":{\"student_id\":\"%@\"}}", student_id]];
}
-(NSString*)groupScoreFenxi:(NSString*)group_id:(NSString*)lesson
{
    return [self SendHttpRequest1:[appServiceUrl stringByAppendingString:@"/webservice/scoreservice?wsdl"]:nameSpace2 :@"groupScoreFenxi" :[NSString stringWithFormat:@"{\"condition\":{\"group_id\":\"%@\",\"lesson\":\"%@\"}}", group_id,lesson]];
}
-(NSString*)studentScoreFenxi:(NSString*)student_id:(NSString*)lesson
{
    return [self SendHttpRequest1:[appServiceUrl stringByAppendingString:@"/webservice/scoreservice?wsdl"]:nameSpace2 :@"studentScoreFenxi" :[NSString stringWithFormat:@"{\"condition\":{\"student_id\":\"%@\",\"lesson\":\"%@\"}}", student_id,lesson]];
}
-(NSString*)scoreInquiry:(NSString*)student_id:(NSString*)record_name
{
    return [self SendHttpRequest1:[appServiceUrl stringByAppendingString:@"/webservice/scoreservice?wsdl"]:nameSpace2 :@"cjsearch" :[NSString stringWithFormat:@"{\"condition\":{\"student_id\":\"%@\",\"record_name\":\"%@\"}}", student_id,record_name]];

}

//Health
- (NSString*)getExaminationTrade:(NSString*)student_id:(NSString*)examination_type
{
    return [self SendHttpRequest1:[appServiceUrl stringByAppendingString:@"/webservice/bodyexaminationservice?wsdl"]:nameSpace2 :@"bodyExaminationTrade" :[NSString stringWithFormat:@"{\"condition\":{\"student_id\":\"%@\",\"examination_type\":\"%@\"}}", student_id,examination_type]];
}
- (NSString*)getExaminationDates:(NSString*)group_id
{
    return [self SendHttpRequest1:[appServiceUrl stringByAppendingString:@"/webservice/bodyexaminationservice?wsdl"]:nameSpace2 :@"bodyExamDate" :[NSString stringWithFormat:@"{\"condition\":{\"group_id\":\"%@\"}}", group_id]];
}
- (NSString*)getExaminationRecords:(NSString*)group_id:(NSString*)search_date
{
    return [self SendHttpRequest1:[appServiceUrl stringByAppendingString:@"/webservice/bodyexaminationservice?wsdl"]:nameSpace2 :@"bodyExamination" :[NSString stringWithFormat:@"{\"condition\":{\"group_id\":\"%@\",\"examinate_date\":\"%@\"}}", group_id,search_date]];
}
- (NSString*)getExaminationDatesForParent:(NSString*)student_id
{
    return [self SendHttpRequest1:[appServiceUrl stringByAppendingString:@"/webservice/bodyexaminationservice?wsdl"]:nameSpace2 :@"bodyExamDateForParent" :[NSString stringWithFormat:@"{\"condition\":{\"student_id\":\"%@\"}}", student_id]];
}
- (NSString*)getExaminationRecordsForParent:(NSString*)student_id:(NSString*)search_date
{
    return [self SendHttpRequest1:[appServiceUrl stringByAppendingString:@"/webservice/bodyexaminationservice?wsdl"]:nameSpace2 :@"bodyExaminationForParent" :[NSString stringWithFormat:@"{\"condition\":{\"student_id\":\"%@\",\"examinate_date\":\"%@\"}}", student_id,search_date]];
}
- (NSString*)getExaminationType
{
    return [self SendHttpRequest1:[appServiceUrl stringByAppendingString:@"/webservice/baseservice?wsdl"]:nameSpace2 :@"basecode" :[NSString stringWithFormat:@"{\"condition\":{\"code_type\":\"EXAMINATION_TYPE\"}}"]];
}

//GrowthTree
- (NSString*)getgrowtreepic:(NSString*)student_id
{
    return [self SendHttpRequest1:[appServiceUrl stringByAppendingString:@"/webservice/growthtreeservice?wsdl"]:nameSpace2 :@"getgrowtreepic" :[NSString stringWithFormat:@"{\"condition\":{\"student_id\":\"%@\"}}", student_id]];
}
- (NSString*)addgrowtree:(NSString*)student_id:(NSString*)title:(NSString*)content:(NSString*)treeDate:(NSString*)address:(NSString*)imgPath
{
    return [self SendHttpRequest1:[appServiceUrl stringByAppendingString:@"/webservice/growthtreeservice?wsdl"]:nameSpace2 :@"addgrowtree" :[NSString stringWithFormat:@"{\"condition\":{\"student_id\":\"%@\",\"user_id\":\"%@\",\"title\":\"%@\",\"idea\":\"%@\",\"userdate\":\"%@\",\"address\":\"%@\",\"picture\":\"%@\"}}", student_id,self->name,title,content,treeDate,address,imgPath]];
}
- (NSString*)getgrowtreeidallpic:(NSString*)studentId:(NSString*)treeId
{
    return [self SendHttpRequest1:[appServiceUrl stringByAppendingString:@"/webservice/growthtreeservice?wsdl"]:nameSpace2 :@"getgrowtreepic" :[NSString stringWithFormat:@"{\"condition\":{\"student_id\":\"%@\",\"growtree_id\":\"%@\"}}", studentId,treeId]];
}
- (NSString*)addgrowtreepic:(NSString*)studentId:(NSString*)treeId:(NSString*)imgPath
{
    return [self SendHttpRequest1:[appServiceUrl stringByAppendingString:@"/webservice/growthtreeservice?wsdl"]:nameSpace2 :@"getgrowtreepic" :[NSString stringWithFormat:@"{\"condition\":{\"student_id\":\"%@\",\"user_id\":\"%@\",\"growtree_id\":\"%@\",\"picture\":\"%@\"}}", studentId,self->name,treeId,imgPath]];
}

//Feedback
-(NSString*)feedbackadd:(NSString*)student_id:(NSString*)type:(NSString*)feedback_info;
{
    return [self SendHttpRequest1:[appServiceUrl stringByAppendingString:@"/webservice/feedbackservice?wsdl"]:nameSpace2 :@"feedbackaddxinge" :[NSString stringWithFormat:@"{\"condition\":{\"user_id\":\"%@\",\"student_id\":\"%@\",\"type\":\"%@\",\"feedback_info\":\"%@\"}}", self->name,student_id,type,feedback_info]];
}
-(NSString*)feedbackinfo:(NSString*)feedback_id
{
    return [self SendHttpRequest1:[appServiceUrl stringByAppendingString:@"/webservice/feedbackservice?wsdl"]:nameSpace2 :@"feedbackinfo" :[NSString stringWithFormat:@"{\"condition\":{\"feedback_id\":\"%@\"}}", feedback_id]];
}
-(NSString*)feedbackreply:(NSString*)feedback_id:(NSString*)content
{
    return [self SendHttpRequest1:[appServiceUrl stringByAppendingString:@"/webservice/feedbackservice?wsdl"]:nameSpace2 :@"feedbackreplyxinge" :[NSString stringWithFormat:@"{\"condition\":{\"user_id\":\"%@\",\"feedback_id\":\"%@\",\"reply_info\":\"%@\"}}", self->name,feedback_id,content]];
}
-(NSString*)feedbacklist
{
    return [self SendHttpRequest1:[appServiceUrl stringByAppendingString:@"/webservice/feedbackservice?wsdl"]:nameSpace2 :@"feedbacklist" :[NSString stringWithFormat:@"{\"condition\":{\"user_id\":\"%@\"}}", self->name]];
}

-(NSString*)updatePassword:(NSString*)oldPassword:(NSString*)newPassword
{
    return [self SendHttpRequest1:[appServiceUrl stringByAppendingString:@"/webservice/loginservice?wsdl"]:nameSpace2 :@"updatePassword" :[NSString stringWithFormat:@"{\"condition\":{\"user_id\":\"%@\",\"old_password\":\"%@\",\"new_password\":\"%@\"}}", self->name,oldPassword,newPassword]];
}


-(NSString*)xxrecordlist
{
    return [self SendHttpRequest1:[appServiceUrl stringByAppendingString:@"/webservice/noticeservice?wsdl"]:nameSpace2 :@"xxrecordlist" :[NSString stringWithFormat:@"{\"condition\":{\"user_id\":\"%@\"}}", self->name]];
}

-(NSString*)updatexxrecord:(NSString*)messageID
{
    return [self SendHttpRequest1:[appServiceUrl stringByAppendingString:@"/webservice/noticeservice?wsdl"]:nameSpace2 :@"updatexxrecord" :[NSString stringWithFormat:@"{\"condition\":{\"record_id\":\"%@\"}}", messageID]];
}

-(NSString*)getLogoAndSchoolName
{
    return [self SendHttpRequest1:[appServiceUrl stringByAppendingString:@"/webservice/baseservice?wsdl"]:nameSpace2 :@"userGetSchools" :[NSString stringWithFormat:@"{\"condition\":{\"user_id\":\"%@\"}}", self->name]];
}

-(NSString*)SendHttpRequest1:(NSString*)webserviceurl:(NSString*) nameSpace:(NSString*)methodName:(NSString*) postData
{
    NSURL *url = [NSURL URLWithString:webserviceurl];
    
    ASIFormDataRequest *request=[ASIFormDataRequest requestWithURL:url];
    NSString *soapData = [NSString stringWithFormat:
                          @"<SOAP-ENV:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:SOAP-ENV=\"http://schemas.xmlsoap.org/soap/envelope/\" xmlns:SOAP-ENC=\"http://schemas.xmlsoap.org/soap/encoding/\">\n"
                          "<SOAP-ENV:Body>\n"
                          "<m:%@ xmlns:m=\"%@\">\n"
                          "<inputJson>\n"
                          "%@"
                          "</inputJson>\n"
                          "</m:%@>\n"
                          "</SOAP-ENV:Body>\n"
                          "</SOAP-ENV:Envelope>\n",methodName,nameSpace,postData,methodName];
    NSString *msgLength = [NSString stringWithFormat:@"%d",[soapData length]];
    [request addRequestHeader:@"Content-Type" value:@"text/xml; charset=utf-8"];
    [request addRequestHeader:@"Content-Length" value:msgLength];
    NSData *da =[soapData dataUsingEncoding:NSUTF8StringEncoding];
    NSMutableData *data =[NSMutableData dataWithData:da];
    [request setPostBody:data];
    [request setRequestMethod:@"POST"];
    [request setValidatesSecureCertificate:NO];
    [request setTimeOutSeconds:7.0];//表示30秒请求超时
    [request setDefaultResponseEncoding:NSUTF8StringEncoding];
    
    //[request setDelegate:self];
    //[request startAsynchronous];
    [request startSynchronous];
    NSError *error = [request error ];
    NSLog(@"Web End");
    if (error) {
        NSString *errorMessage = error.userInfo[@"NSLocalizedDescription"];
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:errorMessage delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        [alert show];
    }
    // 如果请求成功，返回 Response
    NSString *response = [request responseString ];
    //NSLog ( @"%@" ,response);
    xmlParser = [[NSXMLParser alloc] initWithData:[response dataUsingEncoding:NSUTF8StringEncoding]];
    [xmlParser setDelegate:self];
    [xmlParser setShouldProcessNamespaces:NO];
    [xmlParser setShouldReportNamespacePrefixes:NO];
    [xmlParser setShouldResolveExternalEntities:NO];
    [xmlParser parse];
    
    NSDictionary *responseDict = [tempString JSONValue];
    NSDictionary *result= [responseDict objectForKey:@"result"];
    if (result == nil) {
        if ([responseDict[@"returnMessage"] isEqualToString:@"success"])
        {
            return @"true";
        }else{
            if(responseDict[@"info"] == nil)
            {
                return @"false";
            }else{
                return responseDict[@"info"];
            }
        }
    }
    return [result JSONRepresentation];
    
}


- (void)SendHttpRequest:(NSString*)webserviceurl:(NSString*) nameSpace:(NSString*)methodName:(NSString*) postData
{
    NSURL *url = [NSURL URLWithString:webserviceurl];
    
    ASIFormDataRequest *request=[ASIFormDataRequest requestWithURL:url];
    NSString *soapData = [NSString stringWithFormat:
                          @"<SOAP-ENV:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:SOAP-ENV=\"http://schemas.xmlsoap.org/soap/envelope/\" xmlns:SOAP-ENC=\"http://schemas.xmlsoap.org/soap/encoding/\">\n"
                          "<SOAP-ENV:Body>\n"
                          "<m:%@ xmlns:m=\"%@\">\n"
                          "<inputJson>\n"
                          "%@"
                          "</inputJson>\n"
                          "</m:%@>\n"
                          "</SOAP-ENV:Body>\n"
                          "</SOAP-ENV:Envelope>\n",methodName,nameSpace,postData,methodName];
    NSString *msgLength = [NSString stringWithFormat:@"%d",[soapData length]];
    [request addRequestHeader:@"Content-Type" value:@"text/xml; charset=utf-8"];
    [request addRequestHeader:@"Content-Length" value:msgLength];
    NSData *da =[soapData dataUsingEncoding:NSUTF8StringEncoding];
    NSMutableData *data =[NSMutableData dataWithData:da];
    [request setPostBody:data];
    [request setRequestMethod:@"POST"];
    [request setValidatesSecureCertificate:NO];
    [request setTimeOutSeconds:10.0];//表示30秒请求超时
    [request setDefaultResponseEncoding:NSUTF8StringEncoding];
    
    [request setDelegate:self];
    [request startAsynchronous];
    
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self->currentView animated:YES];
    hud.labelText = @"正在登录，请等待...";
}
- (void)SetDalegate:id
{
    delegate = id;
}
- (void)requestFinished:(ASIHTTPRequest *)request
{
    [MBProgressHUD hideHUDForView:self->currentView animated:YES];
    if (request.responseStatusCode == 400) {
        //textView.text = ;
        [self->delegate HttpFailCallBack:@"Invalid code"];
    } else if (request.responseStatusCode == 403) {
        //textView.text = ;
        [self->delegate HttpFailCallBack:@"Code already used"];
    } else if (request.responseStatusCode == 200) {
        NSString *responseString = [request responseString];
        xmlParser = [[NSXMLParser alloc] initWithData:[responseString dataUsingEncoding:NSUTF8StringEncoding]];
        [xmlParser setDelegate:self];
        [xmlParser setShouldProcessNamespaces:NO];
        [xmlParser setShouldReportNamespacePrefixes:NO];
        [xmlParser setShouldResolveExternalEntities:NO];
        [xmlParser parse];
        
        NSDictionary *responseDict = [tempString JSONValue];
        NSDictionary *result= [responseDict objectForKey:@"result"];
        
        switch (_methodType) {
            case GETSERVERADDR:
            
            if ([responseDict[@"returnMessage"] isEqualToString: @"success"]) {
                if (result[@"SERVERADDRESS"]!= nil) {
                    appServiceUrl = result[@"SERVERADDRESS"];//stringByAppendingString:@"/webservice/loginservice?wsdl"];
                    [self Login:name:password];
                }
                else{
                    [self->delegate HttpFailCallBack:@"获取服务器地址错误！"];
                }
            }else{
                [self->delegate HttpFailCallBack:@"系统中没有满足查询条件的数据！"];
            }
            break;
            case LOGIN:
            if ([responseDict[@"returnMessage"] isEqualToString: @"success"]) {
                [self->delegate HttpSuccessDictionaryCallBack:result];
                
                //[self Schoolintroduce:@"1001"];
            }else if([responseDict[@"returnMessage"] isEqualToString: @"nouser"]){
                [self->delegate HttpFailCallBack:@"系统中没有该用户！"];
            }else if([responseDict[@"returnMessage"] isEqualToString: @"invalidPassword"]){
                [self->delegate HttpFailCallBack:@"密码错误！"];
            }else{
                [self->delegate HttpFailCallBack:@"密码错误！"];
            }
            break;
            default:
            [self->delegate HttpSuccessCallBack:[result JSONRepresentation]];
            break;
        }
    } else {
        [self->delegate HttpFailCallBack:[NSString stringWithFormat:@"Unexpected error:%d",request.responseStatusCode]];
    }
    
    NSMutableData *data = request.rawResponseData;
    NSString *str = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    
}


- (void)requestFailed:(ASIHTTPRequest *)request
{
    [MBProgressHUD hideHUDForView:self->currentView animated:YES];
    NSError *error = [request error];
    //[self->delegate HttpFailCallBack:error.userInfo ];
    NSString *errorMessage = error.userInfo[@"NSLocalizedDescription"];
    [self->delegate HttpFailCallBack:errorMessage];
}

//准备解析节点

- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qualifiedName attributes:(NSDictionary *)attributeDict {
    if (([elementName isEqualToString:@"ns2:returnJson"])) {
        isReturnFlag = true;
        self->tempString = [NSMutableString string];
    }
}

//获取首尾节点间内容

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string {
    
    if (isReturnFlag) {
        [self->tempString appendString:string];
    }
}

//解析完当前节点

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName {
    //    if (isReturnFlag) {
    //        isReturnFlag = false;
    //    }
}

//日期格式转换
- (NSString*)dateStringConverter:(NSString*)oldDateString
{
    //实例化一个NSDateFormatter对象
    NSDateFormatter *oldDateFormatter = [[NSDateFormatter alloc] init];
    //设定时间格式,这里可以设置成自己需要的格式
    [oldDateFormatter setDateFormat:@"yyyy-M-d"];
    NSDateFormatter *newDateFormatter = [[NSDateFormatter alloc] init];
    //设定时间格式,这里可以设置成自己需要的格式
    [newDateFormatter setDateFormat:@"yyyy-MM-dd"];
    NSDate *date = [oldDateFormatter dateFromString:oldDateString];
    //用[NSDate date]可以获取系统当前时间
    NSString *newDateStr = [newDateFormatter stringFromDate:date];
    return newDateStr;
}
@end
