//
//  action.h
//  THEOProtocol
//
//  Created by Theo on 2024/6/28.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
//协议时特殊的类，只有申明部分，没有实现部分
@protocol action <NSObject>
@required
-(void)say;
@optional
-(void)song;
@end

NS_ASSUME_NONNULL_END
