//
//  GradientLayer.m
//  GradientLayerDemo
//
//  Created by Theo on 2024/8/16.
//

#import "LAAGradientView.h"

@implementation LAAGradientView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.gradientLayer = [CAGradientLayer layer];
        [self.layer insertSublayer:self.gradientLayer atIndex:0];
    }
    return self;
}
- (UIColor *)colorFromHexString:(NSString *)hexString {
    unsigned int hexInt = 0;
    [[NSScanner scannerWithString:[hexString substringFromIndex:1]] scanHexInt:&hexInt];
    CGFloat alpha = ((hexInt >> 24) & 0xFF) / 255.0; // 修改为适应六位或八位格式
    CGFloat red = ((hexInt >> 16) & 0xFF) / 255.0;
    CGFloat green = ((hexInt >> 8) & 0xFF) / 255.0;
    CGFloat blue = (hexInt & 0xFF) / 255.0;
    return [UIColor colorWithRed:red green:green blue:blue alpha:alpha];
}
- (void)updateGradientWithStartColor:(NSString *)startHexColor endColor:(NSString *)endHexColor {
    UIColor *startColor = [self colorFromHexString:startHexColor];
    UIColor *endColor = [self colorFromHexString:endHexColor];
    
    CGFloat startRed, startGreen, startBlue, startAlpha;
    CGFloat endRed, endGreen, endBlue, endAlpha;

    [startColor getRed:&startRed green:&startGreen blue:&startBlue alpha:&startAlpha];
    [endColor getRed:&endRed green:&endGreen blue:&endBlue alpha:&endAlpha];

    // 计算中间颜色的 RGB 值
    CGFloat midRed = (startRed + endRed) / 2.0;
    CGFloat midGreen = (startGreen + endGreen) / 2.0;
    CGFloat midBlue = (startBlue + endBlue) / 2.0;

    _gradientLayer.locations = @[@0.0, @0.5, @1.0];
    _gradientLayer.frame = self.bounds;
    _gradientLayer.colors = @[
        (id)startColor.CGColor,
        (id)[UIColor colorWithRed:midRed green:midGreen blue:midBlue alpha:1.0].CGColor,
        (id)endColor.CGColor
    ];
    _gradientLayer.startPoint = CGPointMake(0.0, 0);
    _gradientLayer.endPoint = CGPointMake(1, 1);
}

- (void)layoutSubviews {
    [super layoutSubviews];
    _gradientLayer.frame = self.bounds; // 确保渐变层随视图调整
}



@end
