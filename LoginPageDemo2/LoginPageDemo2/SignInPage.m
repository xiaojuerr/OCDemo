//
//  SignInPage.m
//  LoginPageDemo2
//
//  Created by Theo on 2024/7/19.
//

#import "SignInPage.h"

@interface SignInPage ()

@end

@implementation SignInPage

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor grayColor]];
    UIView *view = [[UIView alloc] initWithFrame:(CGRectMake(20, 20, 100, 100))];
    [view setBackgroundColor:[UIColor redColor]];
    [self.view addSubview:view];
    
    UIButton * button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [button setFrame:CGRectMake(130, 50, 60, 20)];
        [button setTitle:@"返回" forState:UIControlStateNormal];
        [button addTarget:self action:@selector(back ) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:button];
    // Do any additional setup after loading the view.
}


-(void)back
{
    //[self dismissModalViewControllerAnimated:YES];6.0 不能用
    [self dismissViewControllerAnimated:YES completion:^{
        
        NSLog(@"back");//这里打个断点，点击按钮模态视图移除后会回到这里
        
    }];
}
 


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
