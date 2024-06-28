//
//  secretary.h
//  THEOdelegate
//
//  Created by Theo on 2024/6/28.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol SecDelegate <NSObject>
-(void)talk;
-(void)call;
@end

NS_ASSUME_NONNULL_END
