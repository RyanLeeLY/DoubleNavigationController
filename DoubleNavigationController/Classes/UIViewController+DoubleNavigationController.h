//
//  UIViewController+DoubleNavigationController.h
//  DoubleNavigationController
//
//  Created by Yao Li on 2018/11/12.
//

#import <UIKit/UIKit.h>
#import "DoubleNavigationControllerProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@interface UIViewController (DoubleNavigationController)
- (void)dbn_setNeedsUpdateNavigation;
- (void)dbn_performBatchUpdates:(void(^)(UINavigationController * _Nullable navigationController))updates;
@end

NS_ASSUME_NONNULL_END
