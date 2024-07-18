//
//  ViewController.m
//  UIGestureRecognizerDemo
//
//  Created by Theo on 2024/7/12.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor grayColor]];
    
    _yellowView = [[UIView alloc] initWithFrame:(CGRectMake(50, 100, 100, 100))];
    _yellowView.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:_yellowView];
    
    _cyanView = [[UIView alloc] initWithFrame:(CGRectMake(200, 100, 100, 100))];
    _cyanView.backgroundColor = [UIColor cyanColor];
    [self.view addSubview:_cyanView];
    
    _magentaView = [[UIView alloc] initWithFrame:(CGRectMake(350, 100, 100, 100))];
    _magentaView.backgroundColor = [UIColor magentaColor];
    [self.view addSubview:_magentaView];
    //// 添加tap手势识别器到黄色视图
    _tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTap:)];
    _tapGesture.delegate = self;
    [_yellowView addGestureRecognizer:_tapGesture];
    
    _longPressGesture = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(handleLongPress:)];
    _longPressGesture.delegate = self;
    [_yellowView addGestureRecognizer:_longPressGesture];
    
    // 添加手势识别器到青色视图
    _swipeGesture = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipe:)];
    _swipeGesture.delegate = self;
    [_cyanView addGestureRecognizer:_swipeGesture];
    
    _panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handlePan:)];
    _swipeGesture.direction = UISwipeGestureRecognizerDirectionDown;
    _panGesture.delegate = self;
    [_cyanView addGestureRecognizer:_panGesture];
}

- (void)handleTap:(UITapGestureRecognizer *)gesture {
    NSLog(@"Tap detected");
}

- (void)handleLongPress:(UILongPressGestureRecognizer *)gesture {
    if (gesture.state == UIGestureRecognizerStateBegan) {
        NSLog(@"Long press detected");
    }
}

- (void)handleSwipe:(UISwipeGestureRecognizer *)gesture {
    NSLog(@"Swipe detected");
}

- (void)handlePan:(UIPanGestureRecognizer *)gesture {
    NSLog(@"Pan detected");
    CGPoint translation = [gesture translationInView:self.cyanView];
    gesture.view.center = CGPointMake(gesture.view.center.x + translation.x, gesture.view.center.y + translation.y);
    [gesture setTranslation:CGPointZero inView:self.cyanView];
}
//优先otherGestureRecognizer
-(BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRequireFailureOfGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer
{
    if(gestureRecognizer == _tapGesture && otherGestureRecognizer == _longPressGesture)
    {
        return YES;
    }
    if(gestureRecognizer == _panGesture && otherGestureRecognizer == _swipeGesture)
    {
        return YES;
    }
    return NO;
}
@end
