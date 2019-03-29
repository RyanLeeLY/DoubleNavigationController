//
//  DBNSecondViewController.m
//  DoubleNavigationController_Example
//
//  Created by Yao Li on 2018/11/12.
//  Copyright © 2018 yao.li. All rights reserved.
//

#import "DBNSecondViewController.h"
#import <DoubleNavigationController/UIViewController+DoubleNavigationController.h>
#import "DBNThirdViewController.h"

@interface DBNSecondViewController () <DoubleNavigationControllerProtocol>

@end

@implementation DBNSecondViewController
- (void)dealloc {
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor greenColor];
    
    UIButton *testButton = [[UIButton alloc] initWithFrame:CGRectMake(50, 200, 100, 40)];
    [self.view addSubview:testButton];
    [testButton setTitle:@"next" forState:UIControlStateNormal];
    [testButton addTarget:self action:@selector(eventFromButton:) forControlEvents:UIControlEventTouchUpInside];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self dbn_performBatchUpdates:^(UINavigationController * _Nullable navigationController) {
            if (navigationController) {
                navigationController.navigationBar.barTintColor = [UIColor blueColor];
            }
        }];
    });
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

- (void)dbn_configNavigationController:(UINavigationController *)navigationController {
    [navigationController setNavigationBarHidden:NO animated:NO];
    navigationController.navigationBar.barTintColor = [UIColor whiteColor];
    navigationController.navigationBar.tintColor = [UIColor purpleColor];
    navigationController.navigationBar.titleTextAttributes = @{NSFontAttributeName: [UIFont systemFontOfSize:20], NSForegroundColorAttributeName: [UIColor redColor]};
}

- (void)dbn_configNavigationItem:(UINavigationItem *)navigationItem {
    UIBarButtonItem *btnItem = [[UIBarButtonItem alloc] initWithTitle:@"Next" style:UIBarButtonItemStylePlain target:self action:@selector(eventFromButton:)];
    navigationItem.rightBarButtonItem = btnItem;
    navigationItem.title = @"Hello";
}

- (void)eventFromButton:(UIButton *)sender {
    DBNThirdViewController *controller = [[DBNThirdViewController alloc] init];
    [self.navigationController pushViewController:controller animated:YES];
}

@end
