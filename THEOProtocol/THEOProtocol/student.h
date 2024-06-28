//
//  student.h
//  THEOProtocol
//
//  Created by Theo on 2024/6/28.
//

#import <Foundation/Foundation.h>
#import "action.h"
#import "action1.h"
NS_ASSUME_NONNULL_BEGIN

@interface student : NSObject<action,action1>
@property (strong,nonatomic) NSString *name;
@end

NS_ASSUME_NONNULL_END
