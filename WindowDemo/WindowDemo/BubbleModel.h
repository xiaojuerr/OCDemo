//
//  BubbleModel.h
//  WindowDemo
//
//  Created by Theo on 2024/8/26.
//
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface BubbleModel : NSObject
@property (nonatomic, assign) CGFloat borderLineSize;
@property (nonatomic, assign) CGFloat width;
@property (nonatomic, assign) CGFloat height;
@property (nonatomic, assign) CGFloat trianglePosition;
@property (nonatomic, assign) CGFloat triangleHeight;
@property (nonatomic, assign) CGFloat triangleWidth;
@property (nonatomic, strong) NSString *title;
@property (copy, nonatomic) NSArray *titleExtend;
@property (nonatomic, assign)  CGFloat cornerRadius;
//modify 颜色参数
@property (nonatomic, strong) UIColor *borderLineColor;
@property (nonatomic, copy) NSArray<UIColor *> *borderLineColors;
@property (nonatomic, copy) NSArray<UIColor *> *contentColors;

- (instancetype)initWithBorderLineSize:(CGFloat)borderLineSize width:(CGFloat)width height:(CGFloat)height trianglePosition:(CGFloat)trianglePosition triangleHeight:(CGFloat)triangleHeight triangleWidth:(CGFloat)triangleWidth titleExtend:(NSArray *)titleExtend cornerRadius:(CGFloat)cornerRadius borderLineColor:(UIColor *)borderLineColor contentColors:(NSArray<UIColor *> *)contentColors;
@end

NS_ASSUME_NONNULL_END
