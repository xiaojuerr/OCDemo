//
//  FooterView.m
//  UICollectionViewDemo
//
//  Created by Theo on 2024/7/30.
//

#import "FooterView.h"

@implementation FooterView
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        _label = [[UILabel alloc] initWithFrame:self.bounds];
        [self addSubview:_label];
    }
    return self;
}
@end
