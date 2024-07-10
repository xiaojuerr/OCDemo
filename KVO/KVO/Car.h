//
//  Car.h
//  KVO
//
//  Created by Theo on 2024/7/3.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Car : NSObject
@property (nonatomic, strong) NSString *brand;
@property (nonatomic, assign) float speed;
@end

NS_ASSUME_NONNULL_END
