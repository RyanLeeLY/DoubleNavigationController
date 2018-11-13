//
//  UIViewController+DoubleNavigationController.m
//  DoubleNavigationController
//
//  Created by Yao Li on 2018/11/12.
//

#import "UIViewController+DoubleNavigationController.h"
#import <objc/runtime.h>
#import "DNBMethodSwizzle.h"

@implementation UIViewController (DoubleNavigationController) 
+ (void)load {
    static dispatch_once_t dbnOnceToken;
    dispatch_once(&dbnOnceToken, ^{
        Class clz = [self class];
        DBNSwizzleMethod(clz, @selector(viewDidLoad), clz, @selector(dbn_viewDidLoad));
        DBNSwizzleMethod(clz, @selector(viewWillAppear:), clz, @selector(dbn_viewWillAppear:));
        DBNSwizzleMethod(clz, @selector(viewWillLayoutSubviews), clz, @selector(dbn_viewWillLayoutSubviews));
        DBNSwizzleMethod(clz, @selector(viewDidAppear:), clz, @selector(dbn_viewDidAppear:));
        DBNSwizzleMethod(clz, @selector(viewWillDisappear:), clz, @selector(dbn_viewWillDisappear:));
    });
}

#pragma mark - Method Swizzling
- (void)dbn_viewDidLoad {
    [self dbn_viewDidLoad];
}

- (void)dbn_viewWillAppear:(BOOL)animated {
    [self dbn_viewWillAppear:animated];
    
    if (!self.navigationController) {
        return;
    }
    
    if (!self.dbn_viewAppeared) {
        if ([self respondsToSelector:@selector(dbn_configNavigationController:)]) {
            [self dbn_configNavigationController:self.navigationController];
        }
        self.dbn_viewAppeared = YES;
    }
    
}

- (void)dbn_viewWillLayoutSubviews {
    [self dbn_viewWillLayoutSubviews];
    
    if (!self.navigationController) {
        return;
    }
    
    [self setDbn_secondNavigationBarHidden:NO];
    [self.navigationController setNavigationBarHidden:YES animated:NO];
}

- (void)dbn_viewDidAppear:(BOOL)animated {
    [self dbn_viewDidAppear:animated];
    
    if (!self.navigationController) {
        return;
    }
    [self setDbn_secondNavigationBarHidden:YES];

    if ([self respondsToSelector:@selector(dbn_configNavigationController:)]) {
        [self dbn_configNavigationController:self.navigationController];
    }
}

- (void)dbn_viewWillDisappear:(BOOL)animated {
    [self dbn_viewWillDisappear:animated];

    if (!self.navigationController) {
        return;
    }
    
    [self setDbn_secondNavigationBarHidden:NO];
    [self.navigationController setNavigationBarHidden:YES animated:NO];
}

- (void)setDbn_secondNavigationBarHidden:(BOOL)hidden {
    if (!self.navigationController) {
        return;
    }
    
    if (!objc_getAssociatedObject(self, @selector(dbn_fakeNavigationBar))) {
        NSData *data = [NSKeyedArchiver archivedDataWithRootObject:self.navigationController.navigationBar];
        UIView *dbn_fakeNavigationBar = [NSKeyedUnarchiver unarchiveObjectWithData:data];
        objc_setAssociatedObject(self, @selector(dbn_fakeNavigationBar), dbn_fakeNavigationBar, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        [self.view addSubview:self.dbn_fakeNavigationBar];
    }
    
    [self.view bringSubviewToFront:self.dbn_fakeNavigationBar];
    self.dbn_fakeNavigationBar.hidden = hidden;

}

#pragma mark - setter & getter
- (UIView *)dbn_fakeNavigationBar {
    return objc_getAssociatedObject(self, @selector(dbn_fakeNavigationBar));
}

- (void)setDbn_fakeNavigationBar:(UIView *)dbn_fakeNavigationBar {
    objc_setAssociatedObject(self, @selector(dbn_fakeNavigationBar), dbn_fakeNavigationBar, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (BOOL)dbn_viewAppeared {
    return [objc_getAssociatedObject(self, @selector(dbn_viewAppeared)) boolValue];
}

- (void)setDbn_viewAppeared:(BOOL)dbn_viewAppeared {
    objc_setAssociatedObject(self, @selector(dbn_viewAppeared), [NSNumber numberWithBool:dbn_viewAppeared], OBJC_ASSOCIATION_RETAIN);
}
@end
