//
//  SchoolSummary.h
//  WeiXiaoYuan
//
//  Created by 姚振兴 on 14/11/19.
//
//

#import <Foundation/Foundation.h>
#import "WebServiceController.h"
#import "JsPluginBase.h"
@interface SchoolSummary : JsPluginBase
{
    WebServiceController *_webServiceController;
}
- (NSString*)schoolintroduce:(NSString*)groupId;
- (NSString*)teachersintroduce:(NSString*)groupId;
- (NSString*)honerintroduce:(NSString*)groupId;
- (NSString*)recruitstudentslist:(NSString*)groupId;
- (NSString*)recruitstudentsinfo:(NSString*)groupId;
- (NSString*)dynamiclist:(NSString*)groupId;
- (NSString*)dynamicinfo:(NSString*)groupId;
//-(NSString*)judgeUrlFromCache:(NSString*)picUrl;
@end
