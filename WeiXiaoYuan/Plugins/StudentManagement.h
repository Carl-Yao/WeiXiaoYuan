//
//  StudentManagement.h
//  WeiXiaoYuan
//
//  Created by 姚振兴 on 14/12/20.
//  Copyright (c) 2014年 Dukeland. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WebServiceController.h"
#import "JsPluginBase.h"
@interface StudentManagement : JsPluginBase
{
    WebServiceController *_webServiceController;
}
-(NSString*)getStudents:(NSString*)group_id;
-(NSString*)searchStudents:(NSString*)group_id:(NSString*)studentName:(NSString*)xjh:(NSString*)studentNumber;
-(NSString*)studenttj:(NSString*)group_id:(NSString*)type;
//no use
-(NSString*)showInfo:(NSString*)Id;
-(NSString*)getWidth;
-(NSString*)getHeight;

@end
