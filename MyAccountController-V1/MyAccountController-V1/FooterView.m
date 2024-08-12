//
//  FooterView.m
//  MyAccountController-V1
//
//  Created by Theo on 2024/7/30.
//

#import "FooterView.h"

@implementation FooterView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        _btn = [UIButton buttonWithType:UIButtonTypeSystem];
        _btn.frame = self.bounds;
        
        [_btn setTitle:@"View More" forState:(UIControlStateNormal)];
        [_btn.titleLabel setBackgroundColor:[UIColor blueColor]];
        [self addSubview:_btn];
    }
    return self;
}
@end
