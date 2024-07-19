//
//  ViewController.m
//  LoginPageDemo2
//
//  Created by Theo on 2024/7/18.
//

#import "ViewController.h"
#import "Masonry.h"
#import "GradientView.h"
#import "SignInPage.h"
@interface ViewController ()
@property (nonatomic , strong) UIView *topView;
@property (nonatomic , strong) UIScrollView *scrollView;
@property (nonatomic , strong) UIView *bottomView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _topView = [UIView new];
    _scrollView = [UIScrollView new];
    //_bottomView = [UIView new];
    
    CGFloat screenWidth = CGRectGetWidth(self.view.bounds);
    CGFloat screenHeight = CGRectGetHeight(self.view.bounds);
    
    _topView.frame = CGRectMake(0, 0, screenWidth, screenHeight * 0.3);
    _scrollView.frame = CGRectMake(0, screenHeight * 0.3, screenWidth, screenHeight * 0.7);
   
   // _bottomView.frame = CGRectMake(0, screenHeight * 0.95, screenWidth, screenHeight * 0.05);
    //[_scrollView setBackgroundColor:[UIColor lightGrayColor]];
    [self setupTopView];
    [self setupScrollView];
    //[self setupButtomView];
    
    
    [self.view addSubview:_topView];
    [self.view addSubview:_scrollView];
    [self.view addSubview:_bottomView];
    // Do any additional setup after loading the view.
}
-(void)setupTopView
{
    GradientView *gradientView = [[GradientView alloc] initWithFrame:_topView.frame];
    [_topView addSubview:gradientView];
    UIImageView *logoImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"logo.png"]];
    UIImageView *lazadaImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"lazada.png"]];
    UILabel *logoLabel = [UILabel new];
    [logoLabel setText:@"Add to Cart. Add to Life"];
    [logoLabel setFont:[UIFont fontWithName:@"EuclidCircularA" size:100]];
    logoLabel.textAlignment = NSTextAlignmentCenter;
    logoLabel.adjustsFontSizeToFitWidth = YES;
    logoLabel.textColor = [UIColor colorWithRed:15/255.0 green:20/255.0 blue:109/255.0 alpha:1.0];
    UIView *logView = [UIView new];
    [_topView addSubview:logView];
    [logView addSubview:logoImage];
    [logView addSubview:lazadaImage];
    [logView addSubview:logoLabel];
    
    [logView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self->_topView);
        make.centerY.equalTo(self->_topView);
        make.width.equalTo(self->_topView).multipliedBy(0.4);
        make.height.equalTo(self->_topView).multipliedBy(0.1);
    }];
    
    [logoImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.bottom.equalTo(logView);
        make.width.equalTo(logView).multipliedBy(0.2);
    }];
    [lazadaImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.top.bottom.equalTo(logView);
        make.width.equalTo(logView).multipliedBy(0.7);
    }];
    
    [logoLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(logView.mas_bottom).offset(5);
        make.left.right.equalTo(logView);
        make.width.equalTo(logView);
    }];
   
}


