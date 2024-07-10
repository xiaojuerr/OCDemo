//
//  Publisher.m
//  NSNotificationCenter
//
//  Created by Theo on 2024/7/3.
//

#import "Publisher.h"
NSString *const kNotificationName = @"MyNotification";
@implementation Publisher
-(void)performSomeAction
{
    [[NSNotificationCenter defaultCenter] postNotificationName:kNotificationName object:self userInfo:nil];
}
@end
