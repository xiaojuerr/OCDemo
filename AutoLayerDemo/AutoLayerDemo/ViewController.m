//
//  ViewController.m
//  AutoLayerDemo
//
//  Created by Theo on 2024/7/10.
//

#import "ViewController.h"

@interface ViewController ()<UIScrollViewDelegate>
{
    UIView *redView;
    UIView *blueView;
    UIScrollView *scrollView;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    scrollView = [[UIScrollView alloc] initWithFrame:self.view.frame];
    
    [scrollView setBackgroundColor:[UIColor whiteColor]];
    scrollView.contentOffset = CGPointMake(0, 0);
    scrollView.contentSize = CGSizeMake(self.view.frame.size.width * 2, self.view.frame.size.height * 2);
    scrollView.delegate = self;
    [self.view addSubview:scrollView];
    self.view.backgroundColor = [UIColor grayColor];
    
    redView = [[UIView alloc] initWithFrame:(CGRectZero)];
    [redView setBackgroundColor:[UIColor redColor]];
    [scrollView addSubview:redView];
    blueView = [[UIView alloc] initWithFrame:(CGRectZero)];
    [blueView setBackgroundColor:[UIColor blueColor]];
    [scrollView addSubview:blueView];
    
    [self setupConstraints:scrollView];
    
}

-(void)setupConstraints:(UIScrollView *)scrollView
{
    redView.translatesAutoresizingMaskIntoConstraints = NO;
    blueView.translatesAutoresizingMaskIntoConstraints = NO;
    //
    NSLayoutConstraint *widthConstraint = [NSLayoutConstraint constraintWithItem:redView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:scrollView attribute:NSLayoutAttributeWidth multiplier:0.5 constant:0];
    NSLayoutConstraint *heightConstraint = [NSLayoutConstraint constraintWithItem:redView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:scrollView attribute:NSLayoutAttributeHeight multiplier:0.5 constant:0];
    NSLayoutConstraint *topConstraint = [NSLayoutConstraint constraintWithItem:redView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:scrollView attribute:NSLayoutAttributeTop multiplier:1 constant:20];
    NSLayoutConstraint *leadingConstraint = [NSLayoutConstraint constraintWithItem:redView attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:scrollView attribute:NSLayoutAttributeLeading multiplier:1 constant:20];
    
    NSLayoutConstraint *widthConstraint1 = [NSLayoutConstraint constraintWithItem:blueView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:scrollView attribute:NSLayoutAttributeWidth multiplier:0.3 constant:0];
    NSLayoutConstraint *heightConstraint1 = [NSLayoutConstraint constraintWithItem:blueView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:scrollView attribute:NSLayoutAttributeHeight multiplier:0.3 constant:0];
    NSLayoutConstraint *topConstraint1 = [NSLayoutConstraint constraintWithItem:blueView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:scrollView attribute:NSLayoutAttributeTop multiplier:2 constant:30];
    NSLayoutConstraint *leadingConstraint1 = [NSLayoutConstraint constraintWithItem:blueView attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:redView attribute:NSLayoutAttributeTrailing multiplier:1 constant:30];
    [scrollView addConstraints:@[widthConstraint,heightConstraint,topConstraint,leadingConstraint]];
    [scrollView addConstraints:@[widthConstraint1,heightConstraint1,topConstraint1,leadingConstraint1]];
    
}

@end
