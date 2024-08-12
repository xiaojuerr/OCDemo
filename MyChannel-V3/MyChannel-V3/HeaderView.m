//
//  HeaderView.m
//  MyChannel-V3
//
//  Created by Theo on 2024/8/1.
//

#import "HeaderView.h"

@implementation HeaderView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        _btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        _btn.frame = self.bounds;
        
        //[[UIL alloc] initWithFrame:self.bounds];
        [_btn setTitle:@"Select All" forState:(UIControlStateNormal)];
        [_btn.titleLabel setBackgroundColor:[UIColor blueColor]];
        [self addSubview:_btn];
    }
    return self;
}
@end
