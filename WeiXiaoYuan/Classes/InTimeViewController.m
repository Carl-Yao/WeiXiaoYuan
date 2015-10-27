//
//  InTimeViewController.m
//  WeiXiaoYuan
//
//  Created by 姚振兴 on 14-10-10.
//
//

#import "InTimeViewController.h"
#import "JsInterface.h"
#import "SchoolSummary.h"
#import "User.h"
#import "FeedbackFromInTimeViewController.h"
#import "SBJson.h"
#import "DBImageView.h"
#import "MBProgressHUD.h"
@interface InTimeViewController ()
{
    UITableView *table;
}

@end

@implementation InTimeViewController
@synthesize messages;
@synthesize detailViewController;
@synthesize delegate;
@synthesize webServiceController;

//- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
//{
//    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
//    if (self) {
//        // Custom initialization
//    }
//    return self;
//}

- (void)viewDidLoad
{
    //[super __init:@"msg.html"];
    //[super __init:@"msg1.html"];
    //[super __init:@"model/SchoolSummary/school.html"];
    //[super __init:@"index.html"];
    //[super __init:@"model/SchoolSummary/teacher.html"];
    UIImage *image = [UIImage imageNamed:@"top_bj.9.jpg"];
    UIImageView *view = [[UIImageView alloc]initWithFrame:CGRectMake(-2, -2, self.view.frame.size.width+4, 64+2)];
    view.image = image;
    [self.view insertSubview:view atIndex:0];
    
    //UIImage *image1 = [UIImage imageNamed:@"logo.png"];
    UIImageView *view1 = [[UIImageView alloc]initWithFrame:CGRectMake(8, 22, 38, 38)];
    view1.image = ((AppDelegate *)[[UIApplication sharedApplication] delegate]).logoImg;
    [self.view insertSubview:view1 atIndex:1];
    
    UILabel *laber = [[UILabel alloc]initWithFrame:CGRectMake(78, 20, self.view.frame.size.width - 68 , 64)];
    
    laber.text = ((AppDelegate *)[[UIApplication sharedApplication] delegate]).schoolName;
    laber.textColor = [UIColor whiteColor];
    laber.font = [UIFont boldSystemFontOfSize:20];
    laber.lineBreakMode = UILineBreakModeCharacterWrap;
    laber.textAlignment = UITextAlignmentLeft;
    [self.view insertSubview:laber atIndex:1];
    
    [laber sizeToFit];
    laber.center = CGPointMake((self.view.frame.size.width - 68)/2+34,64/2+10);
    
    //下面内容的背景
//    UIImage *appButtonImagetitle = [UIImage imageNamed:@"chat_bg_default.jpg"];
//    UIImageView* bgImageView = [[UIImageView alloc] initWithFrame:CGRectMake(self.view.frame.origin.x, self.view.frame.origin.y+64-1, self.view.frame.size.width, self.view.frame.size.height - 64 - 49+1)];
//    [bgImageView setImage:appButtonImagetitle];
//    [self.view insertSubview:bgImageView atIndex:0];
    [self.view setBackgroundColor:[UIColor colorWithRed:235.0/255.0 green:235.0/255.0 blue:235.0/255.0 alpha:1.0]];
    
    //table view
    table = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height - 50-64) style:UITableViewStylePlain];
    table.delegate = self;
    table.dataSource = self;
    table.backgroundColor = [UIColor clearColor];
    [self.view insertSubview:table atIndex:1];
    
    _myAppDelegate=(AppDelegate *)[[UIApplication sharedApplication] delegate];

    self.messages = [[NSMutableArray alloc]init];
    
    self.messages = [_myAppDelegate query];
