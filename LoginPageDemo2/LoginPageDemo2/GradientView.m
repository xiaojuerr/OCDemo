//
//  GradientView.m
//  LoginPageDemo2
//
//  Created by Theo on 2024/7/18.
//

#import "GradientView.h"

@implementation GradientView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self applyGradient];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder {
    self = [super initWithCoder:coder];
    if (self) {
        [self applyGradient];
    }
    return self;
}

- (void)applyGradient {
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    gradientLayer.frame = self.bounds;

    // 定义颜色：rgba(255, 239, 248, 0.8)、rgba(255, 240, 245, 1) 和 rgba(254, 227, 232, 1)
    gradientLayer.colors = @[
        (__bridge id)[UIColor colorWithRed:255/255.0 green:239/255.0 blue:248/255.0 alpha:0.8].CGColor,
        (__bridge id)[UIColor colorWithRed:255/255.0 green:240/255.0 blue:245/255.0 alpha:1.0].CGColor,
        (__bridge id)[UIColor colorWithRed:254/255.0 green:227/255.0 blue:232/255.0 alpha:1.0].CGColor
    ];

    // 设置渐变的起点和终点（这里是从上到下的线性渐变）
    gradientLayer.startPoint = CGPointMake(0.5, 0.0);
    gradientLayer.endPoint = CGPointMake(0.5, 1.0);
    
    [self.layer insertSublayer:gradientLayer atIndex:0];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    // 更新渐变图层的尺寸
    CAGradientLayer *gradientLayer = (CAGradientLayer *)self.layer.sublayers.firstObject;
    gradientLayer.frame = self.bounds;
}

@end
