//
//  THEOShape.m
//  inheritance
//
//  Created by Theo on 2024/6/27.
//

#import "THEOShape.h"

@implementation THEOShape
- (id)init //重写父类init
{
    self = [super init];//显示调用父类对象
    if (self) {
        width = 0;
        weight = 0;
    }
    return self;
}
-(id)initWithWigth:(int)_width andWithHeight:(int)_weight //定制的初始化行为
{
    self = [super init];
    if(self){
        width  = _width;
        weight = _weight;
    }
    return self;
    
}
-(int)area
{
    return width*weight;
}
@end
