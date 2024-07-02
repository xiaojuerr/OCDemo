//
//  main.m
//  MrcDemo
//
//  Created by Theo on 2024/7/2.
//

#import <Foundation/Foundation.h>
#import "MicroBlog.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        //创建账户
        Account *a1 = [[Account new] autorelease];
        a1.userName =  @"Zhangsan";
        a1.password = @"123456";
        a1.registDate = (THEODate){2024,7,2};
        
        User *xj = [[User new] autorelease];
        xj.nickName = @"theo";
        xj.birthday = (THEODate){1999,11,18};
        xj.account = a1;
        
        MicroBlog *b1 = [[MicroBlog new] autorelease];
        b1.content = @"happy!";
        b1.imgUrl = @" ";
        b1.user = xj;
        b1.zhuanFaBlog = nil;

        Account *a2 = [[Account new] autorelease];
        a2.userName =  @"liwei";
        a2.password = @"123456";
        a2.registDate = (THEODate){2024,7,2};
        
        User *xj2 = [[User new] autorelease];
        xj2.nickName = @"theo1";
        xj2.birthday = (THEODate){1999,11,18};
        xj2.account = a2;
        
        MicroBlog *b2 = [[MicroBlog new] autorelease];
        b2.content = @"happy!!!";
        b2.imgUrl = @" ";
        b2.user = xj2;
        b2.zhuanFaBlog = nil;
    }
    return 0;
}
