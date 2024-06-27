//
//  THEORectangle.m
//  hello
//
//  Created by Theo on 2024/6/27.
//

#import "THEORectangle.h"

@implementation THEORectangle
-(void)setWidth:(int)_width
{
    width = _width;
}
-(void)setWeight:(int)_weight{
    weight = _weight;
}
-(void)setWidth:(int)_width andWeight:(int)_weight
{
    width = _width;
    weight = _weight;
}
-(int)area
{
    return width*weight;
}
-(int)width
{
    return [self width];
}
-(int)weight
{
    return [self weight];
}
+(id)rectangle
{
    return [[[self class]alloc]init]; //创建自己类的对象
}
@end
