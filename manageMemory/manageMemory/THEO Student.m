//
//  THEO Student.m
//  manageMemory
//
//  Created by Theo on 2024/7/1.
//

#import "THEO Student.h"

@implementation THEO_Student
-(void)setName:(NSString *)_name
{
    name = _name;
}
-(void)dealloc
{
    NSLog(@"%@ is released",name);
}
@end
