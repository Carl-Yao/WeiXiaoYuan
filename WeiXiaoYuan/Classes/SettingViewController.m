//
//  SettingViewController.m
//  WeiXiaoYuan
//
//  Created by 姚振兴 on 14-10-10.
//
//

#import "SettingViewController.h"
#import "PersonViewController.h"
#import "DBImageView.h"
#import "AppDelegate.h"
@interface SettingViewController ()

@end

@implementation SettingViewController
@synthesize delegate;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    UIStoryboard *board = [UIStoryboard storyboardWithName: @"Storyboard" bundle: nil];
    if (self) {
    self = [board instantiateViewControllerWithIdentifier: @"Setting"];
    //self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    UIImageView* allBg = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height-50)];
    [allBg setImage:[UIImage imageNamed:@"新版APP_02"]];
    [self.view insertSubview:allBg atIndex:0];
    UIImage *image = [UIImage imageNamed:@"top_bj.91.png"];
    UIImageView *view = [[UIImageView alloc]initWithFrame:CGRectMake(-2, -2, self.view.frame.size.width+4, 64+2)];
    view.image = image;
    [self.view addSubview:view];
    
    //UIImage *image1 = [UIImage imageNamed:@"logo.png"];
    UIImageView *view1 = [[UIImageView alloc]initWithFrame:CGRectMake(8, 22, 38, 38)];
    view1.image = ((AppDelegate *)[[UIApplication sharedApplication] delegate]).logoImg;
    [self.view addSubview:view1];
    
    UILabel *laber = [[UILabel alloc]initWithFrame:CGRectMake(78, 20, self.view.frame.size.width - 68 , 64)];
    
    laber.text = ((AppDelegate *)[[UIApplication sharedApplication] delegate]).schoolName;
    laber.textColor = [UIColor blackColor];
    laber.font = [UIFont boldSystemFontOfSize:20];
    laber.lineBreakMode = UILineBreakModeCharacterWrap;
    laber.textAlignment = UITextAlignmentLeft;
    [self.view addSubview:laber];
    
    [laber sizeToFit];
    laber.center = CGPointMake((self.view.frame.size.width - 68)/2+34,64/2+10);
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(10, 380, self.view.frame.size.width-20, 40)];
    [button setTitle:@"退出登录" forState:UIControlStateNormal];//设置button的title
    button.titleLabel.font = [UIFont systemFontOfSize:16];//title字体大小
    button.titleLabel.textAlignment = NSTextAlignmentCenter;//设置title的字体居中
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];//设置title在一般情况下为白色字体
    [button setBackgroundColor:[UIColor redColor]];
    [button addTarget:self action:@selector(btnClicked:event:) forControlEvents:UIControlEventTouchUpInside];

    [self.view addSubview:button];
    self.tasks = @[@[@"个人信息",@"修改密码",@"清除缓存"],@[@"清空消息记录"]];
    [super viewDidLoad];
	//@ Do any additional setup after loading the view.
}

- (void)btnClicked:(id)sender event:(id)event
{
    //[self performSegueWithIdentifier:@"LoginToMain" sender:self];
    UIAlertView* alert = [[UIAlertView alloc]initWithTitle:@"退出登录" message:@"确定要退出登录吗？" delegate:self cancelButtonTitle:@"退出" otherButtonTitles:@"取消", nil];
    alert.tag = 1001;
    [alert show];

    
}
- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex {
    if (buttonIndex == 0) {
        if (alertView.tag == 1001) {
            [self dismissModalViewControllerAnimated:YES];
        }else if(alertView.tag == 1002)
        {
            [self clearCache];
            UIAlertView* alert = [[UIAlertView alloc]initWithTitle:nil message:@"清除成功" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil];
            [alert show];
        }else if(alertView.tag == 1003)
        {
            [self clearCache];
            [(AppDelegate *)[[UIApplication sharedApplication] delegate] del:@"ClearAll"];
            UIAlertView* alert = [[UIAlertView alloc]initWithTitle:nil message:@"清空成功" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil];
            [alert show];
        }
        alertView.tag = 0;
    }
}

