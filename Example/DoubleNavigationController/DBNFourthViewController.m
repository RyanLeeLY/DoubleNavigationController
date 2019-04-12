//
//  DBNFourthViewController.m
//  DoubleNavigationController_Example
//
//  Created by Yao Li on 2019/3/29.
//  Copyright © 2019 yao.li. All rights reserved.
//

#import "DBNFourthViewController.h"
#import <DoubleNavigationController/DoubleNavigationControllerProtocol.h>

@interface DBNFourthViewController ()

@end

@implementation DBNFourthViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];

    UIButton *testButton = [[UIButton alloc] initWithFrame:CGRectMake(50, 200, 180, 40)];
    [self.view addSubview:testButton];
    [testButton setTitle:@"Back To Root" forState:UIControlStateNormal];
    [testButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [testButton addTarget:self action:@selector(eventFromButton:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *testButton1 = [[UIButton alloc] initWithFrame:CGRectMake(50, 350, 180, 40)];
    [self.view addSubview:testButton1];
    [testButton1 setTitle:@"Back" forState:UIControlStateNormal];
    [testButton1 setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [testButton1 addTarget:self action:@selector(eventFromButton:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

- (void)eventFromButton:(UIButton *)sender {
    if ([sender.titleLabel.text isEqualToString:@"Back To Root"]) {
        [self.navigationController popToRootViewControllerAnimated:YES];
    } else {
        [self.navigationController popViewControllerAnimated:YES];
    }
}
@end
