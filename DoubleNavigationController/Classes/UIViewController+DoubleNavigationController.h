//
//  UIViewController+DoubleNavigationController.h
//  DoubleNavigationController
//
//  Created by Yao Li on 2018/11/12.
//

#import <UIKit/UIKit.h>
#import "DoubleNavigationControllerProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@interface UIViewController (DoubleNavigationController) <DoubleNavigationControllerProtocol>
@property (strong, nonatomic) UIView *dbn_fakeNavigationBar;
@property (assign, nonatomic) BOOL dbn_viewAppeared;

- (void)setDbn_secondNavigationBarHidden:(BOOL)hidden;
@end

NS_ASSUME_NONNULL_END
