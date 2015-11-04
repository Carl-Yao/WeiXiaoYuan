//
//  FunctionBaseViewController.m
//  WeiXiaoYuan
//
//  Created by 姚振兴 on 14/12/13.
//  Copyright (c) 2014年 Dukeland. All rights reserved.
//

#import "FunctionBaseViewController.h"
#import "DKScrollingTabController.h"
#import "BackButton.h"
#import "IQActionSheetPickerView.h"
//#import "FileManagement.h"
#define ORIGINAL_MAX_WIDTH 640.0f
@interface FunctionBaseViewController ()

@end

@implementation FunctionBaseViewController
@synthesize easyViewControllers;
@synthesize titles;
@synthesize htmlNames;
@synthesize spaceSizes;
@synthesize htmlDirectorys;
@synthesize functionTitle;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
        [self InitFunctionView];
        
        self.title = @"";
        
        self.view.backgroundColor = [UIColor lightGrayColor];
        
        //换新的顶部背景
        UIImage *image = [UIImage imageNamed:@"top_bj.91.png"];
        UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(-2, -2, 320+2, 48+20+2)];
        imageView.image = image;
        [self.view insertSubview:imageView atIndex:0];
        
        BackButton *returnButton = [[BackButton alloc] initWithFrame:CGRectMake(-2+10, -2+20 + 6, 150, 48-20)];
        [returnButton setTitle:functionTitle forState:UIControlStateNormal];
        //换返回按钮图标和文字
        UIImage *image1 = [UIImage imageNamed:@"biz_pics_main_back_normal.png"];
        [returnButton setImage:image1 forState:UIControlStateNormal];
        [returnButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [self.view insertSubview:returnButton atIndex:1];
        returnButton.titleLabel.textColor = [UIColor blackColor];
        [returnButton addTarget:self action:@selector(btnClicked:event:) forControlEvents:UIControlEventTouchUpInside];
        
        //返回图标
//        UIImage *image4 = [UIImage imageNamed:@"biz_widget_left.9.png"];
//        UIImageView *imageView4 = [[UIImageView alloc]initWithFrame:CGRectMake(-2, -2+20+6, 20+2, 48-20)];
//        imageView4.image = image4;
//        [self.view insertSubview:imageView4 atIndex:1];
        
        //tab栏背景图标
        UIImage *image2 = [UIImage imageNamed:@"tab.png"];
        UIImageView *imageView2 = [[UIImageView alloc]initWithFrame:CGRectMake(-2, 48+20, 320+2, 48+2-2)];
        imageView2.image = image2;
        [self.view insertSubview:imageView2 atIndex:0];
    }
    return self;
}

-(void)actionSheetPickerView:(IQActionSheetPickerView *)pickerView didSelectTitles:(NSArray *)titles
{
    if (pickerView.tag == 6)
    {
        NSDateFormatter* dateFormat = [[NSDateFormatter alloc] init];
        [dateFormat setDateFormat:@"yyyy-MM-dd"];
        NSString *dateString = [dateFormat stringFromDate:pickerView.date];
        if ([divName isEqualToString: @"search_date"])
        {
            NSString *jsResult = [easyViewControllers[selectIndex] stringByEvaluatingJavaScriptFromString:[NSString stringWithFormat:@"setDateInputValue(\'%@\',\'%@\')",divName,dateString]];
        }else{
            NSString *jsCode = [NSString stringWithFormat:@"document.getElementById(\"%@\").innerText = \"%@\";",divName,dateString];
            NSString *jsResult = [easyViewControllers[selectIndex] stringByEvaluatingJavaScriptFromString:jsCode];
        }
    }
}


