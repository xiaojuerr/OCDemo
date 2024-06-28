//
//  THEOMonitor.h
//  6.28-demo
//
//  Created by Theo on 2024/6/28.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol THEOMonitorDel <NSObject>
-(void)notice;
-(void)standup;
@end

NS_ASSUME_NONNULL_END