-(void)setupScrollView
{
    //设置safe视图
    UIView *labelView = [UIView new];
    [_scrollView addSubview:labelView];
    UIImageView  *subtractImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"subtract.png"]];
    subtractImage.contentMode = UIViewContentModeScaleAspectFit;
    [labelView addSubview:subtractImage];
    
    UILabel *safeLabel = [UILabel new];
    [safeLabel setText:@"Safe Privacy & Safe Payment"];
    safeLabel.textColor = [UIColor colorWithRed:191/255.0 green:129/255.0 blue:65/255.0 alpha:1.0];
    [safeLabel setFont:[UIFont fontWithName:@"Euclid Circular A Bold" size:100]];
    safeLabel.textAlignment = NSTextAlignmentCenter;
    safeLabel.adjustsFontSizeToFitWidth = YES;
    [labelView addSubview:safeLabel];
    
    
    [labelView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self->_scrollView);
        make.top.equalTo(self->_scrollView).offset(10);
        make.width.equalTo(self->_scrollView).multipliedBy(0.5);
        make.height.equalTo(self->_scrollView).multipliedBy(0.05);
    }];
    [subtractImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(labelView);
        make.left.equalTo(labelView);
        make.width.equalTo(labelView).multipliedBy(0.1);
        make.height.equalTo(labelView).multipliedBy(0.7);
    }];
    [safeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(labelView);
        make.centerY.equalTo(subtractImage);
        make.width.equalTo(labelView).multipliedBy(0.85);
        make.height.equalTo(labelView).multipliedBy(1);
    }];
    
    //设置登录Button
    UIView *buttonView = [UIView new];
    //[buttonView setBackgroundColor:[UIColor redColor]];
    [_scrollView addSubview:buttonView];
    
    UIButton *facebookLoginButton = [self setupButtonWithTitle:@"Log in with Facebook" withIcon:[UIImage imageNamed:@"facebook.png"]];
    UIButton *googleLoginButton = [self setupButtonWithTitle:@"Log in with Google" withIcon:[UIImage imageNamed:@"google.png"]];
    UIButton *appleLoginButton = [self setupButtonWithTitle:@"Log in with Apple" withIcon:[UIImage imageNamed:@"apple.png"]];
    UIButton *lineLoginButton = [self setupButtonWithTitle:@"Log in with Line" withIcon:[UIImage imageNamed:@"line.png"]];
    [buttonView addSubview:facebookLoginButton];
    [buttonView addSubview:googleLoginButton];
    [buttonView addSubview:appleLoginButton];
    [buttonView addSubview:lineLoginButton];
    
    [buttonView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(labelView.mas_bottom).offset(10);
        make.height.equalTo(self->_scrollView).multipliedBy(0.5);
        make.centerX.equalTo(self->_scrollView);
        make.width.equalTo(self->_scrollView).multipliedBy(0.95);
            }];
    [facebookLoginButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.width.equalTo(buttonView);
        make.height.equalTo(buttonView).multipliedBy(0.18);
        make.centerX.equalTo(buttonView);
    }];
    [googleLoginButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(facebookLoginButton.mas_bottom).offset(15);
        make.height.equalTo(facebookLoginButton);
        make.centerX.equalTo(facebookLoginButton);
        make.width.equalTo(facebookLoginButton);
    }];
    [appleLoginButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(googleLoginButton.mas_bottom).offset(15);
        make.height.equalTo(facebookLoginButton);
        make.centerX.equalTo(facebookLoginButton);
        make.width.equalTo(facebookLoginButton);
    }];
    [lineLoginButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(appleLoginButton.mas_bottom).offset(15);
        make.height.equalTo(facebookLoginButton);
        make.centerX.equalTo(facebookLoginButton);
        make.width.equalTo(facebookLoginButton);
    }];
    
    //设置提示视图
    UIView *hintView = [UIView new];
    //[hintView setBackgroundColor:[UIColor yellowColor]];
    UIView *separatorView = [[UIView alloc] init];
    separatorView.backgroundColor = [UIColor colorWithRed:198/255.0 green:202/255.0 blue:210/255.0 alpha:1.0];
    [hintView addSubview:separatorView];
    NSDictionary *underlineAttribute = @{NSUnderlineStyleAttributeName: @(NSUnderlineStyleSingle)};
    [_scrollView addSubview:hintView];
    UIButton *emailButton = [UIButton buttonWithType:(UIButtonTypeSystem)];
    [emailButton setTitle:@"Email & Password" forState:(UIControlStateNormal)];
    [emailButton setTitleColor:[UIColor colorWithRed:30/255.0 green:113/255.0 blue:255/255.0 alpha:1.0] forState:(UIControlStateNormal)];
    emailButton.titleLabel.font = [UIFont fontWithName:@"Euclid Circular A Regular" size:10];
    emailButton.titleLabel.adjustsFontSizeToFitWidth = YES;
    emailButton.titleLabel.contentMode = UIViewContentModeScaleAspectFit;
    emailButton.titleLabel.attributedText = [[NSAttributedString alloc] initWithString: emailButton.titleLabel.text attributes:underlineAttribute];
    [emailButton addTarget:self action:@selector(emailSignUp:) forControlEvents:(UIControlEventTouchUpInside)];
    UIButton *mobileButton = [UIButton buttonWithType:(UIButtonTypeSystem)];
    [mobileButton setTitle:@"Mobile Number" forState:(UIControlStateNormal)];
    [mobileButton setTitleColor:[UIColor colorWithRed:30/255.0 green:113/255.0 blue:255/255.0 alpha:1.0] forState:(UIControlStateNormal)];
    mobileButton.titleLabel.font = [UIFont fontWithName:@"Euclid Circular A Regular" size:8];
    mobileButton.titleLabel.adjustsFontSizeToFitWidth = YES;
    mobileButton.titleLabel.contentMode = UIViewContentModeScaleAspectFit;
    mobileButton.titleLabel.attributedText = [[NSAttributedString alloc] initWithString: mobileButton.titleLabel.text attributes:underlineAttribute];
    [mobileButton addTarget:self action:@selector(mobileSignUp:) forControlEvents:(UIControlEventTouchUpInside)];
    
    [hintView addSubview:emailButton];
    [hintView addSubview:mobileButton];
    
    [hintView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(buttonView.mas_bottom);
        make.centerX.equalTo(self->_scrollView);
        make.height.equalTo(self->_scrollView).multipliedBy(0.05);
        make.width.equalTo(self->_scrollView).multipliedBy(0.7);
    }];
    [emailButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.equalTo(hintView);
        make.height.equalTo(hintView);
        make.width.equalTo(hintView).multipliedBy(0.45);
    }];
    [mobileButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.right.equalTo(hintView);
        make.height.equalTo(hintView);
        make.width.equalTo(hintView).multipliedBy(0.45);
    }];
    [mobileButton.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(emailButton.titleLabel.mas_width);
        make.height.equalTo(emailButton.titleLabel.mas_height);
    }];
    [separatorView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.centerY.equalTo(hintView);
        make.width.equalTo(@1);
        make.height.equalTo(hintView).multipliedBy(0.6);
        
    }];
    
    //设置注册视图
    UIView *signUpView = [UIView new];
    [_scrollView addSubview:signUpView];
    
    UILabel *subLabel1 = [UILabel new];
    subLabel1.text = @"Haven't signed up yet?";
    subLabel1.textColor = [UIColor colorWithRed:89/255.0 green:95/255.0 blue:109/255.0 alpha:1.0];
    subLabel1.font  = [UIFont fontWithName:@"Euclid Circular A Regular" size:2];
    subLabel1.contentMode = UIViewContentModeScaleAspectFit;
    subLabel1.adjustsFontSizeToFitWidth = YES;
    
    UIButton *signUpButton = [UIButton buttonWithType:(UIButtonTypeSystem)];
    [signUpButton setTitle:@"Sign up now" forState:(UIControlStateNormal)];
    [signUpButton setTitleColor:[UIColor colorWithRed:30/255.0 green:113/255.0 blue:255/255.0 alpha:1.0] forState:(UIControlStateNormal)];
    signUpButton.titleLabel.font = [UIFont fontWithName:@"Euclid Circular A Regular" size:2];
    signUpButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    signUpButton.titleLabel.adjustsFontSizeToFitWidth = YES;
    signUpButton.titleLabel.contentMode = UIViewContentModeScaleAspectFit;
    [signUpButton addTarget:self action:@selector(toSignUpPage) forControlEvents:(UIControlEventTouchUpInside)];
    [signUpView addSubview:subLabel1];
    [signUpView addSubview:signUpButton];
    
    [signUpView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(hintView.mas_bottom).offset(100);
        make.width.equalTo(self->_scrollView).multipliedBy(0.7);
        make.height.equalTo(facebookLoginButton).multipliedBy(0.4);
        make.centerX.equalTo(self->_scrollView);
    }];
    [subLabel1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.equalTo(signUpView);
        make.height.equalTo(signUpView);
        make.width.equalTo(signUpView).multipliedBy(0.6);
    }];
    [signUpButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(subLabel1.mas_right);
        make.height.width.equalTo(subLabel1);
    }];
    
    UIView *separatorView2 = [UIView new];
    separatorView2.backgroundColor = [UIColor colorWithRed:198/255.0 green:202/255.0 blue:210/255.0 alpha:1.0];
    [_scrollView addSubview:separatorView2];
    [separatorView2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self->_scrollView);
        make.top.equalTo(signUpView.mas_bottom).offset(10);
        make.width.equalTo(self->_scrollView).multipliedBy(0.9);
        make.height.equalTo(@1);
        
    }];
    
    UIView *switchView = [UIView new];
    [_scrollView addSubview:switchView];
    UISwitch *faceIDSwitch = [UISwitch new];
    
    UIImageView *faceIDImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"faceid.png"]];
    faceIDImage.contentMode = UIViewContentModeScaleAspectFit;
    UIImageView *questionImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"question.png"]];
    questionImage.contentMode = UIViewContentModeScaleAspectFit;
    
    UILabel *faceIDLabel = [UILabel new];
    [faceIDLabel setText:@"Enable Face ID Authentication"];
    [faceIDLabel setTextColor:[UIColor colorWithRed:46/255.0 green:51/255.0 blue:70/255.0 alpha:1.0]];
    [faceIDLabel setFont:[UIFont fontWithName:@"Euclid Circular A Regular" size:2]];
    faceIDLabel.contentMode = UIViewContentModeScaleAspectFit;
    faceIDLabel.adjustsFontSizeToFitWidth = YES;
    
    [switchView addSubview:faceIDSwitch];
    [switchView addSubview:faceIDImage];
    [switchView addSubview:questionImage];
    [switchView addSubview:faceIDLabel];
    [switchView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(separatorView2.mas_bottom).offset(10);
        make.width.equalTo(separatorView2);
        make.height.equalTo(facebookLoginButton);
        make.centerX.equalTo(self->_scrollView);
    }];
    [faceIDSwitch mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(switchView.mas_right);
        make.centerY.equalTo(faceIDImage);
        
    }];
    [faceIDImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.height.equalTo(switchView.mas_height).multipliedBy(0.3);
        make.left.equalTo(switchView);
        make.centerY.equalTo(switchView);
    }];
    [faceIDLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(faceIDImage.mas_right).offset(5);
        make.centerY.equalTo(faceIDImage.mas_centerY);
    }];
    [questionImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.height.equalTo(switchView.mas_height).multipliedBy(0.3);
        make.left.equalTo(faceIDLabel.mas_right).offset(5);
        make.centerY.equalTo(switchView);
    }];
    _scrollView.scrollEnabled = YES;

}
-(void)setupButtomView
{
    //[_bottomView setBackgroundColor:[UIColor grayColor]];
}

