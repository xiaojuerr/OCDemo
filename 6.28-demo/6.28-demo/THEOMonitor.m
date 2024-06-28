//
//  THEOMonitor.m
//  6.28-demo
//
//  Created by Theo on 2024/6/28.
//

#import "THEOMonitor.h"

@implementation THEOMonitor
-(void)notice
{
    NSLog(@"%@ notice all!",self.name);
}
-(void)standup
{
    NSLog(@"%@ say standup",self.name);
}
@end
