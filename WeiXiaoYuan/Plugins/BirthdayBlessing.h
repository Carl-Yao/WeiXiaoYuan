//
//  BirthdayBlessing.h
//  WeiXiaoYuan
//
//  Created by 姚振兴 on 14/12/19.
//  Copyright (c) 2014年 Dukeland. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WebServiceController.h"
#import "JsPluginBase.h"
@interface BirthdayBlessing : JsPluginBase
{
    WebServiceController *_webServiceController;
}
-(NSString*)srzflist;
-(NSString*)srzfadd:(NSString*)student_id:(NSString*)student_name:(NSString*)birthday;
-(NSString*)srzftx;
-(void)closePage;
@end
