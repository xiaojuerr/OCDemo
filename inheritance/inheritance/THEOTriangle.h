//
//  THEOTriangle.h
//  inheritance
//
//  Created by Theo on 2024/6/27.
//

#import "THEOShape.h"

NS_ASSUME_NONNULL_BEGIN

@interface THEOTriangle : THEOShape
-(id)initWithBottom:(int)_bottom ansWithHeight:(int)_height;
-(double)area;
@end

NS_ASSUME_NONNULL_END
