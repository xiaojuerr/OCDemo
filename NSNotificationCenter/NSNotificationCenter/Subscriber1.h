//
//  Subsriber.h
//  NSNotificationCenter
//
//  Created by Theo on 2024/7/3.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Subscriber1 : NSObject
-(void)startObservingNotification;
-(void)stopObservingNotification;
-(void)handleNotification:(NSNotification *)notification;
@end

NS_ASSUME_NONNULL_END
