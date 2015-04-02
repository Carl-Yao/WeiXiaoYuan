//
//  JsInterface.h
//  WeiXiaoYuan
//
//  Created by 姚振兴 on 14/11/22.
//
//
#import <Foundation/Foundation.h>
//#import <Cordova/CDVPlugin.h>
#import "WebServiceController.h"
#import "JsPluginBase.h"
@interface JsInterface : JsPluginBase<HttpCallbackDelegate>
{
    WebServiceController *_webServiceController;
    //CDVInvokedUrlCommand *_command;
}
-(NSString*)getSchoolsOfUser;//(CDVInvokedUrlCommand*)command;
-(NSString*)getFirstGroupOfUser;
-(NSString*)getChildren;
-(NSString*)studentinfo:(NSString*)param;
-(NSString*)getFirstClassOfUser;

- (void)showProgressDialog:(NSString*)title :(NSString*)message;
- (void)closeProgressDialog;
- (NSString*)getUserId;
- (void)showDatePickerDialog:(NSString*)Id :(NSString*)date;
-(NSString*)getClassesOfUser;
-(NSString*)getGroupsOfUser;
-(NSString*)getStudentByGroup:(NSString*)group_id;
-(void)call:(NSString*)telNumber;
@end
