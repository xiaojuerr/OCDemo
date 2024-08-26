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
-(instancetype)initWithBorderLineSize:(CGFloat)borderLineSize borderWidth:(CGFloat)borderWidth borderHeight:(CGFloat)borderHeight triangleHeight:(CGFloat)triangleHeight triangleWidth:(CGFloat)triangleWidth title:(NSString *)title cornerRadius:(CGFloat)cornerRadius borderLineColor:(UIColor *)borderLineColor contentColor:(UIColor *)contentColor{
    self = [super init];
    if(self){
        self.borderLineSize = borderLineSize;
        self.borderWidth = borderWidth;
        self.borderHeight = borderHeight;
        self.triangleWidth = triangleWidth;
        self.triangleHeight = triangleHeight;
        self.title = title;
        self.cornerRadius = cornerRadius;
        self.borderLineColor = borderLineColor;
        self.contentColor = contentColor;
    }
    return self;
}
@end
