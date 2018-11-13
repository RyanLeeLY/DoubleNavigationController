//
//  DNBMethodSwizzle.h
//  DoubleNavigationController
//
//  Created by Yao Li on 2018/11/13.
//

#import <Foundation/Foundation.h>

extern void DBNSwizzleMethod(Class originalCls, SEL originalSelector, Class swizzledCls, SEL swizzledSelector);

