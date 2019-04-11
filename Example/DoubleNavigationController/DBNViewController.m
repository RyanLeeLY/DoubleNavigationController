//
//  DBNViewController.m
//  DoubleNavigationController
//
//  Created by yao.li on 11/12/2018.
//  Copyright (c) 2018 yao.li. All rights reserved.
//

#import "DBNViewController.h"
#import "DBNSecondViewController.h"
#import "DBNThirdViewController.h"
#import <DoubleNavigationController/DoubleNavigationControllerProtocol.h>

@interface DBNViewController () <DoubleNavigationControllerProtocol>

@end

@implementation DBNViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"Main";
    
    UIButton *testButton = [[UIButton alloc] initWithFrame:CGRectMake(50, 200, 100, 40)];
    [self.view addSubview:testButton];
    [testButton setTitle:@"Blue" forState:UIControlStateNormal];
    [testButton setTitleColor:[UIColor colorWithRed:1.f/255 green:162.f/255 blue:1 alpha:1] forState:UIControlStateNormal];
    [testButton addTarget:self action:@selector(eventFromButton:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *testButton1 = [[UIButton alloc] initWithFrame:CGRectMake(50, 300, 100, 40)];
    [self.view addSubview:testButton1];
    [testButton1 setTitle:@"Yellow" forState:UIControlStateNormal];
    [testButton1 setTitleColor:[UIColor colorWithRed:248.f/255 green:186.f/255 blue:0 alpha:1] forState:UIControlStateNormal];
    [testButton1 addTarget:self action:@selector(eventFromButton:) forControlEvents:UIControlEventTouchUpInside];
    
    self.navigationController.navigationBar.barTintColor = [UIColor grayColor];

}

- (void)dbn_configNavigationController:(UINavigationController *)navigationController {
//    [navigationController setNavigationBarHidden:NO animated:NO];
}

- (void)dbn_configNavigationItem:(UINavigationItem *)navigationItem {
//    UIBarButtonItem *btnItem = [[UIBarButtonItem alloc] initWithTitle:@"Next" style:UIBarButtonItemStylePlain target:self action:@selector(eventFromButton:)];
//    navigationItem.rightBarButtonItem = btnItem;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

- (void)eventFromButton:(UIButton *)sender {
    if ([sender.titleLabel.text isEqualToString:@"Blue"]) {
        DBNSecondViewController *controller = [[DBNSecondViewController alloc] init];
        [self.navigationController pushViewController:controller animated:YES];
    } else if ([sender.titleLabel.text isEqualToString:@"Yellow"]) {
        DBNThirdViewController *controller = [[DBNThirdViewController alloc] init];
        [self.navigationController pushViewController:controller animated:YES];
    }
}

@end
