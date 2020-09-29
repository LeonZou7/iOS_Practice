//
//  ScrollViewController.m
//  UITableViewTest
//
//  Created by Leon Zou on 2020/9/20.
//

#import "ScrollViewController.h"
#import "PlainViewController.h"
#import "GroupViewController.h"

@interface ScrollViewController ()

@end

@implementation ScrollViewController

- (instancetype)init {
    self = [super init];
    if (self) {
        self.tabBarItem.title = @"Scroll";
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    [scrollView setBackgroundColor:[UIColor lightGrayColor]];
    [scrollView setContentSize:CGSizeMake(self.view.bounds.size.width * 2, self.view.bounds.size.height)];
    [scrollView setPagingEnabled:YES];
    
    // TODO: replace these views with grouped and plain table view ------ WIP
//    UIView *view1 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, scrollView.bounds.size.width, scrollView.bounds.size.height)];
//    [view1 setBackgroundColor:[UIColor purpleColor]];
//    UIView *view2 = [[UIView alloc] initWithFrame:CGRectMake(self.view.bounds.size.width, 0, scrollView.bounds.size.width, scrollView.bounds.size.height)];
//    [view2 setBackgroundColor:[UIColor greenColor]];
    
    PlainViewController *plainTV = [[PlainViewController alloc] init];
    GroupViewController *groupedTV = [[GroupViewController alloc] init];
    
    UILabel *wipLabel = [[UILabel alloc] initWithFrame:CGRectMake(80, 400, 200, 100)];
    wipLabel.backgroundColor = UIColor.blackColor;
    wipLabel.text = @"WIP";
    
    wipLabel.textAlignment = NSTextAlignmentCenter;
    wipLabel.textColor = UIColor.yellowColor;
    [groupedTV.view addSubview:wipLabel];
    
    [scrollView addSubview:plainTV.view];
    [scrollView addSubview:groupedTV.view];

    [self.view addSubview:scrollView];
}

@end
