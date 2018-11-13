//
//  UINavigationController+DoubleNavigationController.m
//  DoubleNavigationController
//
//  Created by Yao Li on 2018/11/13.
//

#import "UINavigationController+DoubleNavigationController.h"
#import "UIViewController+DoubleNavigationController.h"
#import "DNBMethodSwizzle.h"

@implementation UINavigationController (DoubleNavigationController)
+ (void)load {
    static dispatch_once_t dbnOnceToken;
    dispatch_once(&dbnOnceToken, ^{
        Class clz = [self class];
        DBNSwizzleMethod(clz, @selector(pushViewController:animated:), clz, @selector(dbn_pushViewController:animated:));
        DBNSwizzleMethod(clz, @selector(popViewControllerAnimated:), clz, @selector(dbn_popViewControllerAnimated:));
    });
}

- (void)dbn_pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    UIViewController *disappearingViewController = self.viewControllers.lastObject;
    if (!disappearingViewController) {
        return [self dbn_pushViewController:viewController animated:animated];
    }
    
    [self setDbn_secondNavigationBarHidden:NO];
    [self dbn_pushViewController:viewController animated:animated];
}

- (UIViewController *)dbn_popViewControllerAnimated:(BOOL)animated {
    UIViewController *disappearingViewController = self.viewControllers.lastObject;
    if (!disappearingViewController) {
        return [self dbn_popViewControllerAnimated:animated];
    }
    
    [self setDbn_secondNavigationBarHidden:NO];
    return [self dbn_popViewControllerAnimated:animated];
}
@end
