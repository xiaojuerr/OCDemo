//
//  ViewController.h
//  RunLoopDemo
//
//  Created by Theo on 2024/7/15.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (strong , nonatomic) NSThread *workerThread;
@property (strong, nonatomic) NSTimer *timer;
@end