//    if (array.count >0) {
//        self.messages = array;
//        for (User* item in array){
//            NSDictionary* dictionary = [[NSDictionary alloc] initWithObjectsAndKeys:item.pushSender,PUSH_SENDER,item.pushDate,PUSH_DATE,item.pushContent,PUSH_CONTENT,item.pushTitle,PUSH_TITLE,item.pushImage,PUSH_IMAGE, item.pushID, PUSH_ID, item.pushType,PUSH_TYPE,nil];
//            
//            [self.messages addObject:dictionary];
//        }
//    }
//    else{
//        NSDictionary* dictionary = [[NSDictionary alloc] initWithObjectsAndKeys:@"陈米冲",PUSH_SENDER,@"2015-01-12 22:43:22",PUSH_DATE,@"开会",PUSH_CONTENT,@"开会",PUSH_TITLE,@"tx.png",PUSH_IMAGE, @"100112", PUSH_ID, @"通知公告",PUSH_TYPE,nil];
//        [_myAppDelegate addIntoDataSource:dictionary];
//        [self.messages addObject:dictionary];
//    }
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)viewWillAppear:(BOOL)animated
{
    MBProgressHUD* hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    hud.labelText = @"正在处理，请稍等...";
    NSLog(@"看耗时:viewWillAppear");
    [self.delegate setBadgeNumber:0 index:0];
    
    //加未读标示
    dispatch_async(dispatch_get_main_queue(), ^{
        
        NSLog(@"看耗时:delegate");
        [self recordlist];
        NSLog(@"看耗时:recordlist");
        [self updateMessages];
        NSLog(@"看耗时:updateMessages");
        [MBProgressHUD hideHUDForView:self.view animated:YES];
    });
}
- (void) updateMessages
{
    NSArray* lastestMessages = [_myAppDelegate query];
    bool hasNewMessage = false;
    //针对在设置页面点击清空消息的情况
    if (lastestMessages.count < self.messages.count)
    {
        self.messages = lastestMessages;
//        for(User* user in lastestMessages)
//        {
//            if (![self.messages containsObject:user]) {
//                [self.messages addObject:user];
//            }
//        }
        hasNewMessage = true;
        
    }else
    {
        NSMutableArray *addMessages = [[NSMutableArray alloc] init];
        for(User* user in lastestMessages)
        {
            if (![self.messages containsObject:user]) {
                [addMessages addObject:user];
                //[self.messages addObject:<#(id)#>]
                hasNewMessage = true;
            }
        }
        if (addMessages.count > 0) {
            [addMessages addObjectsFromArray:self.messages];
            self.messages = addMessages;
        }
    }
    if (hasNewMessage) {
        
        [table reloadData];
    }
    //test
//    NSDictionary* dictionary = [[NSDictionary alloc] initWithObjectsAndKeys:@"name",PUSH_SENDER,
//                                @"send_date",PUSH_DATE,
//                                @"msg",PUSH_CONTENT,
//                                @"title",PUSH_TITLE,
//                                @"pic_url",PUSH_IMAGE,
//                                @"sss", PUSH_ID,
//                                @"msg_type",PUSH_TYPE,
//                                @"send_user_minpic",USER_MINPIC,
//                                @"source_feedback_id",FEEDBACK_ID,nil];
//    
//    [_myAppDelegate addIntoDataSource:dictionary];
}

#pragma mark - Table View
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.messages count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
        cell.backgroundColor = [UIColor clearColor];
        cell.contentView.backgroundColor = [UIColor clearColor];
        UIImageView *separatorLine = (UIImageView *)[cell viewWithTag:4];
        separatorLine.hidden = YES;
        if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
        {
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            cell.selectionStyle = UITableViewCellStyleSubtitle;
        }
        else
        {
            cell.selectionStyle = UITableViewCellStyleSubtitle;
        }
        
        DBImageView *imageView = [[DBImageView alloc] initWithFrame:(CGRect){ 5, 5, 70, 55 }];
        [imageView setPlaceHolder:[UIImage imageNamed:@"Placeholder"]];
        [imageView setTag:101];
        [cell.contentView addSubview:imageView];
        
        UILabel* title = [[UILabel alloc] initWithFrame:(CGRect){85,2,cell.frame.size.width-80-40,22-2}];
        [title setTag:102];
        [title setFont:[UIFont boldSystemFontOfSize:16]];
        [cell.contentView addSubview:title];

        UILabel* content = [[UILabel alloc] initWithFrame:(CGRect){85,22,cell.frame.size.width-80-40,20}];
        [content setTag:103];
        content.textColor = [UIColor blueColor];
        [content setFont:[UIFont boldSystemFontOfSize:12]];
        [cell.contentView addSubview:content];
        
        UILabel* sender = [[UILabel alloc] initWithFrame:(CGRect){85,42,(cell.frame.size.width-80-40)/2,18}];
        [sender setTag:104];
        [sender setFont:[UIFont boldSystemFontOfSize:11]];
        [cell.contentView addSubview:sender];
        
        UILabel* date = [[UILabel alloc] initWithFrame:(CGRect){85+(cell.frame.size.width-80-40)/2,48,(cell.frame.size.width-60-40)/2,12}];
        [date setTag:105];
        date.textAlignment = NSTextAlignmentRight;
        [date setFont:[UIFont boldSystemFontOfSize:11]];
        [cell.contentView addSubview:date];
    }
    
    User *user = [self.messages objectAtIndex:indexPath.row];
    
    NSString *pushTitle = user.pushTitle;
    NSString *pushImage = [user.pushImage isEqualToString:@""]?@"tx.png":user.pushImage;
    NSString *pushSender = user.pushSender;
    NSString *pushDate = user.pushDate;
    NSString *pushContent = user.pushContent;
    
    //cell.textLabel.text = pushTitle;
    [(UILabel *)[cell viewWithTag:102] setText:pushTitle];

    //NSString *detail = [NSString stringWithFormat:@"%@   %@",pushSender, pushDate];
    //cell.detailTextLabel.text = detail;
    [(UILabel *)[cell viewWithTag:103] setText:pushContent];
    [(UILabel *)[cell viewWithTag:104] setText:pushSender];
    [(UILabel *)[cell viewWithTag:105] setText:pushDate];
    //[cell.imageView setImageWithURL:[NSURL URLWithString:artworkUrl60]
                 //  placeholderImage:[UIImage imageNamed:@"placeholder-icon"]];
    //用来占位
    //[cell.imageView setImage:[UIImage imageNamed:@"tx.png"]];
    //下载图片并缓存
    [(DBImageView *)[cell viewWithTag:101] setImageWithPath:pushImage];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    User *userMessage = [self.messages objectAtIndex:indexPath.row];
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
    {
       if ([@"fk" isEqualToString: userMessage.pushType]){
           FeedbackFromInTimeViewController *view = [FeedbackFromInTimeViewController alloc];
           view.arg = userMessage.feedbackID;
           [view init];
           [self presentModalViewController:view animated:YES];
       }else{
           self.detailViewController = [DetailForMessageViewController alloc];
        
           self.detailViewController.userMessages = userMessage;
           [self.detailViewController init];
            
           //[self.navigationController pushViewController:self.detailViewController animated:YES];
           [self presentModalViewController:detailViewController animated:YES];
       }
    }
    else
    {
        self.detailViewController.userMessages = userMessage;
    }
}

