//
//  Feedback.h
//  WeiXiaoYuan
//
//  Created by 姚振兴 on 14/12/22.
//  Copyright (c) 2014年 Dukeland. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WebServiceController.h"
#import "JsPluginBase.h"
@interface Feedback : JsPluginBase
{
    WebServiceController *_webServiceController;
}
@property(nonatomic,strong)NSString* feedbackID;
-(NSString*)feedbackadd:(NSString*)student_id:(NSString*)type:(NSString*)feedback_info;
-(NSString*)feedbackinfo:(NSString*)feedback_id;
-(NSString*)feedbackreply:(NSString*)feedback_id:(NSString*)content;
-(NSString*)feedbacklist;
-(NSString*)getFeedbackID;
- (void)closePage;

@end