-(void) onDateNotify:(NSNotification*) notification
{
    NSArray* searchArrary = [notification object];//通过这个获取到传递的对象
    divName = searchArrary[0];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];

    IQActionSheetPickerView *picker = [[IQActionSheetPickerView alloc] initWithTitle:@"Date Picker" delegate:self];
    picker.date = [dateFormatter dateFromString:searchArrary[1]];

    [picker setTag:6];
    [picker setActionSheetPickerStyle:IQActionSheetPickerStyleDatePicker];
    [picker show];
}
-(void) onCloseNotify:(NSNotification*) notification
{
    [self dismissModalViewControllerAnimated:YES];
}

- (void)viewWillAppear:(BOOL)animated
{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(onDateNotify:)   name:@"HtmlDateNotification" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(onCloseNotify:)   name:@"HtmlCloseNotification" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(editPortrait:)   name:@"HtmlPhotoNotification" object:nil];
}
- (void)viewWillDisappear:(BOOL)animated;
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)InitFunctionView
{    
    DKScrollingTabController *leftTabController = [[DKScrollingTabController alloc] init];
    leftTabController.delegate = self;
    [self addChildViewController:leftTabController];
    [leftTabController didMoveToParentViewController:self];
    [self.view addSubview:leftTabController.view];
    leftTabController.view.frame = CGRectMake(0, 48+20, 320, 48);
    
    leftTabController.view.backgroundColor = [UIColor clearColor];
    leftTabController.buttonPadding = 10;
    leftTabController.underlineIndicator = YES;
    leftTabController.underlineIndicatorColor = [UIColor blueColor];
    leftTabController.buttonsScrollView.showsHorizontalScrollIndicator = NO;
    leftTabController.selectedBackgroundColor = [UIColor clearColor];
    leftTabController.selectedTextColor = [UIColor redColor];
    leftTabController.unselectedTextColor = [UIColor blackColor];
    leftTabController.unselectedBackgroundColor = [UIColor clearColor];
    leftTabController.buttonInset = 12;
    leftTabController.SelectionFont = [UIFont systemFontOfSize:16];
    leftTabController.selection = spaceSizes;
    int i = 0;
    for (id object in titles) {
        [leftTabController setButtonName:object atIndex:i++];
    }
    
    [leftTabController.buttons enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        UIButton *button = obj;
        button.titleLabel.numberOfLines = 1;
        button.titleLabel.textAlignment = NSTextAlignmentCenter;
    }];
    
    easyViewControllers = [[NSMutableArray alloc]init];
    for (NSString* object in titles) {
        EasyJSWebView* webView = [[EasyJSWebView alloc]initWithFrame:CGRectMake(self.view.frame.origin.x, self.view.frame.origin.y+96+20, self.view.frame.size.width, self.view.frame.size.height - 96-20)];
        [easyViewControllers addObject:webView];
    }
    
    for (EasyJSWebView* view in easyViewControllers)
    {
        [self AddEasyJS:view];
    }
    
    if (easyViewControllers.count > 0) {
        selectIndex = 0;
        [easyViewControllers[0] loadRequest:[NSURLRequest requestWithURL:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:htmlNames[0] ofType:nil inDirectory:htmlDirectorys[0]]]]];
        ((EasyJSWebView*)easyViewControllers[0]).isRequestedForEasy = true;

        [self.view addSubview:easyViewControllers[0]];
    }
}
- (void)AddEasyJS:(EasyJSWebView*)view
{
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)btnClicked:(id)sender event:(id)event
{
    if ([[(BackButton*)sender titleLabel].text isEqualToString:@"返回"])
    {
        [(BackButton*)sender setTitle:functionTitle forState:UIControlStateNormal];
 
        ((EasyJSWebView*)easyViewControllers[selectIndex]).frame = CGRectMake(self.view.frame.origin.x, self.view.frame.origin.y+96+20, self.view.frame.size.width, self.view.frame.size.height - 96-20);
        
        if (((EasyJSWebView*)easyViewControllers[selectIndex]).canGoBack == YES)
                    [easyViewControllers[selectIndex] goBack];
    }else{
        [self dismissModalViewControllerAnimated:YES];
    }
}

#pragma mark - TabControllerDelegate

