//
//  DBNViewController.m
//  DoubleNavigationController
//
//  Created by yao.li on 11/12/2018.
//  Copyright (c) 2018 yao.li. All rights reserved.
//

#import "DBNViewController.h"
#import "DBNSecondViewController.h"
#import <DoubleNavigationController/DoubleNavigationControllerProtocol.h>

@interface DBNViewController () <DoubleNavigationControllerProtocol>

@end

@implementation DBNViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor orangeColor];
    self.title = @"Main";
    
    UIButton *testButton = [[UIButton alloc] initWithFrame:CGRectMake(50, 200, 100, 40)];
    [self.view addSubview:testButton];
    [testButton setTitle:@"next" forState:UIControlStateNormal];
    [testButton addTarget:self action:@selector(eventFromButton:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)dbn_configNavigationController:(UINavigationController *)navigationController navigationItem:(UINavigationItem *)navigationItem {
    [navigationController setNavigationBarHidden:NO animated:NO];
    navigationController.navigationBar.barTintColor = [UIColor grayColor];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

- (void)eventFromButton:(UIButton *)sender {
    DBNSecondViewController *controller = [[DBNSecondViewController alloc] init];
    [self.navigationController pushViewController:controller animated:YES];
}

@end
