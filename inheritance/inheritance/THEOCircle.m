//
//  THEOCircle.m
//  inheritance
//
//  Created by Theo on 2024/6/27.
//

#import "THEOCircle.h"

@implementation THEOCircle
-(id)initWithRad:(int)_rad{
    self = [super initWithWigth:_rad andWithHeight:_rad];
    return self;
}
-(double)area
{
    return 3.14 * [super area];
}
@end
