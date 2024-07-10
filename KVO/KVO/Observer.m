//
//  Observer.m
//  KVO
//
//  Created by Theo on 2024/7/3.
//

#import "Observer.h"

@implementation Observer
- (instancetype)init {
    self = [super init];
    if (self) {
        _car = [[Car alloc] init];
        // 注册观察者
        [self.car addObserver:self forKeyPath:@"speed" options:NSKeyValueObservingOptionNew context:NULL];
    }
    return self;
}

// 观察者实现 observeValueForKeyPath 方法来处理被观察属性的变化通知
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    if ([keyPath isEqualToString:@"speed"]) {
        // 处理属性变化通知
        NSLog(@"Speed has changed: %@", change[NSKeyValueChangeNewKey]);
    }
}

- (void)dealloc {
    // 移除观察者
    [self.car removeObserver:self forKeyPath:@"speed"];
}
@end
