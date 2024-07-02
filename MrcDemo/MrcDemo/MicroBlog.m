//
//  MicroBlog.m
//  MrcDemo
//
//  Created by Theo on 2024/7/2.
//

#import "MicroBlog.h"

@implementation MicroBlog
-(void)dealloc
{
    NSLog(@"MicroBlog is deleted");
    [_content release];
    [_imgUrl release];
    [_user release];
    [_zhuanFaBlog release];
    [super dealloc];
}
@end
