//
//  DoubleNavigationControllerProtocol.h
//  DoubleNavigationController
//
//  Created by Yao Li on 2018/11/13.
//

#import <UIKit/UIKit.h>

@protocol DoubleNavigationControllerProtocol <NSObject>
@optional
- (void)dbn_configNavigationController:(UINavigationController *)navigationController;
- (void)dbn_configNavigationItem:(UINavigationItem *)navigationItem;
@end
