//
//  THEOSec.h
//  THEOdelegate
//
//  Created by Theo on 2024/6/28.
//

#import <Foundation/Foundation.h>
#import "SecDelegate.h"
NS_ASSUME_NONNULL_BEGIN

@interface THEOSec : NSObject<SecDelegate>
@property (strong, nonatomic) NSString *name;
@end

NS_ASSUME_NONNULL_END
