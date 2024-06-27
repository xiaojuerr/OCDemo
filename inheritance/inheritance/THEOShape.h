//
//  THEOShape.h
//  inheritance
//
//  Created by Theo on 2024/6/27.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface THEOShape : NSObject
{
    int width;
    int weight;
}
-(id)initWithWigth:(int)_width andWithHeight:(int)_weight;
-(int)area;

@end

NS_ASSUME_NONNULL_END
