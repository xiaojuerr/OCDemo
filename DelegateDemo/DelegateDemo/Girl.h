//
//  Girl.h
//  DelegateDemo
//
//  Created by Theo on 2024/7/2.
//

#import <Foundation/Foundation.h>
#import "GFProcotol.h"
NS_ASSUME_NONNULL_BEGIN

@interface Girl : NSObject<GFProcotol>
@property (nonatomic,strong)NSString *name;
@end

NS_ASSUME_NONNULL_END
