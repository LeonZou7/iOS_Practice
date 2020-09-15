//
//  ViewController.m
//  AutoLayoutTest
//
//  Created by bytedance on 2020/9/7.
//  Copyright © 2020 bytedance. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //Do any additional setup after loading the view.
    UIView *testView = [[UIView alloc] init];
    testView.backgroundColor = [UIColor cyanColor];
    testView.translatesAutoresizingMaskIntoConstraints = NO;    // 禁止Autosizing
    
    [self.view addSubview:testView];    // ！！添加约束之前必须保证控件已经绑定在父控件上
    
    // 宽约束
    NSLayoutConstraint *widthConstraint = [NSLayoutConstraint constraintWithItem:testView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:0.0 constant:150];
    [testView addConstraint:widthConstraint];
    // 高约束
    NSLayoutConstraint *heightConstraint = [NSLayoutConstraint constraintWithItem:testView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:0.0 constant:150];
    [testView addConstraint:heightConstraint];
    // left约束
    NSLayoutConstraint *leftConstraint = [NSLayoutConstraint constraintWithItem:testView attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeft multiplier:1.0 constant:100];
    [self.view addConstraint:leftConstraint];
    // top约束
    NSLayoutConstraint *topConstraint = [NSLayoutConstraint constraintWithItem:testView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTop multiplier:1.0 constant:200];
    [self.view addConstraint:topConstraint];
}

@end
