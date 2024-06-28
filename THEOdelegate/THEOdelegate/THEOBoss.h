//
//  THEOBoss.h
//  THEOdelegate
//
//  Created by Theo on 2024/6/28.
//

#import <Foundation/Foundation.h>
#import "THEOSec.h"
NS_ASSUME_NONNULL_BEGIN

@interface THEOBoss : NSObject
@property (strong,nonatomic) NSString *name;
@property (strong,nonatomic) THEOSec *sec;
-(void)salary;
@end

NS_ASSUME_NONNULL_END
