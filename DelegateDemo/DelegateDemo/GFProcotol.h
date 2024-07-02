//
//  GFProcotol.h
//  DelegateDemo
//
//  Created by Theo on 2024/7/2.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol GFProcotol <NSObject>
@required
-(void)wash;
-(void)cook;

@optional
-(void)job;
@end

NS_ASSUME_NONNULL_END
