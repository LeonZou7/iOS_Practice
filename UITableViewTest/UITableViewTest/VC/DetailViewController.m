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
UITextField* cityField;
UITextField* detailField;
extern AppDelegate *appDelegate;

@implementation DetailViewController

-(void) viewDidLoad {
    [super viewDidLoad];
    
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
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
    [cityField setText:[self defaultTitle]];    //设置初始默认值
    [self.view addSubview:cityField];
    
    //detailLabel
    UILabel* detailLabel = [[UILabel alloc] initWithFrame:CGRectMake(50, 250, 80, 30)];
    [detailLabel setText:@"Detail: "];
    [self.view addSubview:detailLabel];
    
    //detailTextField
    detailField = [[UITextField alloc] initWithFrame:CGRectMake(100, 250, 250, 30)];
    [detailField setBorderStyle:UITextBorderStyleRoundedRect];
    [detailField setBackgroundColor:[UIColor whiteColor]];
    [detailField setText:[self defaultValue]];     //设置初始默认值
    [self.view addSubview:detailField];
    
    //commitButton
    UIButton* commitButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [commitButton setFrame:CGRectMake(120, 300, 100, 100)];
    [commitButton setTitle:@"Commit" forState:UIControlStateNormal];
    [commitButton addTarget:self action:@selector(commitChange:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:commitButton];
}

#pragma mark - method

// get default title from table
- (NSString *)defaultTitle {
    if (self.tableType == 1) {
        return [appDelegate.objectForPlain.cities objectAtIndex:self.editingIndexPath.row];
    } else {
        return [[self arrayInGroupedViewWithIndex:self.editingIndexPath.section] objectAtIndex:self.editingIndexPath.row];
    }
}

// get default value from table
- (NSString *)defaultValue {
    if (self.tableType == 1) {
        return [appDelegate.objectForPlain.details objectAtIndex:self.editingIndexPath.row];
    } else {
        return [appDelegate.objectForGrouped.details objectAtIndex:self.editingIndexPath.row];
    }
}

// get different groups from groupedView
- (NSMutableArray *)arrayInGroupedViewWithIndex: (NSInteger)index {
    if (index == 0) {
        return appDelegate.objectForGrouped.first;
    } else if (index == 1) {
        return appDelegate.objectForGrouped.second;
    } else {
        return appDelegate.objectForGrouped.third;
    }
}

// close keyboard when click the blank area of screen
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [super touchesBegan:touches withEvent:event];
    [self.view endEditing:YES];
}

-(void) commitChange: (id)sender {
    if (self.tableType == 1) {
        [appDelegate.objectForPlain.cities replaceObjectAtIndex:self.editingIndexPath.row withObject:[cityField text]];     //替换city
        [appDelegate.objectForPlain.details replaceObjectAtIndex:self.editingIndexPath.row withObject:[detailField text]];      //替换detail
    } else {
        [[self arrayInGroupedViewWithIndex:self.editingIndexPath.section] replaceObjectAtIndex:self.editingIndexPath.row withObject:cityField.text];
        [appDelegate.objectForGrouped.details replaceObjectAtIndex:self.editingIndexPath.row withObject:detailField.text];
    }
    
//    NSLog(@"%@", [appDelegate.cities objectAtIndex:rowIndex]);
//    NSLog(@"%@", [appDelegate.details objectAtIndex:rowIndex]);
    
    //why respondsToSelector ->  A protection, to make sure the object does have the method we want
    if ([self.delegate respondsToSelector:@selector(detailViewControllerDidChange:)]) {
        [self.delegate detailViewControllerDidChange:self];
    }
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void) clickToClose: (id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
