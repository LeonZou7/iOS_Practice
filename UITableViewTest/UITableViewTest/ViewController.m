//
//  ViewController.m
//  UITableViewTest
//
//  Created by Leon Zou on 2020/9/2.
//  Copyright © 2020 Leon Zou. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"
#import "DetailViewController.h"

@interface ViewController ()

@property(nonatomic, strong)UIButton *cameraButton;
@property(nonatomic, strong)UIImageView *imgView;
@property(nonatomic, strong)UIImagePickerController *imgPicker;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // TODO: add a button and a imageView, and the button is to open camera and the imageView is for the single pic user chooses
    self.view.backgroundColor = [UIColor systemYellowColor];
    
    self.cameraButton = [[UIButton alloc] initWithFrame:CGRectMake(100, self.view.bounds.size.height - 200, 150, 50)];
    [self.cameraButton setBackgroundColor:[UIColor systemGrayColor]];
    [self.cameraButton setTitle:@"Select" forState:UIControlStateNormal];
    [self.cameraButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.cameraButton addTarget:self action:@selector(clickToCamera:) forControlEvents:UIControlEventTouchUpInside];
    
    self.imgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"/Users/bytedance/Desktop/Bytedance/iOS_Test/UITableViewTest/UITableViewTest/pic1.jpeg"]];
    [self.imgView setFrame:CGRectMake(0, 80, self.view.bounds.size.width, 370)];
    
    [self.view addSubview:self.imgView];
    [self.view addSubview:self.cameraButton];
}

#pragma mark - Methods

- (BOOL)isCameraAvailable {
    return [UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera];
}

- (void)clickToCamera:(UIButton *)sender {
    // UIImagePicker参数详解：https://www.cnblogs.com/XYQ-208910/p/4870076.html
    self.imgPicker = [[UIImagePickerController alloc] init];
    self.imgPicker.editing = YES;
    self.imgPicker.allowsEditing = YES;
    self.imgPicker.delegate = self;
    
    // 询问选择相机还是相册
    UIAlertController *cameraOrPhotoLibraryAlert = [UIAlertController alertControllerWithTitle:@"Photo or Camera?" message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    
    // 相机
    UIAlertAction *goCamera = [UIAlertAction actionWithTitle:@"Camera" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        self.imgPicker.sourceType = UIImagePickerControllerSourceTypeCamera;
        /* sourceType:  数据来源
         UIImagePickerControllerSourceTypePhotoLibrary,     //1.从图库中选择
         UIImagePickerControllerSourceTypeCamera,   //2.直接调用摄像头拍照
         UIImagePickerControllerSourceTypeSavedPhotosAlbum   //3.从相册中选择
         */
        
        self.imgPicker.cameraDevice = UIImagePickerControllerCameraDeviceRear;
        /* cameraDevice     相机类型
         UIImagePickerControllerCameraDeviceRear,   // 后摄像头
         UIImagePickerControllerCameraDeviceFront   // 前摄像头
         */
        
        self.imgPicker.cameraFlashMode = UIImagePickerControllerCameraFlashModeAuto;
        /*  cameraFlashMode     闪光灯
         UIImagePickerControllerCameraFlashModeAuto,    // 自动
         UIImagePickerControllerCameraFlashModeOn       // 开
         UIImagePickerControllerCameraFlashModeOff      // 关
         */
        
        self.imgPicker.modalPresentationStyle = UIModalPresentationFullScreen;
        /* modalPresentationStyle   弹出风格
         UIModalPresentationFullScreen,
         UIModalPresentationPageSheet,
         UIModalPresentationFormSheet,
         UIModalPresentationCurrentContext,
         详见 https://www.jianshu.com/p/b0b46c69860c
         */
        
        self.imgPicker.cameraCaptureMode = UIImagePickerControllerCameraCaptureModePhoto;
        /* cameraCaptureMode:
         UIImagePickerControllerCameraCaptureModePhoto,     // 拍照
         UIImagePickerControllerCameraCaptureModeVideo,     // 录像
         */
        
        // 检查相机是否可用
        if (YES == [self isCameraAvailable]) {
            // 弹出相机
            [self presentViewController:self.imgPicker animated:YES completion:nil];
        } else {
            // 失败，弹出提示框
            UIAlertController *failToCameraAlert = [UIAlertController alertControllerWithTitle:@"Failed!" message:@"Cannot open camera" preferredStyle:UIAlertControllerStyleAlert];
            
            UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
            
            [failToCameraAlert addAction:okAction];
            [self presentViewController:failToCameraAlert animated:YES completion:nil];
        }
    }];
    
    // 相册
    UIAlertAction *goPhotoLibrary = [UIAlertAction actionWithTitle:@"Photo" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        self.imgPicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        // 弹出相册
        [self presentViewController:self.imgPicker animated:YES completion:nil];
    }];
    
    // 取消
    UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        [self dismissViewControllerAnimated:YES completion:nil];
    }];
    
    [cameraOrPhotoLibraryAlert addAction:goCamera];
    [cameraOrPhotoLibraryAlert addAction:goPhotoLibrary];
    [cameraOrPhotoLibraryAlert addAction:cancel];
    
    // 弹出提示框
    [self presentViewController:cameraOrPhotoLibraryAlert animated:YES completion:nil];
}

#pragma mark - imgPickerController delegate

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<UIImagePickerControllerInfoKey,id> *)info {
    /* info     包含图片信息的字典
      UIImagePickerControllerMediaType,      // 用户自定义的media类型
      UIImagePickerControllerOriginalImage,      // 原始图片
      UIImagePickerControllerEditedImage,        // 编辑后的图片
      UIImagePickerControllerCropRect,       // 裁剪尺寸
      UIImagePickerControllerMediaURL,       // 媒体URL
      UIImagePickerControllerReferenceURL        // 原件URL
      UIImagePickerControllerMediaMetadata,      // 元数据（？）
     */
    
    [picker dismissViewControllerAnimated:YES completion:nil];
    
    // 拿到照片
    UIImage *img = [info valueForKey:UIImagePickerControllerEditedImage];
    self.imgView.image = img;
}

@end
