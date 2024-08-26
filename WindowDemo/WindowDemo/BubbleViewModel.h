//
//  BubbleViewModel.h
//  WindowDemo
//
//  Created by Theo on 2024/8/23.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "BubbleModel.h"
#import "MyBubbleViewModelDelegate.h"
NS_ASSUME_NONNULL_BEGIN

@interface BubbleViewModel : NSObject

@property (nonatomic, strong) BubbleModel *model;

- (instancetype)initWithModel:(BubbleModel *)model;
- (void)updateBorderSize:(CGFloat)borderWidth borderHeight:(CGFloat)borderHeight;
- (void)updateBorderLineSize:(CGFloat)borderLineSize;
- (void)updateTriangleSize:(CGFloat)triangleWidth triangleHeight:(CGFloat)triangleHeight;
- (void)setDelegate:(id<MyBubbleViewModelDelegate>) delegate;
@end

NS_ASSUME_NONNULL_END
