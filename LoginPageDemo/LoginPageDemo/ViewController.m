//
//  ViewController.m
//  LoginPageDemo
//
//  Created by Theo on 2024/7/18.
//

#import <UIKit/UIKit.h>
#import "Masonry.h"

@interface ViewController : UIViewController

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor colorWithRed:245.0/255.0 green:240.0/255.0 blue:255.0/255.0 alpha:1.0];

    // Scroll View for Content
    UIScrollView *scrollView = [[UIScrollView alloc] init];
    [self.view addSubview:scrollView];
    [scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];

    // Content View (holds all elements inside the scroll view)
    UIView *contentView = [[UIView alloc] init];
    [scrollView addSubview:contentView];
    [contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(scrollView);
        make.width.equalTo(scrollView);
    }];

    // Lazada Logo
    UIImageView *logoImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"logo.png"]];
    [contentView addSubview:logoImageView];
    [logoImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(contentView).offset(80);
        make.width.equalTo(@(self.view.frame.size.width * 0.1));
        make.height.equalTo(@(self.view.frame.size.width * 0.1));
    }];

    // "Add to Cart. Add to Line." Label
    UILabel *addToCartLabel = [[UILabel alloc] init];
    addToCartLabel.text = @"Add to Cart. Add to Line.";
    addToCartLabel.textColor = [UIColor darkGrayColor];
    addToCartLabel.textAlignment = NSTextAlignmentCenter;
    [contentView addSubview:addToCartLabel];
    [addToCartLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(logoImageView.mas_bottom);
        make.leading.equalTo(logoImageView.mas_leading);
    }];

    // "Safe Privacy & Safe Payment" Label
    UILabel *safeLabel = [[UILabel alloc] init];
    safeLabel.text = @"🔒 Safe Privacy & Safe Payment";
    safeLabel.textAlignment = NSTextAlignmentCenter;
    safeLabel.textColor = [UIColor orangeColor];
    safeLabel.font = [UIFont systemFontOfSize:14];
    [contentView addSubview:safeLabel];
    [safeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(addToCartLabel.mas_bottom).offset(20);
        make.left.equalTo(contentView).offset(20);
        make.center.equalTo(scrollView);
    }];

    // Login Buttons
    NSArray *buttonTitles = @[@"Log in with Facebook", @"Log in with Google", @"Log in with Apple", @"Log in with Line"];
    NSArray *buttonImages = @[@"facebook.png", @"google.png", @"apple.png", @"line.png"]; // Replace with actual icon image names

    UIButton *previousButton = nil; // Keep track of the previous button for vertical spacing
    for (int i = 0; i < buttonTitles.count; i++) {
        UIButton *loginButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [loginButton setTitle:buttonTitles[i] forState:UIControlStateNormal];
        [loginButton setImage:[UIImage imageNamed:buttonImages[i]] forState:UIControlStateNormal];
        loginButton.titleLabel.font = [UIFont systemFontOfSize:16];
        [loginButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        loginButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        loginButton.titleEdgeInsets = UIEdgeInsetsMake(0, 20, 0, 0); // Adjust title padding
        loginButton.imageEdgeInsets = UIEdgeInsetsMake(10, 10, 10, 0); // Adjust image padding

        // Style the button (background, border, etc.)
        loginButton.backgroundColor = [UIColor colorWithRed:245 green:246 blue:249 alpha:1];
        loginButton.layer.cornerRadius = 5;
        loginButton.layer.borderWidth = 1;
        loginButton.layer.borderColor = [UIColor lightGrayColor].CGColor;

        [contentView addSubview:loginButton];

        [loginButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(previousButton ? previousButton.mas_bottom : safeLabel.mas_bottom).offset(previousButton ? 10 : 20);
            make.left.equalTo(contentView).offset(20);
            make.right.equalTo(contentView).offset(-20);
            make.height.equalTo(@50);
        }];

        previousButton = loginButton;
    }

    // "Email & Password" and "Mobile Number" Buttons
    NSArray *otherLoginTitles = @[@"Email & Password", @"Mobile Number"];
    UIButton *previousOtherButton = nil;
    for (NSString *title in otherLoginTitles) {
        UIButton *otherLoginButton = [UIButton buttonWithType:UIButtonTypeSystem];
        [otherLoginButton setTitle:title forState:UIControlStateNormal];
        [otherLoginButton setTitleColor:[UIColor systemBlueColor] forState:UIControlStateNormal];
        [contentView addSubview:otherLoginButton];

        [otherLoginButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(previousButton.mas_bottom).offset(20);
            make.centerX.equalTo(previousOtherButton ? contentView.mas_right : contentView.mas_left).multipliedBy(previousOtherButton ? 0.5 : 0.33);
            make.height.equalTo(@30);
        }];

        previousOtherButton = otherLoginButton;
    }

    // "Haven't signed up yet? Sign up now" Label
    UILabel *signUpLabel = [[UILabel alloc] init];
    signUpLabel.text = @"Haven't signed up yet? Sign up now";
    signUpLabel.textColor = [UIColor darkGrayColor];
    signUpLabel.textAlignment = NSTextAlignmentCenter;
    [contentView addSubview:signUpLabel];
    [signUpLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(previousOtherButton.mas_bottom).offset(30);
        make.centerX.equalTo(contentView);
    }];

    // Face ID Switch
    UISwitch *faceIDSwitch = [[UISwitch alloc] init];
    [contentView addSubview:faceIDSwitch];
    [faceIDSwitch mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(signUpLabel.mas_bottom).offset(30);
        make.left.equalTo(contentView).offset(20);
    }];

    UILabel *faceIDLabel = [[UILabel alloc] init];
    faceIDLabel.text = @"Enable Face ID Authentication ⓘ";
    faceIDLabel.textColor = [UIColor darkGrayColor];
    [contentView addSubview:faceIDLabel];
    [faceIDLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(faceIDSwitch);
        make.left.equalTo(faceIDSwitch.mas_right).offset(10);
    }];

    // Adjust content view's bottom constraint to include all elements
    [contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.greaterThanOrEqualTo(faceIDLabel.mas_bottom).offset(50);
    }];
}

@end