-(UIButton *)setupButtonWithTitle:(NSString *)title withIcon:(UIImage *)icon
{
    
    UIButton *btn = [UIButton buttonWithType:(UIButtonTypeCustom)];
    btn.layer.cornerRadius = 10;
    [btn setImage:icon forState:(UIControlStateNormal)];
    btn.imageView.contentMode = UIViewContentModeScaleAspectFit;
    
    [btn setTitle:title forState:(UIControlStateNormal)];
    [btn setTitleColor:[UIColor colorWithRed:46/255.0 green:51/255.0 blue:70/255.0 alpha:1.0] forState:(UIControlStateNormal)];
    //[btn.titleLabel setFont:[UIFont fontWithName:@"Euclid Circular A" size:100]];
    btn.titleLabel.font = [UIFont fontWithName:@"Euclid Circular A Bold" size:20];
    btn.titleLabel.adjustsFontSizeToFitWidth = YES;
    btn.titleLabel.minimumScaleFactor = 0.5;
    btn.titleLabel.contentMode = UIViewContentModeScaleAspectFit;
    [btn setBackgroundColor:[UIColor colorWithRed:245/255.0 green:246/255.0 blue:249/255.0 alpha:1.0]];
    [btn addTarget:self action:@selector(buttonTapped:) forControlEvents:(UIControlEventTouchUpInside)];
    [btn.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.height.equalTo(btn.mas_height).multipliedBy(0.6);
        make.left.equalTo(btn.mas_left).offset(5);
        make.centerY.equalTo(btn);
    }];
    btn.titleLabel.textAlignment = NSTextAlignmentCenter;
    [btn.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.centerX.equalTo(btn);
            }];
    return btn;
}
-(void)buttonTapped:(UIButton *)sender
{
    NSString *title = [sender currentTitle];
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Log in Alert!" message:title preferredStyle:(UIAlertControllerStyleAlert)];
    
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK" style:(UIAlertActionStyleDefault) handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"%@",title);
    }];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"Cancel"
                                                               style:UIAlertActionStyleCancel
                                                             handler:^(UIAlertAction * _Nonnull action) {
                                                                 // 点击Cancel按钮后的处理
                                                                 NSLog(@"Cancel");
                                                             }];
    [alertController addAction:okAction];
    [alertController addAction:cancelAction];
    [self presentViewController:alertController animated:YES completion:nil];
    
}
-(void)emailSignUp:(UIButton *)sender
{
    NSString *title = [sender currentTitle];
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Log in by Other Eamil!" message:title preferredStyle:(UIAlertControllerStyleAlert)];
    
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK" style:(UIAlertActionStyleDefault) handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"%@",title);
    }];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"Cancel"
                                                               style:UIAlertActionStyleCancel
                                                             handler:^(UIAlertAction * _Nonnull action) {
                                                                 // 点击Cancel按钮后的处理
                                                                 NSLog(@"Cancel");
                                                             }];
    [alertController addAction:okAction];
    [alertController addAction:cancelAction];
    [self presentViewController:alertController animated:YES completion:nil];
}

