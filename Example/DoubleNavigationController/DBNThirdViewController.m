//
//  DBNThirdViewController.m
//  DoubleNavigationController_Example
//
//  Created by Yao Li on 2018/11/13.
//  Copyright © 2018 yao.li. All rights reserved.
//

#import "DBNThirdViewController.h"
#import <DoubleNavigationController/DoubleNavigationControllerProtocol.h>
#import "DBNFourthViewController.h"

@interface DBNThirdViewController () <DoubleNavigationControllerProtocol>

@end

@implementation DBNThirdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor brownColor];
    
    UIButton *testButton = [[UIButton alloc] initWithFrame:CGRectMake(50, 200, 100, 40)];
    [self.view addSubview:testButton];
    [testButton setTitle:@"next" forState:UIControlStateNormal];
    [testButton addTarget:self action:@selector(eventFromButton:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)dbn_configNavigationController:(UINavigationController *)navigationController {
    [navigationController setNavigationBarHidden:NO animated:NO];
    navigationController.navigationBar.barTintColor = [UIColor cyanColor];
}

- (void)dbn_configNavigationItem:(UINavigationItem *)navigationItem {
    UIBarButtonItem *btnItem = [[UIBarButtonItem alloc] initWithTitle:@"取消" style:UIBarButtonItemStylePlain target:self action:@selector(eventFromButton:)];
    navigationItem.rightBarButtonItem = btnItem;
    navigationItem.title = @"Bye";
}

- (void)eventFromButton:(UIButton *)sender {
    if ([sender isKindOfClass:[UIBarButtonItem class]]) {
        [self.navigationController popToRootViewControllerAnimated:YES];
    } else if ([sender isKindOfClass:[UIButton class]]) {
        [self.navigationController pushViewController:[[DBNFourthViewController alloc] init] animated:YES];
    }
}
@end
