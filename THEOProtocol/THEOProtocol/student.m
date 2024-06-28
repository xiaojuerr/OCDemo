//
//  student.m
//  THEOProtocol
//
//  Created by Theo on 2024/6/28.
//

#import "student.h"

@implementation student
//@synthesize name;
-(void)say
{
    NSLog(@"%@ is saying",self.name);
}
-(void)song
{
    NSLog(@"%@ is songing",self.name);
}
-(void)walk
{
    NSLog(@"%@ is walking",self.name);
}
@end
