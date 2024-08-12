//
//  ViewController.h
//  MyChannel-V4
//
//  Created by Theo on 2024/8/5.
//

#import <UIKit/UIKit.h>
#import "HeaderView.h"
#import "FooterView.h"
#import "MyCollectionViewCell.h"
#import "GestureHandlerProtocol.h"
#import "MyChannelDataManager.h"

@interface ViewController : UIViewController <UICollectionViewDelegate , UICollectionViewDataSource , GestureHandlerProtocol>


@end

