//
//  Subscriber3.m
//  NSNotificationCenter
//
//  Created by Theo on 2024/7/3.
//

#import "Subscriber3.h"

@implementation Subscriber3
-(void)startObservingNotification
{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(handleInt:) name:Name object:nil];
}
-(void)stopObservingNotification
{
    [[NSNotificationCenter defaultCenter]removeObserver:self name:Name object:nil];
}
-(void)handleInt:(NSNotification *)notification
{
    NSLog(@"%@",notification.userInfo);
    
}
-(instancetype)init
{
    self = [super init];
    if(self)
    {
        [self startObservingNotification];
    }
    return self;
}
@end
