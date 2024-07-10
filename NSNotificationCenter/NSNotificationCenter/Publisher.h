//
//  Publisher.h
//  NSNotificationCenter
//
//  Created by Theo on 2024/7/3.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
extern NSString *const kNotificationName;
@interface Publisher : NSObject
-(void)performSomeAction;
@end

NS_ASSUME_NONNULL_END
