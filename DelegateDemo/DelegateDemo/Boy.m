//
//  Boy.m
//  DelegateDemo
//
//  Created by Theo on 2024/7/2.
//

#import "Boy.h"

@implementation Boy
-(void)talk
{
    NSLog(@"come back!");
    [_girlFriend wash];
    [_girlFriend cook];
}
@end
