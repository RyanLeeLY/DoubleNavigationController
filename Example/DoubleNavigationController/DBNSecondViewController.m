//
//  DBNSecondViewController.m
//  DoubleNavigationController_Example
//
//  Created by Yao Li on 2018/11/12.
//  Copyright © 2018 yao.li. All rights reserved.
//

#import "DBNSecondViewController.h"
#import <DoubleNavigationController/DoubleNavigationControllerProtocol.h>
#import "DBNThirdViewController.h"

@interface DBNSecondViewController () <DoubleNavigationControllerProtocol>

@end

@implementation DBNSecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor greenColor];
    self.title = @"Second";
    
    UIButton *testButton = [[UIButton alloc] initWithFrame:CGRectMake(50, 200, 100, 40)];
    [self.view addSubview:testButton];
    [testButton setTitle:@"next" forState:UIControlStateNormal];
    [testButton addTarget:self action:@selector(eventFromButton:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

- (void)dbn_configNavigationController:(UINavigationController *)navigationController {
    [self.navigationController setNavigationBarHidden:NO animated:NO];
    self.navigationController.navigationBar.barTintColor = [UIColor whiteColor];
}

- (void)eventFromButton:(UIButton *)sender {
    DBNThirdViewController *controller = [[DBNThirdViewController alloc] init];
    [self.navigationController pushViewController:controller animated:YES];
}

@end
