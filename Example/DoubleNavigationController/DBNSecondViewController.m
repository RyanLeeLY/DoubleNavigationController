//
//  DBNSecondViewController.m
//  DoubleNavigationController_Example
//
//  Created by Yao Li on 2018/11/12.
//  Copyright © 2018 yao.li. All rights reserved.
//

#import "DBNSecondViewController.h"
#import <DoubleNavigationController/UIViewController+DoubleNavigationController.h>
#import "DBNFourthViewController.h"

@interface DBNSecondViewController () <DoubleNavigationControllerProtocol>

@end

@implementation DBNSecondViewController
- (void)dealloc {
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton *testButton = [[UIButton alloc] initWithFrame:CGRectMake(50, 200, 100, 40)];
    [self.view addSubview:testButton];
    [testButton setTitle:@"Next" forState:UIControlStateNormal];
    [testButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [testButton addTarget:self action:@selector(eventFromButton:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        [self dbn_performBatchUpdates:^(UINavigationController * _Nullable navigationController) {
//            if (navigationController) {
//                navigationController.navigationBarHidden = YES;
//                navigationController.navigationBar.barTintColor = [UIColor purpleColor];
//            }
//        }];
//    });
}

- (void)dbn_configNavigationController:(UINavigationController *)navigationController {
    [navigationController setNavigationBarHidden:NO animated:NO];
    navigationController.navigationBar.barTintColor = [UIColor colorWithRed:1.f/255 green:162.f/255 blue:1 alpha:1];
    navigationController.navigationBar.tintColor = [UIColor whiteColor];
    navigationController.navigationBar.titleTextAttributes = @{NSFontAttributeName: [UIFont systemFontOfSize:20], NSForegroundColorAttributeName: [UIColor redColor]};
}

- (void)dbn_configNavigationItem:(UINavigationItem *)navigationItem {
    UIBarButtonItem *btnItem = [[UIBarButtonItem alloc] initWithTitle:@"取消" style:UIBarButtonItemStylePlain target:self action:@selector(eventFromButton:)];
    navigationItem.rightBarButtonItem = btnItem;
    navigationItem.title = @"Blue";
}

- (void)eventFromButton:(UIButton *)sender {
    if ([sender isKindOfClass:[UIBarButtonItem class]]) {
        [self.navigationController popToRootViewControllerAnimated:YES];
    } else if ([sender isKindOfClass:[UIButton class]]) {
        [self.navigationController pushViewController:[[DBNFourthViewController alloc] init] animated:YES];
    }
}

@end