- (void)DKScrollingTabController:(DKScrollingTabController *)controller selection:(NSUInteger)selection {
    NSLog(@"Selection controller action button with index=%d",selection);
    selectIndex = selection;

    if (![easyViewControllers[selectIndex] isRequestedForEasy]) {
        [easyViewControllers[selectIndex] loadRequest:[NSURLRequest requestWithURL:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:htmlNames[selectIndex] ofType:nil inDirectory:htmlDirectorys[selectIndex]]]]];
        ((EasyJSWebView*)easyViewControllers[selectIndex]).isRequestedForEasy = true;
    }
    for (EasyJSWebView* view in easyViewControllers)
    {
        [view removeFromSuperview];
    }
    [self.view addSubview:easyViewControllers[selectIndex]];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


- (void)editPortrait:(NSNotification*) notification {
    UIActionSheet *choiceSheet = [[UIActionSheet alloc] initWithTitle:nil
                                                             delegate:self
                                                    cancelButtonTitle:@"取消"
                                               destructiveButtonTitle:nil
                                                    otherButtonTitles:@"拍照", @"从相册中选取", nil];
    [choiceSheet showInView:self.view];
}

#pragma mark VPImageCropperDelegate
- (void)imageCropper:(VPImageCropperViewController *)cropperViewController didFinished:(UIImage *)editedImage {
    self.portraitImageView.image = editedImage;
    [cropperViewController dismissViewControllerAnimated:YES completion:^{
        // TO DO
    }];
}

- (void)imageCropperDidCancel:(VPImageCropperViewController *)cropperViewController {
    [cropperViewController dismissViewControllerAnimated:YES completion:^{
    }];
}

#pragma mark UIActionSheetDelegate
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    if (buttonIndex == 0) {
        // 拍照
        if ([self isCameraAvailable] && [self doesCameraSupportTakingPhotos]) {
            UIImagePickerController *controller = [[UIImagePickerController alloc] init];
            controller.sourceType = UIImagePickerControllerSourceTypeCamera;
            if ([self isFrontCameraAvailable]) {
                controller.cameraDevice = UIImagePickerControllerCameraDeviceRear;
            }
            
            NSMutableArray *mediaTypes = [[NSMutableArray alloc] init];
            [mediaTypes addObject:(__bridge NSString *)kUTTypeImage];
            controller.mediaTypes = mediaTypes;
            controller.delegate = self;
            [self presentViewController:controller
                               animated:YES
                             completion:^(void){
                                 NSLog(@"Picker View Controller is presented");
                             }];
        }
        
    } else if (buttonIndex == 1) {
        // 从相册中选取
        if ([self isPhotoLibraryAvailable]) {
            UIImagePickerController *controller = [[UIImagePickerController alloc] init];
            controller.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
            NSMutableArray *mediaTypes = [[NSMutableArray alloc] init];
            [mediaTypes addObject:(__bridge NSString *)kUTTypeImage];
            controller.mediaTypes = mediaTypes;
            controller.delegate = self;
            [self presentViewController:controller
                               animated:YES
                             completion:^(void){
                                 NSLog(@"Picker View Controller is presented");
                             }];
        }
    }
}

