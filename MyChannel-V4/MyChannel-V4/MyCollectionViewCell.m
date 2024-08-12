//
//  MyCollectionViewCell.m
//  MyChannel-V4
//
//  Created by Theo on 2024/8/5.
//

#import "MyCollectionViewCell.h"

@interface MyCollectionViewCell (/* extension*/)

@property (nonatomic, strong) UILabel *label1;

@end

@implementation MyCollectionViewCell

- (void)bindViewModel:(ItemList *)item {
    _item = item;
    self.label1.text = item.title;
}

- (void)prepareForReuse
{
    [super prepareForReuse];
    self.label.text = nil;
}
//-(void)configureCell:(UICollectionViewCell *)cell
//{
//    UIView *subView;
//    for (subView in cell.contentView.subviews) {
//        if ([subView isKindOfClass:[UIButton class]] && [subView.accessibilityIdentifier isEqualToString:@"uniqueID_stickTopButton"]) {
//                if([_dataManager itemAtindex:_indexPath.row].status == ChannelStatusNormal){
//                    subView.hidden = YES;
//                }else{
//                    subView.hidden = NO;
//                }
//        }
//    }
//
//}
#pragma mark AddGesture
- (void)addGesturesToCell:(UICollectionViewCell *)cell {
    // 检查是否已经添加了手势识别器
    if (![self hasGestureRecognizersInView:cell]) {
        UILongPressGestureRecognizer *longPressGesture = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(handleLongPress:)];
        longPressGesture.delegate = self;
        [cell addGestureRecognizer:longPressGesture];
        
        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTap:)];
        tapGesture.delegate = self;
        [cell addGestureRecognizer:tapGesture];
    }
}
- (BOOL)hasGestureRecognizersInView:(UIView *)view {
    for (UIGestureRecognizer *gesture in view.gestureRecognizers) {
        if ([gesture isKindOfClass:[UILongPressGestureRecognizer class]] || [gesture isKindOfClass:[UITapGestureRecognizer class]]) {
            return YES;
        }
    }
    return NO;
}

#pragma mark HandleGestureDel
- (void)handleLongPress:(UILongPressGestureRecognizer *)gestureRecognizer {
    if([self.gestureDel respondsToSelector:@selector(handleLongPress:)]){
        [self.gestureDel handleLongPress:gestureRecognizer];
    }
}
- (void)handleTap:(UITapGestureRecognizer *)gestureRecognizer {
    if([self.gestureDel respondsToSelector:@selector(handleTap:)]){
        [self.gestureDel handleTap:gestureRecognizer];
    }
}

#pragma mark ConfigureGesture
//- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
//    // Allow multiple gestures to be recognized simultaneously
//    return YES;
//}
//- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRequireFailureOfGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
//    // Ensure long press gesture has higher priority over tap gesture
//    if ([gestureRecognizer isKindOfClass:[UILongPressGestureRecognizer class]] && [otherGestureRecognizer isKindOfClass:[UITapGestureRecognizer class]]) {
//        return YES;
//    }
//    return NO;
//}
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch
{
    if(_item.status == ChannelStatusAllEdit){
        return NO;
    }else return YES;
}

@end
