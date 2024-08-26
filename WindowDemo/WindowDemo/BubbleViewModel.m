//
//  BubbleViewModel.m
//  WindowDemo
//
//  Created by Theo on 2024/8/23.
//

#import "BubbleViewModel.h"

@interface BubbleViewModel()
@property (nonatomic, weak, nullable) id<MyBubbleViewModelDelegate> delegate;
@end

@implementation BubbleViewModel
- (instancetype)initWithModel:(BubbleModel *)model {
    self = [super init];
    if(self){
        self.model = model;
    }
    return self;
}

- (void)updateBorderSize:(CGFloat)borderWidth borderHeight:(CGFloat)borderHeight {
    self.model.borderWidth = borderWidth;
    self.model.borderHeight = borderHeight;
    if([self.delegate conformsToProtocol:@protocol(MyBubbleViewModelDelegate)] && [self.delegate respondsToSelector:@selector(updateBubbleView)]){
        [self.delegate updateBubbleView];
    }
}

- (void)updateBorderLineSize:(CGFloat)borderLineSize {
    self.model.borderLineSize = borderLineSize;
    if([self.delegate conformsToProtocol:@protocol(MyBubbleViewModelDelegate)] && [self.delegate respondsToSelector:@selector(updateBubbleView)]){
        [self.delegate updateBubbleView];
    }
}

- (void)updateTriangleSize:(CGFloat)triangleWidth triangleHeight:(CGFloat)triangleHeight {
    self.model.triangleWidth = triangleWidth;
    self.model.triangleHeight = triangleHeight;
    if([self.delegate conformsToProtocol:@protocol(MyBubbleViewModelDelegate)] && [self.delegate respondsToSelector:@selector(updateBubbleView)]){
        [self.delegate updateBubbleView];
    }
}
- (void)setDelegate:(id<MyBubbleViewModelDelegate>)delegate{
    if([delegate conformsToProtocol:@protocol(MyBubbleViewModelDelegate)]){
        _delegate = delegate;
    }
}
@end
