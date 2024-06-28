//
//  THEOBoss.h
//  THEOdelegate
//
//  Created by Theo on 2024/6/28.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface THEOBoss : NSObject
@property (strong,nonatomic) NSString *name;
-(void)talk;
-(void)call;
-(void)salary;
@end

NS_ASSUME_NONNULL_END
