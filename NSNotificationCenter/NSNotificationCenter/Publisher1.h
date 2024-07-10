//
//  Publisher1.h
//  NSNotificationCenter
//
//  Created by Theo on 2024/7/3.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
extern  NSString *const Name;
@interface Publisher1 : NSObject
-(void)performYourAction:(NSDictionary *)info;
@end

NS_ASSUME_NONNULL_END