#pragma mark - UIImagePickerControllerDelegate
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    [picker dismissViewControllerAnimated:YES completion:^() {
        UIImage *portraitImg = [info objectForKey:@"UIImagePickerControllerOriginalImage"];
        portraitImg = [self imageByScalingToMaxSize:portraitImg];
        
        //保存
        NSData *data = UIImageJPEGRepresentation([self scaleToSize:portraitImg], 1.0);
        NSString *docDir = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
        NSString *pngFilePath = [NSString stringWithFormat:@"%@/test.jpg",docDir];
        bool c = [data writeToFile:pngFilePath atomically:YES];
        //[[NSURLCachesharedURLCache] removeAllCachedResponses];
        
        NSString *jsResult = [easyViewControllers[selectIndex] stringByEvaluatingJavaScriptFromString:[NSString stringWithFormat: @"setPhoto(\"true\",\"%@?t=%@\")",pngFilePath,[self GetRandomString]]];
        
        // 裁剪----头像用，此处不裁剪了
        //VPImageCropperViewController *imgEditorVC = [[VPImageCropperViewController alloc] initWithImage:portraitImg cropFrame:CGRectMake(0, 100.0f, self.view.frame.size.width, self.view.frame.size.width) limitScaleRatio:3.0];
        //imgEditorVC.delegate = self;
        //[self presentViewController:imgEditorVC animated:YES completion:^{
            // TO DO
        //}];
    }];
}
-(NSString*)GetRandomString
{
    int NUMBER_OF_CHARS = 10;
    char data[NUMBER_OF_CHARS];
    for (int x=0;x<NUMBER_OF_CHARS;data[x++] = (char)('A' + (arc4random_uniform(26))));
    return [[NSString alloc] initWithBytes:data length:NUMBER_OF_CHARS encoding:NSUTF8StringEncoding];
}
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    [picker dismissViewControllerAnimated:YES completion:^(){
    }];
}

#pragma mark - UINavigationControllerDelegate
- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated {
}

- (void)navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animated {
    
}

#pragma mark camera utility
- (BOOL) isCameraAvailable{
    return [UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera];
}

- (BOOL) isRearCameraAvailable{
    return [UIImagePickerController isCameraDeviceAvailable:UIImagePickerControllerCameraDeviceRear];
}

- (BOOL) isFrontCameraAvailable {
    return [UIImagePickerController isCameraDeviceAvailable:UIImagePickerControllerCameraDeviceFront];
}

- (BOOL) doesCameraSupportTakingPhotos {
    return [self cameraSupportsMedia:(__bridge NSString *)kUTTypeImage sourceType:UIImagePickerControllerSourceTypeCamera];
}

- (BOOL) isPhotoLibraryAvailable{
    return [UIImagePickerController isSourceTypeAvailable:
            UIImagePickerControllerSourceTypePhotoLibrary];
}
- (BOOL) canUserPickVideosFromPhotoLibrary{
    return [self
            cameraSupportsMedia:(__bridge NSString *)kUTTypeMovie sourceType:UIImagePickerControllerSourceTypePhotoLibrary];
}
- (BOOL) canUserPickPhotosFromPhotoLibrary{
    return [self
            cameraSupportsMedia:(__bridge NSString *)kUTTypeImage sourceType:UIImagePickerControllerSourceTypePhotoLibrary];
}

- (BOOL) cameraSupportsMedia:(NSString *)paramMediaType sourceType:(UIImagePickerControllerSourceType)paramSourceType{
    __block BOOL result = NO;
    if ([paramMediaType length] == 0) {
        return NO;
    }
    NSArray *availableMediaTypes = [UIImagePickerController availableMediaTypesForSourceType:paramSourceType];
    [availableMediaTypes enumerateObjectsUsingBlock: ^(id obj, NSUInteger idx, BOOL *stop) {
        NSString *mediaType = (NSString *)obj;
        if ([mediaType isEqualToString:paramMediaType]){
            result = YES;
            *stop= YES;
        }
    }];
    return result;
}

#pragma mark image scale utility
- (UIImage *)imageByScalingToMaxSize:(UIImage *)sourceImage {
    if (sourceImage.size.width < ORIGINAL_MAX_WIDTH) return sourceImage;
    CGFloat btWidth = 0.0f;
    CGFloat btHeight = 0.0f;
    if (sourceImage.size.width > sourceImage.size.height) {
        btHeight = ORIGINAL_MAX_WIDTH;
        btWidth = sourceImage.size.width * (ORIGINAL_MAX_WIDTH / sourceImage.size.height);
    } else {
        btWidth = ORIGINAL_MAX_WIDTH;
        btHeight = sourceImage.size.height * (ORIGINAL_MAX_WIDTH / sourceImage.size.width);
    }
    CGSize targetSize = CGSizeMake(btWidth, btHeight);
    return [self imageByScalingAndCroppingForSourceImage:sourceImage targetSize:targetSize];
}

