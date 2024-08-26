//
//  GradientLayer.h
//  GradientLayerDemo
//
//  Created by Theo on 2024/8/16.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface LAAGradientView : UIView
@property (strong, nonatomic) CAGradientLayer *gradientLayer;

- (void)updateGradientWithStartColor:(NSString *)startHexColor endColor:(NSString *)endHexColor;
@end

NS_ASSUME_NONNULL_END
