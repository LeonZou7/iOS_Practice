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
    PlainViewController *plainTV = [[PlainViewController alloc] init];
    GroupViewController *groupedTV = [[GroupViewController alloc] init];
    
    // TODO: bugfix - gesture conflict!
    UISwipeGestureRecognizer *swipeLeftGR = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeToAnotherView:)];
    swipeLeftGR.direction = UISwipeGestureRecognizerDirectionLeft;
    [scrollView addGestureRecognizer:swipeLeftGR];
    
    UISwipeGestureRecognizer *swipeRightGR = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeToAnotherView:)];
    swipeRightGR.direction = UISwipeGestureRecognizerDirectionLeft;
    [scrollView addGestureRecognizer:swipeRightGR];
    
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

#pragma mark - Swipe Gesture Recognizer

// TODO: bugfix - gesture conflict!
- (void)swipeToAnotherView:(UISwipeGestureRecognizer *)swipeGR {
    if (swipeGR.direction == UISwipeGestureRecognizerDirectionLeft) {
        NSLog(@"from scrollVC: swipe to left!");
        [self.delegate switchToLeftViewFromIndex:self.tabBarController.selectedIndex];
    } else if (swipeGR.direction == UISwipeGestureRecognizerDirectionRight) {
        NSLog(@"from scrollVC: swipe to right!");
        [self.delegate switchToRightViewFromIndex:self.tabBarController.selectedIndex];
    }
}

@end
