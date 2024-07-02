//
//  THEOArray.h
//  BlockDemo
//
//  Created by Theo on 2024/7/2.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
typedef BOOL (^BlockCompare)(char *c1,char *c2);
@interface THEOArray : NSObject
-(void)sortWithCountries:(char *[])contries andLength:(int)len andCompareBlock:(BlockCompare)compareChar;
@end

NS_ASSUME_NONNULL_END