-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    [_myAppDelegate del:((User*)(self.messages[indexPath.row])).pushID];
    [self.messages removeObjectAtIndex:indexPath.row];
    [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 65;
}

-(NSString*)recordlist
{
    if (!webServiceController)
    {
        webServiceController = [WebServiceController shareController:nil];
    }

    NSString* result = [webServiceController xxrecordlist];
    //NSDictionary* di = [NSDictionarydictionaryWithJSONString:result];
    SBJsonParser *parser = [[SBJsonParser alloc] init];
    NSError *error = nil;
    NSDictionary *rootDic = [parser objectWithString:result error:&error];
    for (NSDictionary *info in rootDic) {
        [webServiceController updatexxrecord: info[@"RECORD_ID"]];

        if ([[info objectForKey:@"PIC_URL"] firstObject]) {
            NSDictionary* dictionary = [[NSDictionary alloc] initWithObjectsAndKeys:[info objectForKey:@"NAME"],PUSH_SENDER,
                                        [info objectForKey:@"SEND_DATE"],PUSH_DATE,
                                        [info objectForKey:@"TITLE"],PUSH_TITLE,
                                        [info objectForKey:@"PIC_URL"][0][@"picture_info"],PUSH_IMAGE,
                                        [info objectForKey:@"RECORD_ID"], PUSH_ID,
                                        [info objectForKey:@"MSG_TYPE"],PUSH_TYPE,
                                        //[info objectForKey:@"READ_FLAG"],PUSH_READ,
                                        [info objectForKey:@"DESCRIPTION"],PUSH_CONTENT,
                                        //[info objectForKey:@"DESCRIPTION"],USER_ID,
                                        [info objectForKey:@"SEND_USER_MINPIC"],USER_MINPIC,
                                        [info objectForKey:@"SOURCE_FEEDBACK_ID"],FEEDBACK_ID,nil];
            
            [_myAppDelegate addIntoDataSource:dictionary];
        }else{
            
            NSDictionary* dictionary = [[NSDictionary alloc] initWithObjectsAndKeys:[info objectForKey:@"NAME"],PUSH_SENDER,
                                        [info objectForKey:@"SEND_DATE"],PUSH_DATE,
                                        [info objectForKey:@"TITLE"],PUSH_TITLE,
                                        @"",PUSH_IMAGE,
                                        [info objectForKey:@"RECORD_ID"], PUSH_ID,
                                        [info objectForKey:@"MSG_TYPE"],PUSH_TYPE,
                                        //[info objectForKey:@"READ_FLAG"],PUSH_READ,
                                        [info objectForKey:@"DESCRIPTION"],PUSH_CONTENT,
                                        //[info objectForKey:@"DESCRIPTION"],USER_ID,
                                        [info objectForKey:@"SEND_USER_MINPIC"],USER_MINPIC,
                                        [info objectForKey:@"SOURCE_FEEDBACK_ID"],FEEDBACK_ID,nil];
            
            [_myAppDelegate addIntoDataSource:dictionary];
        }
        //[self.messages addObject:dictionary];
    }
    return @"";
}

@end

