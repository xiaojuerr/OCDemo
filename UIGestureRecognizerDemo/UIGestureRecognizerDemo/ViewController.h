//
//  ViewController.h
//  UIGestureRecognizerDemo
//
//  Created by Theo on 2024/7/12.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UIGestureRecognizerDelegate>
@property (strong , nonatomic) UIView *yellowView;
@property (strong , nonatomic) UIView *cyanView;
@property (strong , nonatomic) UIView *magentaView;
@property (strong , nonatomic) UITapGestureRecognizer *tapGesture;
@property (strong , nonatomic) UILongPressGestureRecognizer *longPressGesture;
@property (strong , nonatomic) UISwipeGestureRecognizer *swipeGesture;
@property (strong , nonatomic) UIPanGestureRecognizer *panGesture;
@end

