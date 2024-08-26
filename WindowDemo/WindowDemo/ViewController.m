//
//  ViewController.m
//  WindowDemo
//
//  Created by Theo on 2024/8/22.
//

#import "ViewController.h"

#import "Masonry/Masonry.h"
#import "CustomBubbleView.h"
#import "BubbleViewModel.h"
#import "BubbleModel.h"
#define SCALE_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCALE_HEIGHT [UIScreen mainScreen].bounds.size.height
@interface ViewController ()
@property (strong, nonatomic) CustomBubbleView *bubbleView;
@property (strong ,nonatomic) UIButton *btn;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.btn = [[UIButton alloc] initWithFrame:(CGRectMake(0, 30, 100, 100))];
    self.btn.backgroundColor = [UIColor redColor];
    [self.btn addTarget:self action:@selector(changeView) forControlEvents:(UIControlEventTouchUpInside)];
    [self.view addSubview:self.btn];
    
    [self.view setBackgroundColor:[UIColor whiteColor]];
    CustomBubbleView *bubbleView = [[CustomBubbleView alloc] initWithFrame:(CGRectZero)];
    self.bubbleView = bubbleView;
    [self.view addSubview:self.bubbleView];
    
    BubbleModel *model = [[BubbleModel alloc] initWithBorderLineSize:2.0 * (SCALE_WIDTH / 750.0) borderWidth:510.0 * (SCALE_WIDTH / 750.0) borderHeight:112.0 * (SCALE_HEIGHT / 1624.0) triangleHeight:12.0 * (SCALE_WIDTH / 750.0) triangleWidth:26.0 * (SCALE_WIDTH / 750.0) title:@"Great to see you! Chat with me and find the best deals!  💰🚀 " cornerRadius:18.0 * (SCALE_WIDTH / 750.0) borderLineColor:[UIColor colorWithRed:139/255.0 green:187/255.0 blue:255/255.0 alpha:1.0] contentColor:[UIColor colorWithRed:139/255.0 green:187/255.0 blue:255/255.0 alpha:1.0]];
    
    BubbleViewModel *viewModel = [[BubbleViewModel alloc] initWithModel:model];
    [self.bubbleView bindViewModel:viewModel];
    
    [self.bubbleView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@(viewModel.model.borderWidth));
        make.height.equalTo(@(viewModel.model.borderHeight));
        make.centerX.equalTo(self.view);
        make.bottom.equalTo(self.view).offset(-32.0);
    }];
}
- (void)changeView{
    [self.bubbleView.viewModel updateBorderSize:self.view.frame.size.width borderHeight:200.0 * (SCALE_HEIGHT / 1624.0)];
}


@end
