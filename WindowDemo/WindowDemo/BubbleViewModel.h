//
//  BubbleViewModel.h
//  WindowDemo
//
//  Created by Theo on 2024/8/23.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "BubbleModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface BubbleViewModel : NSObject

@property (nonatomic, strong) BubbleModel *model;

- (instancetype)initWithModel:(BubbleModel *)model;

@end

NS_ASSUME_NONNULL_END
