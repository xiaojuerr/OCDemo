//
//  MicroBlog.h
//  MrcDemo
//
//  Created by Theo on 2024/7/2.
//

#import <Foundation/Foundation.h>
#import "User.h"
NS_ASSUME_NONNULL_BEGIN

@interface MicroBlog : NSObject
@property (nonatomic , retain)NSString *content;
@property (nonatomic , retain)NSString *imgUrl;
@property (nonatomic , assign)THEODate *sendTime;
@property (nonatomic , retain)User *user;

@property (nonatomic , retain)MicroBlog *zhuanFaBlog;
@end

NS_ASSUME_NONNULL_END
