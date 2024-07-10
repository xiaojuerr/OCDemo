//
//  subscriber2.h
//  NSNotificationCenter
//
//  Created by Theo on 2024/7/3.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Subscriber2 : NSObject
-(void)startObservingNotification;
-(void)stopObservingNotification;
@end

NS_ASSUME_NONNULL_END
