//
//  User.m
//  MrcDemo
//
//  Created by Theo on 2024/7/2.
//

#import "User.h"

@implementation User
-(void)dealloc
{
    NSLog(@"用户已销毁");
    [_nickName release];
    [_account release];
    [super dealloc];
}
@end
