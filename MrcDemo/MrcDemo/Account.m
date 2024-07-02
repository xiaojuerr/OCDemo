//
//  Account.m
//  MrcDemo
//
//  Created by Theo on 2024/7/2.
//

#import "Account.h"

@implementation Account
-(void)dealloc
{
    NSLog(@"%@账户已销毁",self.userName);
    [_userName release];
    [_password release];
    [super dealloc];
}
@end
