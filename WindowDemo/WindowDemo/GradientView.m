//
//  GradientView.m
//  WindowDemo
//
//  Created by Theo on 2024/8/23.
//

#import "GradientView.h"

@implementation GradientView

- (void)setupGradientLayers {
    // 创建一个父视图用于包含所有的渐变层
    UIView *containerView = [[UIView alloc] initWithFrame:self.bounds];

    // 渐变1: 从中心白色到透明
    CAGradientLayer *gradientLayer1 = [CAGradientLayer layer];
    gradientLayer1.frame = self.bounds;
    gradientLayer1.colors = @[
        (__bridge id)[UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:1].CGColor,
        (__bridge id)[UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:0].CGColor
    ];
    gradientLayer1.type = kCAGradientLayerRadial;
    gradientLayer1.startPoint = CGPointMake(0.5, 0.5);
    gradientLayer1.endPoint = CGPointMake(1, 1);
    [containerView.layer addSublayer:gradientLayer1];

    // 渐变2: 从中心蓝色到透明
    CAGradientLayer *gradientLayer2 = [CAGradientLayer layer];
    gradientLayer2.frame = self.bounds;
    gradientLayer2.colors = @[
        (__bridge id)[UIColor colorWithRed:26/255.0 green:140/255.0 blue:255/255.0 alpha:1].CGColor,
        (__bridge id)[UIColor colorWithRed:26/255.0 green:140/255.0 blue:255/255.0 alpha:0].CGColor
    ];
    gradientLayer2.type = kCAGradientLayerRadial;
    gradientLayer2.startPoint = CGPointMake(0.5, 0.5);
    gradientLayer2.endPoint = CGPointMake(1, 1);
    [containerView.layer addSublayer:gradientLayer2];

    // 渐变3: 从中心到外围的粉色渐变
    CAGradientLayer *gradientLayer3 = [CAGradientLayer layer];
    gradientLayer3.frame = self.bounds;
    gradientLayer3.colors = @[
        (__bridge id)[UIColor colorWithRed:255/255.0 green:115/255.0 blue:255/255.0 alpha:0.8].CGColor,
        (__bridge id)[UIColor colorWithRed:255/255.0 green:115/255.0 blue:255/255.0 alpha:0].CGColor
    ];
    gradientLayer3.startPoint = CGPointMake(0.5, 0.5);
    gradientLayer3.endPoint = CGPointMake(1, 1);
    [containerView.layer addSublayer:gradientLayer3];

    // 添加容器视图到GradientView
    [self addSubview:containerView];
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setupGradientLayers];
    }
    return self;
}


@end
