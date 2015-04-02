//
//  SchoolSummary.m
//  WeiXiaoYuan
//
//  Created by 姚振兴 on 14/11/19.
//
//

#import "SchoolSummary.h"
@implementation SchoolSummary
-(NSString*)schoolintroduce:(NSString*)groupId
{
    _webServiceController = [WebServiceController shareController:nil];

    if (groupId != nil
        && [groupId length] > 0)
    {
        return [_webServiceController Schoolintroduce:groupId];
    }
    return @"";
}
-(NSString*)teachersintroduce:(NSString*)groupId
{
    _webServiceController = [WebServiceController shareController:nil];
    
    if (groupId != nil
        && [groupId length] > 0)
    {
        return [_webServiceController teachersintroduce:groupId];
    }
    return @"";
}
- (NSString*)honerintroduce:(NSString*)groupId
{
    _webServiceController = [WebServiceController shareController:nil];
    
    if (groupId != nil
        && [groupId length] > 0)
    {
        return [_webServiceController honerintroduce:groupId];
    }
    return @"";
}
- (NSString*)recruitstudentslist:(NSString*)groupId
{
    _webServiceController = [WebServiceController shareController:nil];
    
    if (groupId != nil
        && [groupId length] > 0)
    {
        return [_webServiceController recruitstudentslist:groupId];
    }
    return @"";
}
- (NSString*)recruitstudentsinfo:(NSString*)ID
{
    _webServiceController = [WebServiceController shareController:nil];
    
    if (ID != nil
        && [ID length] > 0)
    {
        return [_webServiceController recruitstudentsinfo:ID];
    }
    return @"";
}
- (NSString*)dynamiclist:(NSString*)groupId
{
    _webServiceController = [WebServiceController shareController:nil];
    
    if (groupId != nil
        && [groupId length] > 0)
    {
        return [_webServiceController dynamiclist:groupId];
    }
    return @"";
}
- (NSString*)dynamicinfo:(NSString*)groupId
{
    _webServiceController = [WebServiceController shareController:nil];
    
    if (groupId != nil
        && [groupId length] > 0)
    {
        return [_webServiceController dynamicinfo:groupId];
    }
    return @"";
}
-(NSString*)judgeUrlFromCache:(NSString*)picUrl
{
    return [super judgeUrlFromCache:picUrl];
}

@end
