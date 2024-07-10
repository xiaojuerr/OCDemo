//
//  ViewController.m
//  UIStackViewDemo
//
//  Created by Theo on 2024/7/10.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor grayColor];
    
    UIStackView *stView = [[UIStackView alloc] initWithArrangedSubviews:@[
        [self createLabelWithText:@"Label 1"],
        [self createButtonWithTitle:@"Botton 1"],
        [self createImageViewWithImage:[UIImage imageNamed:@"1.png"]]
    ]];
    stView.axis = UILayoutConstraintAxisVertical;
    stView.distribution = UIStackViewDistributionFillEqually;
    stView.spacing = 10;
    stView.alignment = UIStackViewAlignmentCenter;
    stView.frame = CGRectMake(20, 100, self.view.frame.size.width - 40, 200);
    
    [self.view addSubview:stView];
}

-(UIButton *)createButtonWithTitle:(NSString *)title
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
    [btn setTitle:title forState:(UIControlStateNormal)];
    [btn addTarget:self action:@selector(buttonTapped:) forControlEvents:(UIControlEventTouchUpInside)];
    [btn setBackgroundColor:[UIColor whiteColor]];
    return btn;
}
-(UILabel *)createLabelWithText:(NSString *)text
{
    UILabel *label = [UILabel new];
    label.text = text;
    [label setBackgroundColor:[UIColor whiteColor]];
    label.textAlignment = NSTextAlignmentCenter;
    label.textColor = [UIColor redColor];
    label.font = [UIFont systemFontOfSize:16];
    return label;
}
-(UIImageView *)createImageViewWithImage:(UIImage *)image
{
    UIImageView *imgView = [[UIImageView alloc] initWithImage:image];
    imgView.contentMode = UIViewContentModeScaleAspectFit;
    return imgView;
}
-(void)buttonTapped:(id)sender
{
    NSLog(@"tapped");
}
@end
