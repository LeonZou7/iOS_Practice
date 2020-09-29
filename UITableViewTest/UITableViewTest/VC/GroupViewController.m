//
//  GroupViewController.m
//  UITableViewTest
//
//  Created by Leon Zou on 2020/9/8.
//

#import "GroupViewController.h"
#import "AppDelegate.h"
#import "DetailViewController.h"
#import "CityForGrouped.h"

@interface GroupViewController ()<UITableViewDelegate, UITableViewDataSource, DetailViewControllerDelegate>

@property(nonatomic, strong) UITableView *groupedTableView;

@end

extern AppDelegate *appDelegate;

@implementation GroupViewController
 
- (instancetype)init{
    self = [super init];
    if (self) {
        [self.view setBackgroundColor:[UIColor blueColor]];
        self.tabBarItem.title = @"Grouped";
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    // TODO: 下拉刷新
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
    return [[CityForGrouped sharedSingleton].head count];
}

// title of section
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return [[CityForGrouped sharedSingleton].head objectAtIndex:section];
}

// number of items for each section
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    switch (section) {
        case 0:
            return [[CityForGrouped sharedSingleton].first count];
        case 1:
            return [[CityForGrouped sharedSingleton].second count];
        case 2:
            return [[CityForGrouped sharedSingleton].third count];
        default:
            return 0;
    }
}

// cell
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *ID = @"GroupedCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    
    switch (indexPath.section) {
        case 0:
            cell.textLabel.text = [[CityForGrouped sharedSingleton].first objectAtIndex:indexPath.row];
            cell.imageView.image = [UIImage imageNamed:@"pic1"];
            break;
        
        case 1:
        cell.textLabel.text = [[CityForGrouped sharedSingleton].second objectAtIndex:indexPath.row];
        cell.imageView.image = [UIImage imageNamed:@"pic2"];
        break;
        
        case 2:
        cell.textLabel.text = [[CityForGrouped sharedSingleton].third objectAtIndex:indexPath.row];
        cell.imageView.image = [UIImage imageNamed:@"pic3"];
        break;
            
        default:
            break;
    }
    
    UILongPressGestureRecognizer *longPressGR = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(itemDidLongPressed:)];
    longPressGR.name = cell.textLabel.text;
    longPressGR.minimumPressDuration = 0.5f;
    [cell addGestureRecognizer:longPressGR];
    
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath {
    return @"Delete";
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    switch (indexPath.section) {
        case 0:
            [[CityForGrouped sharedSingleton].first removeObjectAtIndex:indexPath.row];
            break;
        
        case 1:
            [[CityForGrouped sharedSingleton].second removeObjectAtIndex:indexPath.row];
            break;
            
        case 2:
            [[CityForGrouped sharedSingleton].third removeObjectAtIndex:indexPath.row];
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

#pragma mark - UILongPressGestureRecognizer

- (void)itemDidLongPressed:(UILongPressGestureRecognizer *)sender {
    if (sender.state == UIGestureRecognizerStateBegan) {
        NSLog(@"Long press detected.");
    }

    NSString *detailStr = [[CityForGrouped sharedSingleton] detailByName:sender.name];
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Detail" message:detailStr preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
    
    [alertController addAction:okAction];
    [self presentViewController:alertController animated:YES completion:nil];
}

@end
