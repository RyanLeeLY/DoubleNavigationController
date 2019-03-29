//
//  DBNNavigationDecoration.m
//  DoubleNavigationController
//
//  Created by Yao Li on 2019/3/29.
//

#import "DBNNavigationDecoration.h"

@interface DBNNavigationDecoration ()
@property (weak, nonatomic) UINavigationController *navigationController;
@property (strong, nonatomic) NSMutableArray<DBNNavigationDecorationHandler> *updatesArray;
@end

@implementation DBNNavigationDecoration
- (instancetype)initWithNavigationController:(UINavigationController *)navigationController {
    self = [self init];
    if (self) {
        _navigationController = navigationController;
    }
    return self;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        _updatesArray = [NSMutableArray array];
    }
    return self;
}

- (void)addUpdates:(DBNNavigationDecorationHandler)updates {
    if (updates) {
        [_updatesArray addObject:updates];
    }
}

- (void)reset:(DBNNavigationDecorationHandler)reset {
    [_updatesArray removeAllObjects];
    if (reset) {
        [_updatesArray addObject:reset];
    }
}

- (void)doDecorate {
    __weak typeof(self) _self = self;
    [_updatesArray enumerateObjectsUsingBlock:^(DBNNavigationDecorationHandler  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        __strong typeof(_self) self = _self;
        obj(self->_navigationController);
    }];
}
@end
