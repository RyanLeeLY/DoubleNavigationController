#ifdef __OBJC__
#import <UIKit/UIKit.h>
#else
#ifndef FOUNDATION_EXPORT
#if defined(__cplusplus)
#define FOUNDATION_EXPORT extern "C"
#else
#define FOUNDATION_EXPORT extern
#endif
#endif
#endif

#import "DNBMethodSwizzle.h"
#import "DoubleNavigationControllerProtocol.h"
#import "UINavigationController+DoubleNavigationController.h"
#import "UIViewController+DoubleNavigationController.h"

FOUNDATION_EXPORT double DoubleNavigationControllerVersionNumber;
FOUNDATION_EXPORT const unsigned char DoubleNavigationControllerVersionString[];

