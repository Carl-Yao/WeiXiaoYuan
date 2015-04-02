//
//  NotifyBaseViewController.m
//  WeiXiaoYuan
//
//  Created by 姚振兴 on 14/12/27.
//  Copyright (c) 2014年 Dukeland. All rights reserved.
//

#import "NotifyBaseViewController.h"
#import "IQActionSheetPickerView.h"
//#import "FileManagement.h"
#define ORIGINAL_MAX_WIDTH 640.0f

@interface NotifyBaseViewController ()

@end

@implementation NotifyBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)actionSheetPickerView:(IQActionSheetPickerView *)pickerView didSelectTitles:(NSArray *)titles
{
    if (pickerView.tag == 6)
    {
        NSDateFormatter* dateFormat = [[NSDateFormatter alloc] init];        [dateFormat setDateFormat:@"yyyy-MM-dd"];
        NSString *dateString = [dateFormat stringFromDate:pickerView.date];
        //体温记录和体温告警有选完日期后的数据获取(应该是日期的id是search_date)，此时需要特殊处理，调用setDateInputValue
        if ([divName isEqualToString: @"search_date"])
        {
            NSString *jsResult = [self ExeJsCode:[NSString stringWithFormat:@"setDateInputValue(\'%@\',\'%@\')",divName,dateString]];
        }else{
            NSString *jsCode = [NSString stringWithFormat:@"document.getElementById(\"%@\").innerText = \"%@\";",divName,dateString];
            NSString *jsResult = [self ExeJsCode:jsCode];
        }
            //[easyViewControllers[selectIndex] stringByEvaluatingJavaScriptFromString:jsCode];
    }
}

-(NSString*) ExeJsCode:(NSString*)jsCode
{
    //重载
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
        NSData *data = UIImageJPEGRepresentation(portraitImg, 1.0);
        
        
        NSString *docDir = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
        
        NSString *pngFilePath = [NSString stringWithFormat:@"%@/test.jpg",docDir];
        bool c = [data writeToFile:pngFilePath atomically:YES];
        NSString *jsResult = [self ExeJsCode:[NSString stringWithFormat: @"setPhoto(\"true\",\"%@?t=%@\")",pngFilePath,[self GetRandomString]]];
        //[easyViewControllers[selectIndex] stringByEvaluatingJavaScriptFromString:[NSString stringWithFormat: @"setPhoto(\"true\",\"%@\")",pngFilePath]];
        
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

@end
