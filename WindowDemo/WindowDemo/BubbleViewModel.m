//
//  BubbleViewModel.m
//  WindowDemo
//
//  Created by Theo on 2024/8/23.
//

#import "BubbleViewModel.h"


@implementation BubbleViewModel
- (instancetype)initWithModel:(BubbleModel *)model {
    self = [super init];
    if(self){
        self.model = model;
    }
    return self;
}


@end
