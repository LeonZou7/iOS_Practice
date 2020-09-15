//
//  DetailViewController.h
//  UITableViewTest
//
//  Created by bytedance on 2020/9/3.
//  Copyright © 2020 bytedance. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DetailViewController;

@protocol DetailViewControllerDelegate <NSObject>

//difference between @optional and @required ->  The one takes the delegate must override the required, the optional is optional
@optional
- (void)detailViewControllerDidChange:(DetailViewController *)viewController;

@required

@end
 
@interface DetailViewController : UIViewController

@property(nonatomic) NSInteger tableType;   // 1 for plain, 2 for grouped
@property(nonatomic, strong) NSIndexPath* editingIndexPath;

//why weak   ->  To avoid circle reference
@property (nonatomic, weak) id<DetailViewControllerDelegate> delegate;

@end
