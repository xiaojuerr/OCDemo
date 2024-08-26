//
//  CustomBubbleView.h
//  WindowDemo
//
//  Created by Theo on 2024/8/22.
//

#import <UIKit/UIKit.h>
#import "BubbleViewModel.h"
#import "MyBubbleViewModelDelegate.h"
NS_ASSUME_NONNULL_BEGIN

@interface CustomBubbleView : UIView<MyBubbleViewModelDelegate>
@property (nonatomic, strong) BubbleViewModel *viewModel;
- (void)bindViewModel:(BubbleViewModel *)viewModel;
- (void)updateBubbleView;
@end

NS_ASSUME_NONNULL_END
