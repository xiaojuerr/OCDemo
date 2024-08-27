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
#define DESIGN_WIDTH 750.0
#define LAZSAO750(value) (value * (UIScreen.mainScreen.bounds.size.width / DESIGN_WIDTH))
@interface ViewController ()
@property (strong, nonatomic) CustomBubbleView *bubbleView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view setBackgroundColor:[UIColor whiteColor]];
    CustomBubbleView *bubbleView = [[CustomBubbleView alloc] initWithFrame:(CGRectZero)];
    self.bubbleView = bubbleView;
    [self.view addSubview:self.bubbleView];
    
    BubbleModel *model = [[BubbleModel alloc] initWithBorderLineSize:LAZSAO750(2.0) width: LAZSAO750(510.0) height:LAZSAO750(112.0)  trianglePosition:(LAZSAO750(100.0)) triangleHeight:LAZSAO750(12.0) triangleWidth:LAZSAO750(26.0) title:@"Great to see you! Chat with me and find the best deals!  💰🚀 " cornerRadius:LAZSAO750(18.0) borderLineColor:[UIColor colorWithRed:139/255.0 green:187/255.0 blue:255/255.0 alpha:1.0] contentColor:[UIColor colorWithRed:139/255.0 green:187/255.0 blue:255/255.0 alpha:1.0]];
    
    BubbleViewModel *viewModel = [[BubbleViewModel alloc] initWithModel:model];
//    [viewModel.model setContentColors:@[
//        (__bridge id)[UIColor colorWithRed:255/255.0 green:115/255.0 blue:255/255.0 alpha:0.6].CGColor,       // rgba(255, 115, 255, 0.8)
//        (__bridge id)[UIColor colorWithRed:255/255.0 green:115/255.0 blue:255/255.0 alpha:0.4].CGColor,       // rgba(255, 115, 255, 0)
//        (__bridge id)[UIColor colorWithRed:26/255.0 green:140/255.0 blue:255/255.0 alpha:0.6].CGColor,        // rgba(26, 140, 255, 1)
//        (__bridge id)[UIColor colorWithRed:26/255.0 green:140/255.0 blue:255/255.0 alpha:0.4].CGColor       // rgba(26, 140, 255, 0)
//    ]];
    [self.bubbleView bindViewModel:viewModel];
    
    [self.bubbleView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@(viewModel.model.width));
        make.height.equalTo(@(viewModel.model.height));
        make.centerX.equalTo(self.view);
        make.bottom.equalTo(self.view).offset(-32.0);
    }];
}



@end
