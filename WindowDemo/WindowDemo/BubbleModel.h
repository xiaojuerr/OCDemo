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
@property (nonatomic, assign) CGFloat borderWidth;
@property (nonatomic, assign) CGFloat borderHeight;
@property (nonatomic, assign) CGFloat triangleHeight;
@property (nonatomic, assign) CGFloat triangleWidth;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, assign)  CGFloat cornerRadius;
//modify 颜色参数
@property (nonatomic, strong) UIColor *borderLineColor;
@property (nonatomic, strong) UIColor *contentColor;

-(instancetype)initWithBorderLineSize:(CGFloat)borderLineSize borderWidth:(CGFloat)borderWidth borderHeight:(CGFloat)borderHeight triangleHeight:(CGFloat)triangleHeight triangleWidth:(CGFloat)triangleWidth title:(NSString *)title cornerRadius:(CGFloat)cornerRadius borderLineColor:(UIColor *)borderLineColor contentColor:(UIColor *)contentColor;
@end

NS_ASSUME_NONNULL_END
