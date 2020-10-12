//
//  ViewController.h
//  UITableViewTest
//
//  Created by Leon Zou on 2020/9/2.
//

#import <UIKit/UIKit.h>
#import "SwitchViewProtocol.h"

@interface CameraViewController : UIViewController<UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@property(nonatomic, weak) id<SwitchViewProtocol> delegate;

@end

