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
    self.view.backgroundColor = [UIColor lightGrayColor];
    
    UIButton *testButton = [[UIButton alloc] initWithFrame:CGRectMake(50, 200, 100, 40)];
    [self.view addSubview:testButton];
    [testButton setTitle:@"back" forState:UIControlStateNormal];
    [testButton addTarget:self action:@selector(eventFromButton:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:YES];

}

- (void)eventFromButton:(UIButton *)sender {
    [self.navigationController popViewControllerAnimated:YES];
}
@end
