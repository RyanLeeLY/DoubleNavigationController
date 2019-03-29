//
//  DBNNavigationDecoration.h
//  DoubleNavigationController
//
//  Created by Yao Li on 2019/3/29.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^DBNNavigationDecorationHandler)(UINavigationController * _Nullable navigationController);

@interface DBNNavigationDecoration : NSObject
- (instancetype)initWithNavigationController:(UINavigationController * _Nullable)navigationController;

- (void)addUpdates:(DBNNavigationDecorationHandler _Nullable)updates;
- (void)reset:(DBNNavigationDecorationHandler _Nullable)reset;

- (void)doDecorate;
@end

NS_ASSUME_NONNULL_END
