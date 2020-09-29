//
//  loginViewController.m
//  UITableViewTest
//
//  Created by Leon Zou on 2020/9/22.
//

#import "LoginViewController.h"
#import "CameraViewController.h"
#import "AppDelegate.h"
#import "User.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = UIColor.lightGrayColor;
    UIButton *loginButton = [[UIButton alloc] initWithFrame:CGRectMake(150, 350, 100, 50)];
    [loginButton setTitle:@"Login"
                 forState:UIControlStateNormal];
    loginButton.backgroundColor = UIColor.blueColor;
    [loginButton addTarget:self
                    action:@selector(loginComfirm:)
          forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:loginButton];
}

#pragma mark - Login Methods

- (void)loginComfirm:(UIButton *)sender {
    UIAlertController *loginAlertVC = [UIAlertController alertControllerWithTitle:@"Welcome" message:@"Plz enter your info" preferredStyle:UIAlertControllerStyleAlert];
    
    [loginAlertVC addTextFieldWithConfigurationHandler:^(UITextField *textField) {
        textField.placeholder = @"username";
        [textField becomeFirstResponder];   // 光标首先定位在username
        // TODO: bugfix - no keyboard shown up
    }];
    
    [loginAlertVC addTextFieldWithConfigurationHandler:^(UITextField *textField) {
        textField.placeholder = @"password";
        textField.secureTextEntry = YES;
    }];

    UIAlertAction *loginAction = [UIAlertAction actionWithTitle:@"Login"
                                                          style:UIAlertActionStyleDefault
                                                        handler:^(UIAlertAction *action) {
        NSString *inputUsername = loginAlertVC.textFields[0].text;
        NSString *inputPassword = loginAlertVC.textFields[1].text;
//        NSLog(@"%@, %@", loginAlertVC.textFields[0].text, loginAlertVC.textFields[1].text);

        //login compare
        if ([[User sharedSingleton].username isEqualToString:inputUsername] && [[User sharedSingleton].password isEqualToString:inputPassword]) {
            [self loginSuccess];
        } else {
            [self loginFailed];
        }
    }];
    loginAction.enabled = YES;
    [loginAlertVC addAction:loginAction];
    
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"Cancel"
                                                           style:UIAlertActionStyleCancel
                                                         handler:nil];
    [loginAlertVC addAction:cancelAction];
    
    [self presentViewController:loginAlertVC
                       animated:YES
                     completion:nil];
}

- (void)loginSuccess {
    // login successed
    AppDelegate *appdelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    
    UIAlertController *loginSuccessAlert = [UIAlertController alertControllerWithTitle:@"Success!"
                                                                               message:@"Login success"
                                                                        preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *jumpAction = [UIAlertAction actionWithTitle:@"OK"
                                                         style:UIAlertActionStyleDefault
                                                       handler:^(UIAlertAction *action){
        UITabBarController *mainTabBarVC = (UITabBarController *)[appdelegate displayMainViewAfterLogin];    // show mainView after login
        // TODO: add a transition from login page to main view
        [self presentViewController:mainTabBarVC
                           animated:YES
                         completion:nil];        
    }];
    [loginSuccessAlert addAction:jumpAction];
    [self presentViewController:loginSuccessAlert animated:YES
                     completion:nil];
}

- (void)loginFailed {
    // login failed
    UIAlertController *loginFailedAlert = [UIAlertController alertControllerWithTitle:@"Failed!"
                                                                              message:@"Wrong username or password"
                                                                       preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK"
                                                       style:UIAlertActionStyleDefault
                                                     handler:nil];
    [loginFailedAlert addAction:okAction];
    [self presentViewController:loginFailedAlert
                       animated:YES
                     completion:nil];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    // 有键盘出现时，点击空白处收回键盘
    [self.view endEditing:YES];
}

@end
