//
//  Pig.h
//  DelegateDemo
//
//  Created by Theo on 2024/7/2.
//

#import <Foundation/Foundation.h>
#import "GFProcotol.h"
NS_ASSUME_NONNULL_BEGIN

@interface Pig : NSObject <GFProcotol>
@property (strong , nonatomic) NSString *name;
@end

NS_ASSUME_NONNULL_END
