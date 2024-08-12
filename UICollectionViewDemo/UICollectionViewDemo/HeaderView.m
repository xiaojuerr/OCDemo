//
//  HeaderView.m
//  UICollectionViewDemo
//
//  Created by Theo on 2024/7/30.
//

#import "HeaderView.h"

@implementation HeaderView
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        _label = [[UILabel alloc] initWithFrame:self.bounds];
        [self addSubview:_label];
    }
    return self;
}
@end
