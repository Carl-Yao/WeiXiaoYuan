//
//  Feedback.m
//  WeiXiaoYuan
//
//  Created by 姚振兴 on 14/12/22.
//  Copyright (c) 2014年 Dukeland. All rights reserved.
//

#import "Feedback.h"

@implementation Feedback
@synthesize feedbackID;
-(NSString*)feedbackadd:(NSString*)student_id:(NSString*)type:(NSString*)feedback_info
{
    _webServiceController = [WebServiceController shareController:nil];
    
    NSString * str = [_webServiceController feedbackadd:student_id:type:feedback_info];
    return str;
}
-(NSString*)feedbackinfo:(NSString*)feedback_id
{
    _webServiceController = [WebServiceController shareController:nil];
    
    NSString * str = [_webServiceController feedbackinfo:feedback_id];
    return str;
}
-(NSString*)feedbackreply:(NSString*)feedback_id:(NSString*)content
{
    _webServiceController = [WebServiceController shareController:nil];
    
    NSString * str = [_webServiceController feedbackreply:feedback_id:content];
    return str;
}
-(NSString*)feedbacklist
{
    _webServiceController = [WebServiceController shareController:nil];
    
    NSString * str = [_webServiceController feedbacklist];
    return str;
}
-(NSString*)getFeedbackID
{
    return feedbackID;
}
- (void)closePage
{
    return;
}
@end
