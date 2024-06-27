//
//  THEOTriangle.m
//  inheritance
//
//  Created by Theo on 2024/6/27.
//

#import "THEOTriangle.h"

@implementation THEOTriangle
-(id)initWithBottom:(int)_bottom ansWithHeight:(int)_height
{
    self = [super initWithWigth:_bottom andWithHeight:_height];
    return self;
}
-(double)area
{
    return [super area]/2.0;
}
@end
