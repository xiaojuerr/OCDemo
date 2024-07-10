//
//  subscriber2.m
//  NSNotificationCenter
//
//  Created by Theo on 2024/7/3.
//
#import "Publisher.h"
#import "Subscriber2.h"

@implementation Subscriber2
-(instancetype)init
{
    self = [super init];
    if(self){
        [self startObservingNotification];
    }
    return self;
}
-(void)startObservingNotification
{
    NSLog(@"sub2 staring observing");
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(sayHello:) name:kNotificationName object:nil];
}
-(void)stopObservingNotification
{
    NSLog(@"sub2 stoped");
    [[NSNotificationCenter defaultCenter] removeObserver:self name:kNotificationName object:nil];
}
-(void)sayHello:(NSNotification *)notification
{
    NSLog(@"%@ say Hello",notification.name);
}
@end
