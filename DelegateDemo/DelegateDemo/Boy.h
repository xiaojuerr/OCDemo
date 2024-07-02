//
//  Boy.h
//  DelegateDemo
//
//  Created by Theo on 2024/7/2.
//

#import <Foundation/Foundation.h>
#import "GFProcotol.h"
NS_ASSUME_NONNULL_BEGIN

@interface Boy : NSObject
@property (nonatomic , strong)NSString *name;
@property (nonatomic ,assign)int age;
@property (nonatomic, assign)int money;
@property (nonatomic, weak) id<GFProcotol> girlFriend;

-(void)talk;
@end

NS_ASSUME_NONNULL_END
