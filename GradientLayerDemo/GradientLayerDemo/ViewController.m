//
//  ViewController.m
//  GradientLayerDemo
//
//  Created by Theo on 2024/8/16.
//

#import "ViewController.h"
#import "LAAGradientView.h"
@interface ViewController ()
@property (nonatomic, strong) LAAGradientView *gradientLayer;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.gradientLayer = [[LAAGradientView alloc] initWithFrame:self.view.bounds];
    // "bgEndColor": "#99FFFCF2",
    //"bgStartColor": "#CCFFFAE6",
    
    /*
     "bgEndColor": "#CCFFF9F9",
     "bgStartColor": "#CCFFF4F4",
     */
    [self.view addSubview:self.gradientLayer];
    NSString *bgEndColor = @"#99FFFCF2";
    NSString *bgStartColor = @"#CCFFFAE6";
    [self.gradientLayer updateGradientWithStartColor:bgStartColor endColor:bgEndColor];
}


@end
