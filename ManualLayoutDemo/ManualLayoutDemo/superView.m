//
//  superView.m
//  ManualLayoutDemo
//
//  Created by Theo on 2024/7/10.
//

#import "superView.h"

@implementation superView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (void)createSubView {
    view1 = [[UIView alloc] init];
    view1.frame = CGRectMake(0, 0, 40, 40);
    
    view2 = [[UIView alloc] init];
    view2.frame = CGRectMake(self.bounds.size.width - 40, 0, 40, 40);
    
    view3 = [[UIView alloc] init];
    view3.frame = CGRectMake(self.bounds.size.width - 40, self.bounds.size.height - 40, 40, 40);
    
    view4 = [[UIView alloc] init];
    view4.frame = CGRectMake(0, self.bounds.size.height - 40, 40, 40);
    
    view1.backgroundColor = [UIColor cyanColor];
    view2.backgroundColor = [UIColor cyanColor];
    view3.backgroundColor = [UIColor cyanColor];
    view4.backgroundColor = [UIColor cyanColor];
    [self addSubview:view1];
    [self addSubview:view2];
    [self addSubview:view3];
    [self addSubview:view4];
}
//当需要重新布局时调用此函数
//通过此函数重新设定子视图的位置
//手动调整子视图的位置
- (void)layoutSubviews
{
    [UIView animateWithDuration:1 animations:^{
    self->view1.frame = CGRectMake(0, 0, 40, 40);
            self->view2.frame = CGRectMake(self.bounds.size.width - 40, 0, 40, 40);
            self->view3.frame = CGRectMake(self.bounds.size.width - 40, self.bounds.size.height - 40, 40, 40);
            self->view4.frame = CGRectMake(0, self.bounds.size.height - 40, 40, 40);
        }];
}
@end
