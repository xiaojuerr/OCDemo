//
//  UIColor+LAUIKit.m
//  WindowDemo
//
//  Created by Theo on 2024/8/27.
//

#import "UIColor+LAUIKit.h"

@implementation UIColor (LAUIKit)
+ (UIColor *)laz_colorWithHex:(NSString*)hex{
    if ([hex hasPrefix:@"#"]) {
        hex = [hex substringFromIndex:1];
    }
    NSScanner *scanner = [NSScanner scannerWithString:hex];
    unsigned int hexValue;
    if (![scanner scanHexInt:&hexValue]) {
        return nil;
    }
    CGFloat red = ((hexValue & 0xFF0000) >> 16) / 255.0;
    CGFloat green = ((hexValue & 0x00FF00) >> 8) / 255.0;
    CGFloat blue = (hexValue & 0x0000FF) / 255.0;
    
    return [UIColor colorWithRed:red green:green blue:blue alpha:1.0];
}
@end
