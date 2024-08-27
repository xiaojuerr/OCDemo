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
    NSArray<UIColor *> *colors = @[
        (__bridge id)[UIColor colorWithRed:255/255.0 green:243/255.0 blue:251/255.0 alpha:1.0].CGColor,      // rgba(26, 140, 255, 0)
        (__bridge id)[UIColor colorWithRed:255/255.0 green:242/255.0 blue:248/255.0 alpha:1.0].CGColor,        // rgba(26, 140, 255, 1)
        (__bridge id)[UIColor colorWithRed:255/255.0 green:242/255.0 blue:248/255.0 alpha:1.0].CGColor,       // rgba(255, 115, 255, 0.8)
        (__bridge id)[UIColor colorWithRed:255/255.0 green:229/255.0 blue:238/255.0 alpha:1.0].CGColor       // rgba(255, 115, 255, 0)
    ];
    NSArray *titleExtend = @[
        @{
            @"bold": @"true",
            @"color": @"#595F6D",
            @"text": @"Fresh arrivals! Buy 3 get ",
            @"textSize": @11
        },
        @{
            @"bold": @"true",
            @"color": @"#FE4960",
            @"text": @"20% off",
            @"textSize": @11
        },
        @{
            @"bold": @"true",
            @"color": @"#595F6D",
            @"text": @" with free shipping!",
            @"textSize": @11
        }
    ];
    BubbleModel *model = [[BubbleModel alloc] initWithBorderLineSize:LAZSAO750(2.0) width: LAZSAO750(510.0) height:LAZSAO750(112.0)  trianglePosition:(LAZSAO750(100.0)) triangleHeight:LAZSAO750(12.0) triangleWidth:LAZSAO750(26.0) titleExtend:titleExtend cornerRadius:LAZSAO750(18.0) borderLineColor:[UIColor colorWithRed:255/255.0 green:198/255.0 blue:221/255.0 alpha:1.0] contentColors:colors];
    
    BubbleViewModel *viewModel = [[BubbleViewModel alloc] initWithModel:model];
    [self.bubbleView bindViewModel:viewModel];
    
    [self.bubbleView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@(viewModel.model.width));
        make.height.equalTo(@(viewModel.model.height));
        make.centerX.equalTo(self.view);
        make.bottom.equalTo(self.view).offset(-32.0);
    }];
}



@end
