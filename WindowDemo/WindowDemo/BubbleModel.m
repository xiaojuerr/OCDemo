//
//  BubbleModel.m
//  WindowDemo
//
//  Created by Theo on 2024/8/26.
//

#import "BubbleModel.h"

@implementation BubbleModel

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
-(instancetype)initWithBorderLineSize:(CGFloat)borderLineSize width:(CGFloat)width height:(CGFloat)height trianglePosition:(CGFloat)trianglePosition triangleHeight:(CGFloat)triangleHeight triangleWidth:(CGFloat)triangleWidth titleExtend:(NSArray *)titleExtend cornerRadius:(CGFloat)cornerRadius borderLineColor:(UIColor *)borderLineColor contentColors:(NSArray<UIColor *> *)contentColors{
    self = [super init];
    if(self){
        self.borderLineSize = borderLineSize;
        self.width = width;
        self.height = height;
        self.trianglePosition = trianglePosition;
        self.triangleWidth = triangleWidth;
        self.triangleHeight = triangleHeight;
        self.titleExtend = titleExtend;
        self.cornerRadius = cornerRadius;
        self.borderLineColor = borderLineColor;
        self.contentColors = contentColors;
    }
    return self;
}
- (void)setContentColors:(NSArray<UIColor *> *)contentColors{
    _contentColors = contentColors;
}
- (void)setBorderLineColors:(NSArray<UIColor *> *)borderLineColors{
    _borderLineColors = borderLineColors;
}
@end
