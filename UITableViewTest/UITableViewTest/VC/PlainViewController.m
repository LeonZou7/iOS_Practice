//
//  PlainViewController.m
//  UITableViewTest
//
//  Created by bytedance on 2020/9/10.
//  Copyright © 2020 bytedance. All rights reserved.
//

#import "PlainViewController.h"
#import "AppDelegate.h"
#import "DetailViewController.h"

@interface PlainViewController ()<UITableViewDelegate, UITableViewDataSource, DetailViewControllerDelegate>

@property (nonatomic, strong) UITableView *plainTableView;

@end

AppDelegate *appDelegate;

@implementation PlainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    appDelegate = (AppDelegate*)[[UIApplication sharedApplication] delegate];
        
    //UITableView* tableView = [[UITableView alloc] initWithFrame:[UIScreen mainScreen].bounds style:UITableViewStylePlain];
    UITableView* tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, appDelegate.window.bounds.size.width, appDelegate.window.bounds.size.height) style:UITableViewStylePlain];
    self.plainTableView = tableView;
    /*  UITableView的style参数如下：
     UITableViewStylePlain      默认识图
     UITableViewStyleGrouped    分组视图
     */
    
    UILabel* headLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 30)];
    [headLabel setText:@"Cities Plain"];
    [headLabel setTextColor:[UIColor blackColor]];
    [headLabel setBackgroundColor:[UIColor redColor]];
    [headLabel setTextAlignment:NSTextAlignmentCenter];
    [headLabel setUserInteractionEnabled:YES];
    [tableView setTableHeaderView:headLabel];   //设置页眉

    UITapGestureRecognizer *labelTapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(touchToGroupView:)];
    [headLabel addGestureRecognizer:labelTapGestureRecognizer];
    
    UILabel* footerLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 320, 30)];
    [footerLabel setText:@"Created by Leon"];
    [tableView setTableFooterView:footerLabel];     //设置页脚
    
    //[tableView setRowHeight:50];    //设置行cell高度
    [tableView setSeparatorColor:[UIColor redColor]];   //设置分割线颜色
    [tableView setSeparatorStyle:UITableViewCellSeparatorStyleSingleLine];  //设置分割线风格
    /*  分割线参数如下：
     UITableViewCellSeparatorStyleNone  不使用分割线
     UITableViewCellSeparatorStyleSingleLine    使用分割线
     UITableViewCellSeparatorStyleSingleLineEtched      在分组的情况下使用分割线
     */
    [tableView setBackgroundColor:[UIColor lightGrayColor]];
    
    tableView.delegate = self;
    tableView.dataSource = self;
    
    [self.view addSubview:tableView];
}

- (void)touchToGroupView:(UITapGestureRecognizer *)recognizer {     // this method is called once the title "Cities" is touched
    NSLog(@"title touched.");
}

#pragma mark - UITableViewDataSource

//@required
//返回分区数据的数量
-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [appDelegate.objectForPlain.cities count];
}

//@required
//返回每行的单元格，提供显示的数据
-(UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString* ID = @"cell";
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:ID];   //可重用cell
    
    if(cell == nil) {   //当取出的cell是nil时，创建一个cell并绑定ID
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle
                                      reuseIdentifier:ID];
        /*  UITableViewCell的style参数如下：
         UITableViewCellDefault     提供了居左黑色标签textLabel和可选的图像ImageView
         UITableViewCellValue1      提供了居左黑色标签textLabel和居右较小蓝色标签detailTextLabel
         UITableViewCellValue2      提供居左蓝色标签textLabel和在其右边的左对齐较小黑色标签detailTextLabel
         UITableViewCellSubtitle    相对于第一种，在textLabel下面增加了较小的灰色标签detailTextLabel
         */
    }
    cell.layer.cornerRadius = 10;   //边框设置圆角
    cell.layer.masksToBounds = YES;
    
    //UITableView声明了一个NSIndexPath的类别，主要用来标识当前cell的在tableView中的位置，
    //该类别有section和row两个属性，section标识当前cell处于第几个section中，
    //row代表在该section中的第几行。
    NSInteger rowIndex = indexPath.row;     //从indexPath拿到当前的行号
    [cell.textLabel setText:[appDelegate.objectForPlain.cities objectAtIndex:rowIndex]];   //根据行号设置文本
    [cell.detailTextLabel setText:[appDelegate.objectForPlain.details objectAtIndex:rowIndex]];    //设置详细文本
    
    NSInteger imgIndex = (arc4random() % 3) + 1;
    NSLog(@"%ld", (long)imgIndex);
    switch (imgIndex) {
        case 1:
            [cell.imageView setImage:[UIImage imageNamed:@"/Users/bytedance/Desktop/Bytedance/iOS_Test/UITableViewTest/UITableViewTest/pic1.jpeg"]];
            break;
        case 2:
            [cell.imageView setImage:[UIImage imageNamed:@"/Users/bytedance/Desktop/Bytedance/iOS_Test/UITableViewTest/UITableViewTest/pic2.jpeg"]];
            break;
        case 3:
            [cell.imageView setImage:[UIImage imageNamed:@"/Users/bytedance/Desktop/Bytedance/iOS_Test/UITableViewTest/UITableViewTest/pic3.jpeg"]];
            break;
            
        default:
            break;
    }
        
    [cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];    //设置附加按钮样式
    /*  AccessoryType参数如下：
     UITableViewCellAccessoryNone   无样式
     UITableViewCellAccessoryDisclosureIndicator    灰色小箭头
     UITableViewCellAccessoryDetailDisclosureButton     感叹号+小箭头
     UITableViewCellAccessoryDetailButton   感叹号
     UITableViewCellAccessoryCheckmark      蓝色勾
     */
    
    return cell;
}

//@optional，使用分组视图时为required
//返回表格分区数
-(NSInteger) numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

//@optional
//返回每组头标题名称
-(NSString*) tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return @"Section begin";
}

//@optional
//返回每组尾标题名称
-(NSString*) tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section {
    return @"Section end";
}

//@optional
//返回左滑出现的文本
-(NSString*) tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath {
    return @"Delete";
}

//@optional
//点击左滑文本之后的调用方法（和上面的方法配套使用）
-(void) tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    [appDelegate.objectForPlain.cities removeObjectAtIndex:indexPath.row];     //从数据源处删除
    
    [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];   //从视图列表中删除
}

//@optional
//退出编辑模式时调用的方法
-(void) tableView:(UITableView *)tableView didEndEditingRowAtIndexPath:(NSIndexPath *)indexPath {
    
}

-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    DetailViewController* detailController = [[DetailViewController alloc] init];
    detailController.delegate = self;
    [detailController setEditingIndexPath:indexPath];
    [detailController setTableType:1];
    [self presentViewController:detailController animated:YES completion:nil];
}

#pragma mark - DetailViewControllerDelegate

- (void)detailViewControllerDidChange:(DetailViewController *)viewController {
    [self.plainTableView reloadData];
}

#pragma mark - method

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
