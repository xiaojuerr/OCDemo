//
//  GestureHandlerDelegate.h
//  MyChannel-V4
//
//  Created by Theo on 2024/8/5.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol GestureHandlerProtocol <NSObject>
@required
- (void)handleLongPress:(UILongPressGestureRecognizer *)gestureRecognizer;
- (void)handleTap:(UITapGestureRecognizer *)gestureRecognizer;
@end

NS_ASSUME_NONNULL_END
