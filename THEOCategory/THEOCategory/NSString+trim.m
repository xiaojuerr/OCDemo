//
//  NSString+trim.m
//  THEOCategory
//
//  Created by Theo on 2024/6/28.
//

#import "NSString+trim.h"

@implementation NSString (trim)
-(NSString *)trim
{
    return [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
}
@end
