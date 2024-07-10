//
//  Publisher1.m
//  NSNotificationCenter
//
//  Created by Theo on 2024/7/3.
//

#import "Publisher1.h"
NSString *const Name = @"mypublisher";

@implementation Publisher1
-(void)performYourAction:(NSDictionary *)info
{
    [[NSNotificationCenter defaultCenter] postNotificationName:Name  object:self userInfo:info];
}
@end
