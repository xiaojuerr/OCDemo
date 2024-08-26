//
//  CustomBubbleView.m
//  WindowDemo
//
//  Created by Theo on 2024/8/22.
//
#import "CustomBubbleView.h"
#import "Masonry/Masonry.h"
#import "BubbleViewModel.h"
@interface CustomBubbleView ()
@property (nonatomic, strong) UIView *mainView;
@property (nonatomic, strong) UILabel *label;
@property (nonatomic, strong) UIImageView *rightImageView;
@property (nonatomic, strong) CAShapeLayer *shapeLayer;
@property (nonatomic, strong) CAGradientLayer *gradientLayer;
@property (nonatomic, strong) CAShapeLayer *borderLayer;

@end

@implementation CustomBubbleView
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setupView];
    }
    return self;
}

- (void)updateBubbleView{
    self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y,
                                self.viewModel.model.borderWidth,
                                self.viewModel.model.borderHeight);
    [self setupLayout];
    [self setNeedsLayout];
}

- (void)setupView{
    self.mainView = [UIView new];
    [self addSubview: self.mainView];
    
    self.label = [UILabel new];
    [self addSubview:self.label];
    
    self.rightImageView = [[UIImageView alloc] init];
    [self addSubview:self.rightImageView];
    
    self.shapeLayer = [CAShapeLayer layer];
    self.shapeLayer.fillColor = [UIColor whiteColor].CGColor; // 填充颜色
    
    self.gradientLayer = [CAGradientLayer layer];
    self.gradientLayer.frame = self.bounds;
    self.gradientLayer.mask = self.shapeLayer;
    [self.layer insertSublayer:self.gradientLayer atIndex:0];
    
    self.borderLayer = [CAShapeLayer layer];
    [self.layer addSublayer:self.borderLayer];
    
    [self setupLayer];
    [self setupLayout];
}

- (void)bindViewModel:(BubbleViewModel *)viewModel {
    _viewModel = viewModel;
    if([self conformsToProtocol:@protocol(MyBubbleViewModelDelegate)]){
        [_viewModel setDelegate:self];
    }
    self.label.text = _viewModel.model.title;
    self.label.textColor = [UIColor blackColor];
    self.label.font = [UIFont fontWithName:@"Euclid Circular A" size:10];
    self.label.numberOfLines = 2;
    self.label.textAlignment = NSTextAlignmentLeft;
    self.label.adjustsFontSizeToFitWidth = YES;
    
    self.borderLayer.strokeColor = self.viewModel.model.borderLineColor.CGColor;
    self.borderLayer.lineWidth = self.viewModel.model.borderLineSize;
    self.rightImageView.image = [UIImage imageNamed:@"Image-1613"];
}

- (void)layoutSubviews{
    [super layoutSubviews];
    self.shapeLayer.path = [self createPath].CGPath;
    self.gradientLayer.frame = self.bounds;
    self.borderLayer.path = self.shapeLayer.path;
}
-(void)setupLayer{
    self.gradientLayer.colors = @[
        (__bridge id)[UIColor colorWithRed:255/255.0 green:115/255.0 blue:255/255.0 alpha:0.6].CGColor,       // rgba(255, 115, 255, 0.8)
        (__bridge id)[UIColor colorWithRed:255/255.0 green:115/255.0 blue:255/255.0 alpha:0.4].CGColor,       // rgba(255, 115, 255, 0)
        (__bridge id)[UIColor colorWithRed:26/255.0 green:140/255.0 blue:255/255.0 alpha:0.6].CGColor,        // rgba(26, 140, 255, 1)
        (__bridge id)[UIColor colorWithRed:26/255.0 green:140/255.0 blue:255/255.0 alpha:0.4].CGColor       // rgba(26, 140, 255, 0)
    ];
    // 设置渐变的起始和结束点
    self.gradientLayer.startPoint = CGPointMake(0.5, 0.0);
    self.gradientLayer.endPoint = CGPointMake(0.5, 1.0);
    // 将ShapeLayer作为GradientLayer的蒙版
    self.gradientLayer.mask = self.shapeLayer;
    self.gradientLayer.locations = @[@0.0,  @0.4 ,@0.7, @1.0];
    
    self.borderLayer.path = self.shapeLayer.path;  // 使用相同的路径
    self.borderLayer.fillColor = [UIColor clearColor].CGColor; // 边界描边不需要填充
    
}



