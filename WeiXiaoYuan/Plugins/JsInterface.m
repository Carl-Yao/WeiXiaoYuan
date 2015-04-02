//
//  JsInterface.m
//  WeiXiaoYuan
//
//  Created by 姚振兴 on 14/11/22.
//
//

#import "JsInterface.h"

@implementation JsInterface
//@synthesize callbackID;
-(NSString*)getSchoolsOfUser
{
    //_command = command;
    _webServiceController = [WebServiceController shareController:nil];
    //[_webServiceController SetDalegate:self];
    return [_webServiceController SchoolsOfUser];
    
}           
-(NSString*)getFirstGroupOfUser
{
    _webServiceController = [WebServiceController shareController:nil];
    //[_webServiceController SetDalegate:self];
    return [_webServiceController getFirstGroupOfUser];
}
-(NSString*)getChildren
{
    _webServiceController = [WebServiceController shareController:nil];
    
    {
        NSString* result = [_webServiceController getChildren];
        return result;
    }
    return @"";
}
-(NSString*)studentinfo:(NSString*)param
{
    _webServiceController = [WebServiceController shareController:nil];
    NSString* result = [_webServiceController studentinfo:param];

    return result;
}

-(NSString*)getFirstClassOfUser
{
    _webServiceController = [WebServiceController shareController:nil];
    
    NSString* result = [_webServiceController getFirstClassOfUser];
    return result;
}

- (void)showProgressDialog:(NSString*)title :(NSString*)message
{
    //not do
}
- (void)closeProgressDialog
{
    //not do
}
- (NSString*)getUserId
{
    _webServiceController = [WebServiceController shareController:nil];
    
    NSString* result = [_webServiceController getUserId];
    return result;
}
- (void)showDatePickerDialog:(NSString*)Id :(NSString*)date
{
    //not do
    //UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:@"sss" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
    //[alert show];
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Hello" message:@"message" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"OK", nil];
    
    // Create date picker (could / should be an ivar)
    UIDatePicker *picker = [[UIDatePicker alloc] initWithFrame:CGRectMake(10, alert.bounds.size.height, 320, 216)];
    // Add picker to alert
    [alert addSubview:picker];
    // Adjust the alerts bounds
    alert.bounds = CGRectMake(0, 0, 320 + 20, alert.bounds.size.height + 216 + 20);
    // Show alert (required for sizes to be available)
    [alert show];
}
-(NSString*)getClassesOfUser
{
    _webServiceController = [WebServiceController shareController:nil];
    
    NSString* result = [_webServiceController getClassesOfUser];
    return result;
}
-(NSString*)getGroupsOfUser
{
    _webServiceController = [WebServiceController shareController:nil];
    
    NSString* result = [_webServiceController getGroupsOfUser];
    return result;
}
-(NSString*)getStudentByGroup:(NSString*)group_id
{
    _webServiceController = [WebServiceController shareController:nil];
    
    NSString* result = [_webServiceController getStudentByGroup:group_id];
    return result;
}
-(void)call:(NSString*)telNumber
{
    if (telNumber != nil) {
        
        NSString *telUrl = [NSString stringWithFormat:@"telprompt:%@",telNumber];
        
        NSURL *url = [[NSURL alloc] initWithString:telUrl];
        
        [[UIApplication sharedApplication] openURL:url];
        
    }

}

@end
