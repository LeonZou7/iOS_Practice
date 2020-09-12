//
//  ViewController.m
//  FirstApp
//
//  Created by bytedance on 2020/8/26.
//  Copyright © 2020 bytedance. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UILabel* theme = [[UILabel alloc] init];
    UILabel* username = [[UILabel alloc] init];
    UILabel* password = [[UILabel alloc] init];

    UITextField* inputUsername = [[UITextField alloc]init];
    UITextField* inputPassword = [[UITextField alloc]init];
    
    UIImageView* imgView = [[UIImageView alloc] initWithFrame:CGRectMake(110, 140, 150, 125)];
    
    UIImage* img = [UIImage imageNamed:@"/Users/bytedance/Desktop/Bytedance/iOS_Test/FirstApp/test.jpeg"];
    //UIImage* img = [[UIImage alloc]initWithContentsOfFile:[NSString stringWithFormat:@"%@/Documents/ppp.png",NSHomeDirectory()]];    //方法二
    //UIImage* img = [[UIImage alloc] initWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:@"http://m.imeitou.com/uploads/allimg/2020021110/r2jdtkd3zsj.jpeg"]]];     //方法三（网络图片，由于是http请求，需要在Info.plist中改设置，见控制台输出）
    
    UIButton* login = [[UIButton alloc]init];
    
    [theme setText:@"First Application"];
    theme.font = [UIFont systemFontOfSize:40];
    [theme setFrame:CGRectMake(50, 50, 300, 100)];
    [theme sizeToFit];
    
    //imgView.bounds = CGRectMake(0, 0, 150, 125);
    imgView.image = img;
    //NSLog(@"%@", img);
    imgView.layer.masksToBounds = YES;
    imgView.layer.cornerRadius = 10;
    //imgView.backgroundColor = [UIColor redColor];

    [username setText:@"Username"];
    [username setFrame:CGRectMake(80, 300, 50, 30)];
    [username sizeToFit];
    
    CGSize screenSize = [UIScreen mainScreen].bounds.size;
    screenSize = self.view.frame.size;
    
    [inputUsername setFrame:CGRectMake(80, 340, 200, 30)];
    [inputUsername setBorderStyle:UITextBorderStyleRoundedRect];
    
    [password setFrame:CGRectMake(80, 380, 50, 30)];
    [password setText:@"Password"];
    [password sizeToFit];
    
    inputPassword.secureTextEntry = YES;
    [inputPassword setFrame:CGRectMake(80, 420, 200, 30)];
    [inputPassword setBorderStyle:UITextBorderStyleRoundedRect];
    
    [login setFrame:CGRectMake(150, 530, 50, 30)];
    [login setTitle:@"Login!" forState:UIControlStateNormal];
    [login setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    
    //自动换行label测试
    UILabel* test = [[UILabel alloc] initWithFrame:CGRectMake(100, 630, 50, 100)];
    test.text = @"abcdefghijklmnopqrstuvwxyz";
    test.lineBreakMode = NSLineBreakByWordWrapping;
    test.numberOfLines = 0;     //自动换行
    
    [self.view addSubview:theme];
    [self.view addSubview:imgView];
    [self.view addSubview:username];
    [self.view addSubview:inputUsername];
    [self.view addSubview:password];
    [self.view addSubview:inputPassword];
    [self.view addSubview:login];
    
    [self.view addSubview:test];
    
    [login addTarget:self action:@selector(loginComfirm:) forControlEvents:UIControlEventTouchUpInside];    //单击事件绑定
    
    //UIbutton双击事件：通过UITapGestureRecognizer实现
    UITapGestureRecognizer* doubleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(actionForDoubleTap:)];
    [doubleTap setNumberOfTapsRequired: 2];     //设置点击次数
    [login addGestureRecognizer:doubleTap];     //事件绑定
}

- (void)loginComfirm:(UIButton*) btn {
    NSLog(@"Login Comfirm.");
}

- (void)actionForDoubleTap:(UIButton*) btn {
    NSLog(@"Double click detected.");
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    // 有键盘出现时，点击空白处收回键盘
    [self.view endEditing:YES];
}


@end
