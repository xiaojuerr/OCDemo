//
//  CustomBubbleView.h
//  WindowDemo
//
//  Created by Theo on 2024/8/22.
//

#import <UIKit/UIKit.h>
#import "BubbleViewModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface CustomBubbleView : UIView
@property (nonatomic, strong) BubbleViewModel *viewModel;
- (void)bindViewModel:(BubbleViewModel *)viewModel;

@end

NS_ASSUME_NONNULL_END
