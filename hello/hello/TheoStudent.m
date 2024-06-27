//
//  TheoStudent.m
//  hello
//
//  Created by Theo on 2024/6/27.
//

#import "TheoStudent.h"

@implementation TheoStudent
-(void)say
{
        NSLog(@"我叫%@。我%d岁了",name,age);
}
-(void)setName:(NSString *)_name
{
    name = _name;
}
-(void)setAge:(int)_age
{
    age = _age;
}
-(void)setName:(NSString *)_name andAge:(int)_age
{
    name = _name;
    age = _age;
}
@end
