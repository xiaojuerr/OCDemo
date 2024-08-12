//
//  ItemList.h
//  MyChannel-V4
//
//  Created by Theo on 2024/8/5.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
typedef NS_ENUM(NSUInteger, ChannelStatus) {
    ChannelStatusNormal = 0,
    ChannelStatusEdit,
    ChannelStatusAllEdit
};

@interface ItemList : NSObject

@property (nonatomic, strong) NSString *actionUrl;
@property (nonatomic, strong) NSString *bgEndColor;
@property (nonatomic, strong) NSString *bgStartColor;
@property (nonatomic, strong) NSString *isTop;
@property (nonatomic, strong) NSArray *itemList;
@property (nonatomic, strong) NSString *key;
@property (nonatomic, strong) NSString *linkBgImgUrl;
@property (nonatomic, strong) NSString *linkText;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSArray *titleExtend;
@property (nonatomic, assign) NSUInteger type;
@property (nonatomic, assign) ChannelStatus status;

@end

NS_ASSUME_NONNULL_END