- (UIImage *)imageByScalingAndCroppingForSourceImage:(UIImage *)sourceImage targetSize:(CGSize)targetSize {
    UIImage *newImage = nil;
    CGSize imageSize = sourceImage.size;
    CGFloat width = imageSize.width;
    CGFloat height = imageSize.height;
    CGFloat targetWidth = targetSize.width;
    CGFloat targetHeight = targetSize.height;
    CGFloat scaleFactor = 0.0;
    CGFloat scaledWidth = targetWidth;
    CGFloat scaledHeight = targetHeight;
    CGPoint thumbnailPoint = CGPointMake(0.0,0.0);
    if (CGSizeEqualToSize(imageSize, targetSize) == NO)
    {
        CGFloat widthFactor = targetWidth / width;
        CGFloat heightFactor = targetHeight / height;
        
        if (widthFactor > heightFactor)
            scaleFactor = widthFactor; // scale to fit height
        else
            scaleFactor = heightFactor; // scale to fit width
        scaledWidth  = width * scaleFactor;
        scaledHeight = height * scaleFactor;
        
        // center the image
        if (widthFactor > heightFactor)
        {
            thumbnailPoint.y = (targetHeight - scaledHeight) * 0.5;
        }
        else
            if (widthFactor < heightFactor)
            {
                thumbnailPoint.x = (targetWidth - scaledWidth) * 0.5;
            }
    }
    UIGraphicsBeginImageContext(targetSize); // this will crop
    CGRect thumbnailRect = CGRectZero;
    thumbnailRect.origin = thumbnailPoint;
    thumbnailRect.size.width  = scaledWidth;
    thumbnailRect.size.height = scaledHeight;
    
    [sourceImage drawInRect:thumbnailRect];
    
    newImage = UIGraphicsGetImageFromCurrentImageContext();
    if(newImage == nil) NSLog(@"could not scale image");
    
    //pop the context to get back to the default
    UIGraphicsEndImageContext();
    return newImage;
}

//#pragma mark portraitImageView getter
//- (UIImageView *)portraitImageView {
//    if (!_portraitImageView) {
//        CGFloat w = 100.0f; CGFloat h = w;
//        CGFloat x = (self.view.frame.size.width - w) / 2;
//        CGFloat y = (self.view.frame.size.height - h) / 2;
//        _portraitImageView = [[UIImageView alloc] initWithFrame:CGRectMake(x, y, w, h)];
//        [_portraitImageView.layer setCornerRadius:(_portraitImageView.frame.size.height/2)];
//        [_portraitImageView.layer setMasksToBounds:YES];
//        [_portraitImageView setContentMode:UIViewContentModeScaleAspectFill];
//        [_portraitImageView setClipsToBounds:YES];
//        _portraitImageView.layer.shadowColor = [UIColor blackColor].CGColor;
//        _portraitImageView.layer.shadowOffset = CGSizeMake(4, 4);
//        _portraitImageView.layer.shadowOpacity = 0.5;
//        _portraitImageView.layer.shadowRadius = 2.0;
//        _portraitImageView.layer.borderColor = [[UIColor blackColor] CGColor];
//        _portraitImageView.layer.borderWidth = 2.0f;
//        _portraitImageView.userInteractionEnabled = YES;
//        _portraitImageView.backgroundColor = [UIColor blackColor];
//        UITapGestureRecognizer *portraitTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(editPortrait)];
//        [_portraitImageView addGestureRecognizer:portraitTap];
//    }
//    return _portraitImageView;
//}
//等比例压缩
- (UIImage *)scaleToSize:(UIImage *)img{
    CGSize targetSize = CGSizeMake(img.size.width/2, img.size.height/2);

    return [self imageByScalingAndCroppingForSourceImage:img targetSize:targetSize];
}

@end
