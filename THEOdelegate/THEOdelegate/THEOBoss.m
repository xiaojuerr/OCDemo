//
//  THEOBoss.m
//  THEOdelegate
//
//  Created by Theo on 2024/6/28.
//

#import "THEOBoss.h"

@implementation THEOBoss
-(void)talk
{
    NSLog(@"%@ is talking",self.name);
}
-(void)call
{
    NSLog(@"%@ is calling",self.name);
}
-(void)salary
{
    NSLog(@"%@ is paying",self.name);
}
@end
