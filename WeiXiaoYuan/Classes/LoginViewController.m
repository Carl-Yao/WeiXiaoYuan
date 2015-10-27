//
//  LoginViewController.m
//  WeiXiaoYuan
//
//  Created by 姚振兴 on 14-10-9.
//
//

#import "LoginViewController.h"
#import "UIKit/UIKit.h"
#import "KeychainItemWrapper.h"
#import "UserManager.h"
#import "SFHFKeychainUtils.h"
#import "BPush.h"
#import "AppDelegate.h"
#import "MALTabBarViewController.h"
#import "SBJson.h"
#define SERVICE_NAME @"WeiXiaoYuan"
#define USERNAMEKEY @"UserNameKey"

@interface LoginViewController ()

@end

@implementation LoginViewController
@synthesize tabberViewController;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    UIImage *image = [UIImage imageNamed:@"loginbg.png"];
    UIImageView *view = [[UIImageView alloc] initWithImage:image];
    view.frame = self.view.frame;
    [self.view insertSubview:view atIndex:0];
    _webServiceController = [WebServiceController shareController:self.view];
    [_webServiceController SetDalegate:self];
    
    //wrapper = [[KeychainItemWrapper alloc] initWithIdentifier:@"WXYLogin" accessGroup:nil];
    //NSString *userName = [wrapper objectForKey: (__bridge id)kSecAttrAccount];
 
    userDefaultes = [NSUserDefaults standardUserDefaults];
    //读取NSString类型的数据
    NSString *myString = [userDefaultes stringForKey:USERNAMEKEY];
    self.nameField.text = myString;
    
    NSString *passWord =  [SFHFKeychainUtils getPasswordForUsername:myString andServiceName:SERVICE_NAME error:nil];

    self.numberField.text = passWord;
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)loginButtonPressed:(id)sender {
    [self.numberField resignFirstResponder];
    [self.nameField resignFirstResponder];
    //[_webServiceController GetServerAddr:@"xiaos" :@"13246857"];
    [_webServiceController GetServerAddr:[self.nameField.text lowercaseString] :[self.numberField.text lowercaseString]];
}
- (IBAction)cancelButtonPressed: (id)sender
{
     exit(0);
}
- (IBAction)textFieldDoneEditing:(id)sender
{
    [self.numberField resignFirstResponder];
    [self.nameField resignFirstResponder];
}
- (IBAction)backgroundTap:(id)sender
{
    [self.numberField resignFirstResponder];
    [self.nameField resignFirstResponder];
}
-(void)HttpSuccessDictionaryCallBack:(NSDictionary *)result
{
    NSString* res = [_webServiceController getLogoAndSchoolName];
    
    SBJsonParser *parser = [[SBJsonParser alloc] init];
    NSError *error = nil;
    NSArray *rootDic = [parser objectWithString:res error:&error];
    if (rootDic[0] != nil) {
        NSDictionary *dic = rootDic[0];
        if (dic[@"SHORT_NAME"] != nil) {
            ((AppDelegate *)[[UIApplication sharedApplication] delegate]).schoolName = dic[@"SHORT_NAME"];
        }
        if (dic[@"LOGO_URL"] != nil) {
            ((AppDelegate *)[[UIApplication sharedApplication] delegate]).logoImg = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:dic[@"LOGO_URL"]]]];
        }
    }
    
    [BPush bindChannel];
    
    [userDefaultes setObject:self.nameField.text forKey:USERNAMEKEY];
    [SFHFKeychainUtils storeUsername:self.nameField.text andPassword:self.numberField.text forServiceName:SERVICE_NAME updateExisting:1 error:nil];
    
    if ([(NSString*)result[@"roletype"] isEqualToString:@"parent"])
    {
        [UserManager shareController].UserType = PARENT;
    }
    else if ([(NSString*)result[@"roletype"] isEqualToString:@"yey_teacher"])
    {
        [UserManager shareController].UserType = YEYTEACHER;
    }else if ([(NSString*)result[@"roletype"] isEqualToString:@"zxx_teacher"])
    {
        [UserManager shareController].UserType = ZXXTEACHER;
    }
    else if ([(NSString*)result[@"roletype"] isEqualToString:@"yey_president"])
    {
        [UserManager shareController].UserType = YEYPRESIDENT;
    }
    else if ([(NSString*)result[@"roletype"] isEqualToString:@"zxx_president"])
    {
        [UserManager shareController].UserType = ZXXPRESIDENT;
    }
    else
    {
        [UserManager shareController].UserType = MANAGEMENT;
    }
    [UserManager shareController].modelArr = (NSMutableArray*)result[@"func"];
    // }
    //自定义tabbarviewcontroller
    // Override point for customization after application launch.
    NSMutableArray *itemsArray = [[NSMutableArray alloc] init];
    NSArray *controllerArray = [NSArray arrayWithObjects:@"InTimeViewController",@"FunctionViewController",@"SettingViewController" ,nil];//类名数组
    NSArray *titleArray = [NSArray arrayWithObjects:@"及时",@"功能",@"设置", nil];//item标题数组
    NSArray *normalImageArray = [NSArray arrayWithObjects:@"icon_meassage_nor.png",@"icon_square_nor.png",@"icon_selfinfo_nor.png", nil];//item 正常状态下的背景图片
    NSArray *selectedImageArray = [NSArray arrayWithObjects:@"icon_meassage_sel.png",@"icon_square_sel.png",@"icon_selfinfo_sel.png",nil];//item被选中时的图片名称
    
    for (int i = 0; i< controllerArray.count; i++) {
        
        MALTabBarItemModel *itemModel = [[MALTabBarItemModel alloc] init];
        itemModel.controllerName = controllerArray[i];
        itemModel.itemTitle = titleArray[i];
        itemModel.itemImageName = normalImageArray[i];
        itemModel.selectedItemImageName = selectedImageArray[i];
        [itemsArray addObject:itemModel];
    }
    
    
    tabberViewController = [[MALTabBarViewController alloc] initWithItemModels:itemsArray defaultSelectedIndex:1];
    
    //[tabberViewController setTabBarBgImage:@"bg_titleyzx.png"];

    //UIStoryboard *board = [UIStoryboard storyboardWithName: @"Storyboard" bundle: nil];
    //tabberViewController = [board instantiateViewControllerWithIdentifier: @"Main"];
    //[self performSegueWithIdentifier:@"LoginToMain" sender:self];
    [self presentViewController:tabberViewController animated:YES completion:nil];
}
-(void)HttpFailCallBack:(NSString *)errorMessage
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:errorMessage delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
    [alert show];
    //[self performSegueWithIdentifier:@"LoginToMain" sender:self];
}
@end
