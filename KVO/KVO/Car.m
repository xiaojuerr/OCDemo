//
//  Car.m
//  KVO
//
//  Created by Theo on 2024/7/3.
//

#import "Car.h"

@implementation Car
- (instancetype)init {
    self = [super init];
    if (self) {
        _speed = 0;
    }
    return self;
}
@end
