//
//  Observer.h
//  KVO
//
//  Created by Theo on 2024/7/3.
//

#import <Foundation/Foundation.h>
#import "Car.h"
NS_ASSUME_NONNULL_BEGIN

@interface Observer : NSObject
@property (nonatomic, strong) Car *car;
@end

NS_ASSUME_NONNULL_END
