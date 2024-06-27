//
//  THEOCircle.h
//  inheritance
//
//  Created by Theo on 2024/6/27.
//

#import "THEOShape.h"

NS_ASSUME_NONNULL_BEGIN

@interface THEOCircle : THEOShape
{
    double pi ;
}
-(id)initWithRad:(int)_rad;
-(double)area;
@end

NS_ASSUME_NONNULL_END
