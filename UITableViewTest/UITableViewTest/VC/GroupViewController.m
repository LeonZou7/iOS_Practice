//
//  GroupViewController.m
//  UITableViewTest
//
//  Created by bytedance on 2020/9/8.
//  Copyright © 2020 bytedance. All rights reserved.
//

#import "GroupViewController.h"
#import "AppDelegate.h"
#import "DetailViewController.h"

@interface GroupViewController ()<UITableViewDelegate, UITableViewDataSource, DetailViewControllerDelegate>

@property(nonatomic, strong) UITableView *groupedTableView;

@end

extern AppDelegate *appDelegate;

@implementation GroupViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    
    UITableView *groupedView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, appDelegate.window.bounds.size.width, appDelegate.window.bounds.size.height) style:UITableViewStyleGrouped];
    self.groupedTableView = groupedView;
    
    UILabel *headerLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 30)];
    headerLabel.text = @"Cities Grouped";
    headerLabel.textColor = [UIColor whiteColor];
    headerLabel.backgroundColor = [UIColor blueColor];
    headerLabel.textAlignment = NSTextAlignmentCenter;
    [groupedView setTableHeaderView:headerLabel];
    
    UILabel *footerLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 320, 30)];
    footerLabel.text = @"Crated by Leon";
    [groupedView setTableFooterView:footerLabel];
    
    groupedView.sectionHeaderHeight = 20;
    groupedView.sectionFooterHeight = 20;
    
    groupedView.separatorColor = [UIColor blueColor];
    groupedView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    groupedView.backgroundColor = [UIColor lightGrayColor];
    
    groupedView.delegate = self;
    groupedView.dataSource = self;
    
    [self.view addSubview:groupedView];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark - groupedViewDataSource

// number of section
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [appDelegate.objectForGrouped.head count];
}

// title of section
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return [appDelegate.objectForGrouped.head objectAtIndex:section];
}

// number of items for each section
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    switch (section) {
        case 0:
            return [appDelegate.objectForGrouped.first count];
        case 1:
            return [appDelegate.objectForGrouped.second count];
        case 2:
            return [appDelegate.objectForGrouped.third count];
        default:
            return 0;
    }
}

// cell
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *ID = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    
    switch (indexPath.section) {
        case 0:
            cell.textLabel.text = [appDelegate.objectForGrouped.first objectAtIndex:indexPath.row];
            cell.imageView.image = [UIImage imageNamed:@"/Users/bytedance/Desktop/Bytedance/iOS_Test/UITableViewTest/UITableViewTest/pic1.jpeg"];
            break;
        
        case 1:
        cell.textLabel.text = [appDelegate.objectForGrouped.second objectAtIndex:indexPath.row];
        cell.imageView.image = [UIImage imageNamed:@"/Users/bytedance/Desktop/Bytedance/iOS_Test/UITableViewTest/UITableViewTest/pic2.jpeg"];
        break;
        
        case 2:
        cell.textLabel.text = [appDelegate.objectForGrouped.third objectAtIndex:indexPath.row];
        cell.imageView.image = [UIImage imageNamed:@"/Users/bytedance/Desktop/Bytedance/iOS_Test/UITableViewTest/UITableViewTest/pic3.jpeg"];
        break;
            
        default:
            break;
    }
    
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath {
    return @"Delete";
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    switch (indexPath.section) {
        case 0:
            [appDelegate.objectForGrouped.first removeObjectAtIndex:indexPath.row];
            break;
        
        case 1:
            [appDelegate.objectForGrouped.second removeObjectAtIndex:indexPath.row];
            break;
            
        case 2:
            [appDelegate.objectForGrouped.third removeObjectAtIndex:indexPath.row];
            break;
            
        default:
            break;
    }
    
    [self.groupedTableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
}

- (void)tableView:(UITableView *)tableView didEndEditingRowAtIndexPath:(NSIndexPath *)indexPath {
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    DetailViewController *detailViewController = [[DetailViewController alloc] init];
    detailViewController.delegate = self;
    detailViewController.editingIndexPath = indexPath;
    detailViewController.tableType = 2;
    [self presentViewController:detailViewController animated:YES completion:nil];
}

#pragma mark - DetailViewControllerDelegate

- (void)detailViewControllerDidChange:(DetailViewController *)viewController {
    [self.groupedTableView reloadData];
}

@end
