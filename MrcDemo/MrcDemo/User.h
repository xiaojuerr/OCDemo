//
//  User.h
//  MrcDemo
//
//  Created by Theo on 2024/7/2.
//

#import <Foundation/Foundation.h>
#import "Account.h"
NS_ASSUME_NONNULL_BEGIN

@interface User : NSObject
@property (nonatomic, retain)NSString *nickName;
@property (nonatomic , assign)THEODate birthday;
@property (nonatomic , retain)Account *account;
@end

NS_ASSUME_NONNULL_END
