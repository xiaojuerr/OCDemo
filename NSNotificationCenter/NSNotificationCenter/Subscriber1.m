//
//  Subsriber.m
//  NSNotificationCenter
//
//  Created by Theo on 2024/7/3.
//

#import "Subscriber1.h"
#import "Publisher.h"
@implementation Subscriber1
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
    NSLog(@"sub1 staring observing");
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(handleNotification:) name:kNotificationName object:nil];
}
-(void)stopObservingNotification
{
    NSLog(@"stoped subscribe");
    [[NSNotificationCenter defaultCenter] removeObserver:self name:kNotificationName object:nil];
}
-(void)handleNotification:(NSNotification *)notification
{
    NSLog(@"Recived notification: %@",notification.name);
}
-(void)dealloc
{
    [self stopObservingNotification];
}
@end