- (void) clearCache
{
    [DBImageView clearCache];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [self.tasks count];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0)
    {
    return [self.tasks[0] count];
    }else{
        return [self.tasks[1] count];
    }
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *SimpleTableIdentifier = @"SimpleTableIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:SimpleTableIdentifier];
    if (cell == nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:SimpleTableIdentifier];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    if (indexPath.section == 0)
    {
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.textLabel.text = self.tasks[0][indexPath.row];
    }else{
        cell.textLabel.text = self.tasks[1][indexPath.row];
    }
    
    return cell;
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    //该方法响应列表中行的点击事件
    NSString *selected=[self.tasks[indexPath.section] objectAtIndex:indexPath.row];
    if ([selected isEqualToString:@"修改密码"]) {
        [self performSegueWithIdentifier:@"MainToChangePassword" sender:self];
    }else if ([selected isEqualToString:@"清除缓存"]) {
        UIAlertView *myAlertView;
        myAlertView = [[UIAlertView alloc]initWithTitle:@"询问" message:@"是否清除缓存？" delegate:self cancelButtonTitle:@"清除" otherButtonTitles:@"取消",nil];
        myAlertView.tag = 1002;
        [myAlertView show];
    }else if ([selected isEqualToString:@"清空消息记录"]) {
        UIAlertView *myAlertView;
        myAlertView = [[UIAlertView alloc]initWithTitle:@"询问" message:@"是否清空消息记录？" delegate:self cancelButtonTitle:@"清空" otherButtonTitles:@"取消",nil];
        myAlertView.tag = 1003;
        [myAlertView show];
    }else if ([selected isEqualToString:@"个人信息"]) {
        PersonViewController* personView = [[PersonViewController alloc]init];
        [self presentViewController:personView animated:YES completion:nil];
    }

    //indexPath.row得到选中的行号，提取出在数组中的内容。
//    UIAlertView *myAlertView;
//    myAlertView = [[UIAlertView alloc]initWithTitle:@"dota群英传" message:heroSelected delegate:self cancelButtonTitle:@"ok" otherButtonTitles:nil];
//    [myAlertView show];
    //点击后弹出该对话框。
}

#pragma mark -

- (id)initWithStyle:(UITableViewStyle)style

{
    
    //self = [self->tableView initWithStyle:style];
    
    if (self) {
        
        // Custom initialization
        
    }
    
    return self;
    
}

#pragma mark - Table view data source
- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath

{
    
    if ([cell respondsToSelector:@selector(tintColor)]) {
        
        if (tableView == self->tableView) {
            
            CGFloat cornerRadius = 0.f;//圆角
            
            cell.backgroundColor = UIColor.clearColor;
            
            CAShapeLayer *layer = [[CAShapeLayer alloc] init];
            
            CGMutablePathRef pathRef = CGPathCreateMutable();
            
            CGRect bounds = CGRectInset(cell.bounds, 0, 0);//边距
            
            BOOL addLine = NO;
            
            if (indexPath.row == 0 && indexPath.row == [tableView numberOfRowsInSection:indexPath.section]-1) {
                
                CGPathAddRoundedRect(pathRef, nil, bounds, cornerRadius, cornerRadius);
                
            } else if (indexPath.row == 0) {
                
                CGPathMoveToPoint(pathRef, nil, CGRectGetMinX(bounds), CGRectGetMaxY(bounds));
                
                CGPathAddArcToPoint(pathRef, nil, CGRectGetMinX(bounds), CGRectGetMinY(bounds), CGRectGetMidX(bounds), CGRectGetMinY(bounds), cornerRadius);
                
                CGPathAddArcToPoint(pathRef, nil, CGRectGetMaxX(bounds), CGRectGetMinY(bounds), CGRectGetMaxX(bounds), CGRectGetMidY(bounds), cornerRadius);
                
                CGPathAddLineToPoint(pathRef, nil, CGRectGetMaxX(bounds), CGRectGetMaxY(bounds));
                
                addLine = YES;
                
            } else if (indexPath.row == [tableView numberOfRowsInSection:indexPath.section]-1) {
                
                CGPathMoveToPoint(pathRef, nil, CGRectGetMinX(bounds), CGRectGetMinY(bounds));
                
                CGPathAddArcToPoint(pathRef, nil, CGRectGetMinX(bounds), CGRectGetMaxY(bounds), CGRectGetMidX(bounds), CGRectGetMaxY(bounds), cornerRadius);
                
                CGPathAddArcToPoint(pathRef, nil, CGRectGetMaxX(bounds), CGRectGetMaxY(bounds), CGRectGetMaxX(bounds), CGRectGetMidY(bounds), cornerRadius);
                
                CGPathAddLineToPoint(pathRef, nil, CGRectGetMaxX(bounds), CGRectGetMinY(bounds));
                
            } else {
                
                CGPathAddRect(pathRef, nil, bounds);
                
                addLine = YES;
                
            }
            
            layer.path = pathRef;
            
            CFRelease(pathRef);
            
            layer.fillColor = [UIColor colorWithWhite:1.f alpha:0.8f].CGColor;
            
            
            
            if (addLine == YES) {
                
                CALayer *lineLayer = [[CALayer alloc] init];
                
                CGFloat lineHeight = (1.f / [UIScreen mainScreen].scale);
                
                lineLayer.frame = CGRectMake(CGRectGetMinX(bounds), bounds.size.height-lineHeight, bounds.size.width, lineHeight);
                
                lineLayer.backgroundColor = tableView.separatorColor.CGColor;
                
                [layer addSublayer:lineLayer];
                
            }
            
            UIView *testView = [[UIView alloc] initWithFrame:bounds];
            
            [testView.layer insertSublayer:layer atIndex:0];
            
            testView.backgroundColor = UIColor.clearColor;
            
            cell.backgroundView = testView;
            
        }
        
    }
    
}

#pragma 拍照

@end