-(void)mobileSignUp:(UIButton *)sender
{
    NSString *title = [sender currentTitle];
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Log in by Mobile Phone!" message:title preferredStyle:(UIAlertControllerStyleAlert)];
    
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK" style:(UIAlertActionStyleDefault) handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"%@",title);
    }];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"Cancel"
                                                               style:UIAlertActionStyleCancel
                                                             handler:^(UIAlertAction * _Nonnull action) {
                                                                 // 点击Cancel按钮后的处理
                                                                 NSLog(@"Cancel");
                                                             }];
    [alertController addAction:okAction];
    [alertController addAction:cancelAction];
    [self presentViewController:alertController animated:YES completion:nil];
}
-(void)toSignUpPage
{
    SignInPage *modalViewController = [[SignInPage alloc] initWithNibName:nil bundle:nil];
    modalViewController.modalPresentationStyle = UIModalPresentationOverFullScreen;
    [self presentViewController:modalViewController animated:YES completion:nil];
    
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
        
        CGFloat contentHeight = 0;
        
        for (UIView *subview in _scrollView.subviews) {
            CGFloat bottom = CGRectGetMaxY(subview.frame);
            contentHeight = MAX(contentHeight, bottom);
        }
        
        _scrollView.contentSize = CGSizeMake(CGRectGetWidth(self.view.bounds), contentHeight + 20); 
}
@end


