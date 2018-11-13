//
//  DBNThirdViewController.m
//  DoubleNavigationController_Example
//
//  Created by Yao Li on 2018/11/13.
//  Copyright © 2018 yao.li. All rights reserved.
//

#import "DBNThirdViewController.h"
#import <DoubleNavigationController/DoubleNavigationControllerProtocol.h>

@interface DBNThirdViewController () <DoubleNavigationControllerProtocol>

@end

@implementation DBNThirdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor brownColor];
}

- (void)dbn_configNavigationController:(UINavigationController *)navigationController {
    [self.navigationController setNavigationBarHidden:NO animated:NO];
    self.navigationController.navigationBar.barTintColor = [UIColor cyanColor];
}

@end
