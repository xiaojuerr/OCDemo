//
//  THEOSec.m
//  THEOdelegate
//
//  Created by Theo on 2024/6/28.
//

#import "THEOSec.h"

@implementation THEOSec
-(void)talk
{
    NSLog(@"%@ is talking",self.name);
}
-(void)call
{
    NSLog(@"%@ is calling",self.name);
}
@end