//modify 比例
-(void)setupLayout {
    CGRect screenSize = [UIScreen mainScreen].bounds;
    CGFloat screenWidth = CGRectGetWidth(screenSize);
//    [self mas_remakeConstraints:^(MASConstraintMaker *make) {
//        make.width.equalTo(@(self.viewModel.model.borderWidth));
//        make.height.equalTo(@(self.viewModel.model.borderHeight));
//        make.centerX.equalTo(@(screenWidth / 2));
//        make.bottom.equalTo(@(screenHeight));
//    }];
    [self.mainView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.top.equalTo(self).offset(12.0 * (screenWidth / 750.0));
        make.width.equalTo(self).multipliedBy(462.0/510);
        make.height.equalTo(self).multipliedBy(78.0/112);
    }];
    
    [self.label mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(self.mainView).multipliedBy(372.0 / 462.0);
        make.height.equalTo(self.mainView).multipliedBy(62.0 / 78.0);
        make.right.equalTo(self.mainView);
        make.centerY.equalTo(self.mainView);
    }];
    
    [self.rightImageView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.width.height.equalTo(self.mainView.mas_height);
        make.left.equalTo(self.mainView);
        make.centerY.equalTo(self.mainView);
    }];
}

- (UIBezierPath *)createPath {
    UIBezierPath *path = [UIBezierPath new];
    
    CGFloat cornerRadius = self.viewModel.model.cornerRadius;
    CGFloat triangleHeight = self.viewModel.model.triangleHeight;
    CGFloat triangleWidth = self.viewModel.model.triangleWidth;
    CGFloat triangleStartX =cornerRadius + (self.frame.size.width - 2 * cornerRadius - triangleWidth) / 2;
    
    [path moveToPoint:CGPointMake(cornerRadius, 0)];
    
    [path addLineToPoint:CGPointMake(self.bounds.size.width - cornerRadius, 0)];
    // 右上角
    [path addArcWithCenter:CGPointMake(self.bounds.size.width - cornerRadius, cornerRadius)
                        radius:cornerRadius
                    startAngle:M_PI * 3 / 2
                      endAngle:0
                     clockwise:YES];
        
    // 右边
    [path addLineToPoint:CGPointMake(self.bounds.size.width, self.bounds.size.height - cornerRadius - triangleHeight)];

    // 右下角
    [path addArcWithCenter:CGPointMake(self.bounds.size.width - cornerRadius, self.bounds.size.height - cornerRadius - triangleHeight)
                        radius:cornerRadius
                    startAngle:0
                      endAngle:M_PI / 2
                     clockwise:YES];
    // 底边
    [path addLineToPoint:CGPointMake(triangleStartX + triangleWidth, self.bounds.size.height - triangleHeight)];
    // 三角
    [path addLineToPoint:CGPointMake(triangleStartX + triangleWidth / 2, self.bounds.size.height)];
    [path addLineToPoint:CGPointMake(triangleStartX, self.bounds.size.height - triangleHeight)];
    [path addLineToPoint:CGPointMake(cornerRadius, self.bounds.size.height - triangleHeight)];
    // 左下角
    [path addArcWithCenter:CGPointMake(cornerRadius, self.bounds.size.height - cornerRadius - triangleHeight)
                        radius:cornerRadius
                    startAngle:M_PI / 2
                      endAngle:M_PI
                     clockwise:YES];
    // 左边
    [path addLineToPoint:CGPointMake(0, cornerRadius)];
    // 左上角
    [path addArcWithCenter:CGPointMake(cornerRadius, cornerRadius)
                        radius:cornerRadius
                    startAngle:M_PI
                      endAngle:M_PI * 3 / 2
                     clockwise:YES];
    // 关闭路径
    [path closePath];
    return path;
}
@end
