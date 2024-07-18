//
//  ViewController.m
//  AnimationDemo
//
//  Created by Theo on 2024/7/16.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Create a view to hold the UI elements
    UIView *contentView = [[UIView alloc] initWithFrame:self.view.bounds];
    [contentView setBackgroundColor:[UIColor whiteColor]];
    [self.view addSubview:contentView];
    
    // --- Status Bar ---
    
    // Signal Strength & Battery
    UIImageView *signalImageView = [[UIImageView alloc] initWithFrame:CGRectMake(contentView.frame.size.width - 80, 30, 16, 10)];
    signalImageView.image = [UIImage imageNamed:@"signalBarsIcon"]; // Replace with your signal bar icon
    [contentView addSubview:signalImageView];



    
    // --- Welcome Message ---
    UILabel *welcomeLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 50, contentView.frame.size.width - 40, 80)];
    welcomeLabel.text = @"Hi 🛳\nWelcome Back!";
    welcomeLabel.numberOfLines = 2;
    welcomeLabel.textAlignment = NSTextAlignmentLeft;
    welcomeLabel.font = [UIFont systemFontOfSize:15];
    [contentView addSubview:welcomeLabel];

    // --- Profile Image (Lion) ---
    UIImageView *profileImageView = [[UIImageView alloc] initWithFrame:CGRectMake((contentView.frame.size.width - 100) / 2, 150, 100, 100)];
    profileImageView.image = [UIImage imageNamed:@"lazada-coin.jpeg"];
    profileImageView.contentMode = UIViewContentModeScaleAspectFit;
    [contentView addSubview:profileImageView];
    
    // --- Quick Login Button ---
    UIButton *quickLoginButton = [UIButton buttonWithType:UIButtonTypeSystem];
    quickLoginButton.frame = CGRectMake(20, 300, contentView.frame.size.width - 40, 50);
    [quickLoginButton setTitle:@"Quick Login" forState:UIControlStateNormal];
    quickLoginButton.backgroundColor = [UIColor colorWithRed:255.0/255.0 green:69.0/255.0 blue:103.0/255.0 alpha:1.0]; // Set button color
    [quickLoginButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    quickLoginButton.layer.cornerRadius = 10; // Add rounded corners
    [quickLoginButton addTarget:self action:@selector(quickLoginButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
    [contentView addSubview:quickLoginButton];

    // --- Other Options Button ---
    UIButton *otherOptionsButton = [UIButton buttonWithType:UIButtonTypeSystem];
    otherOptionsButton.frame = CGRectMake(20, 370, contentView.frame.size.width - 40, 30);
    [otherOptionsButton setTitle:@"Other Options" forState:UIControlStateNormal];
    [otherOptionsButton setTitleColor:[UIColor colorWithRed:0.0/255.0 green:122.0/255.0 blue:255.0/255.0 alpha:1.0] forState:UIControlStateNormal];
    [otherOptionsButton addTarget:self action:@selector(otherOptionsButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
    [contentView addSubview:otherOptionsButton];
    
    // --- Face ID Switch ---
    UILabel *faceIDLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 420, 200, 30)];
    faceIDLabel.text = @"Enable Face ID authentication";
    faceIDLabel.font = [UIFont systemFontOfSize:10];
    [contentView addSubview:faceIDLabel];

    UISwitch *faceIDSwitch = [[UISwitch alloc] initWithFrame:CGRectMake(contentView.frame.size.width - 70, 425, 50, 20)];
    [faceIDSwitch addTarget:self action:@selector(faceIDSwitchChanged:) forControlEvents:UIControlEventValueChanged];
    [contentView addSubview:faceIDSwitch];
    
    // --- Not You? Switch Account ---
    UIButton *switchAccountButton = [UIButton buttonWithType:UIButtonTypeSystem];
    switchAccountButton.frame = CGRectMake(20, contentView.frame.size.height - 80, contentView.frame.size.width - 40, 30);
    [switchAccountButton setTitle:@"Switch Account" forState:UIControlStateNormal];
    [switchAccountButton setTitleColor:[UIColor colorWithRed:0.0/255.0 green:122.0/255.0 blue:255.0/255.0 alpha:1.0] forState:UIControlStateNormal];
    [switchAccountButton addTarget:self action:@selector(switchAccountButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
    [contentView addSubview:switchAccountButton];

}

// --- Button Actions (You'll need to implement these) ---
- (void)closeButtonTapped:(id)sender {
    // Handle close button tap
}

- (void)quickLoginButtonTapped:(id)sender {
    // Handle quick login button tap
}

- (void)otherOptionsButtonTapped:(id)sender {
    // Handle other options button tap
}

- (void)faceIDSwitchChanged:(UISwitch *)sender {
    // Handle Face ID switch change
}

- (void)switchAccountButtonTapped:(id)sender {
    // Handle switch account button tap
}

@end

