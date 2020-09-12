//
//  DetailViewController.m
//  UITableViewTest
//
//  Created by bytedance on 2020/9/3.
//  Copyright © 2020 bytedance. All rights reserved.
//

#import "DetailViewController.h"
#import "ViewController.h"
#import "AppDelegate.h"

@interface ViewController ()

@end

//当前编辑的表格行号
NSUInteger rowIndex;
UITextField* cityField;
UITextField* detailField;

@implementation DetailViewController

-(void) viewDidLoad {
    [super viewDidLoad];
    
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    AppDelegate* appDelegate = (AppDelegate*) [[UIApplication sharedApplication] delegate];
    rowIndex = self.editingIndexPath.row;
    
    //closeButton
    UIButton* closeButton = [UIButton buttonWithType:UIButtonTypeClose];
    [closeButton setFrame:CGRectMake(10, 10, 30, 30)];
    [closeButton addTarget:self action:@selector(clickToClose:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:closeButton];
    
    //cityLabel
    UILabel* cityLabel = [[UILabel alloc] initWithFrame:CGRectMake(50, 200, 80, 30)];
    [cityLabel setText:@"City: "];
    [self.view addSubview:cityLabel];
    
    //cityTextField
    cityField = [[UITextField alloc] initWithFrame:CGRectMake(100, 200, 250, 30)];
    [cityField setBorderStyle:UITextBorderStyleRoundedRect];
    [cityField setBackgroundColor:[UIColor whiteColor]];
    [cityField setText:[appDelegate.cities objectAtIndex:rowIndex]];    //设置初始默认值
    [self.view addSubview:cityField];
    
    //detailLabel
    UILabel* detailLabel = [[UILabel alloc] initWithFrame:CGRectMake(50, 250, 80, 30)];
    [detailLabel setText:@"Detail: "];
    [self.view addSubview:detailLabel];
    
    //detailTextField
    detailField = [[UITextField alloc] initWithFrame:CGRectMake(100, 250, 250, 30)];
    [detailField setBorderStyle:UITextBorderStyleRoundedRect];
    [detailField setBackgroundColor:[UIColor whiteColor]];
    [detailField setText:[appDelegate.details objectAtIndex:rowIndex]];     //设置初始默认值
    [self.view addSubview:detailField];
    
    //commitButton
    UIButton* commitButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [commitButton setFrame:CGRectMake(120, 300, 100, 100)];
    [commitButton setTitle:@"Commit" forState:UIControlStateNormal];
    [commitButton addTarget:self action:@selector(commitChange:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:commitButton];
}

#pragma mark - method

-(void) commitChange: (id)sender {
    AppDelegate* appDelegate = (AppDelegate*) [[UIApplication sharedApplication] delegate];
    
    [appDelegate.cities replaceObjectAtIndex:rowIndex withObject:[cityField text]];     //替换city
    [appDelegate.details replaceObjectAtIndex:rowIndex withObject:[detailField text]];      //替换detail
    
//    NSLog(@"%@", [appDelegate.cities objectAtIndex:rowIndex]);
//    NSLog(@"%@", [appDelegate.details objectAtIndex:rowIndex]);
    
    //why respondsToSelector ->  A method of protection
    if ([self.delegate respondsToSelector:@selector(detailViewControllerDidChange:)]) {
        [self.delegate detailViewControllerDidChange:self];
    }
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void) clickToClose: (id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
