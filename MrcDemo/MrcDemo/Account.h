//
//  Account.h
//  MrcDemo
//
//  Created by Theo on 2024/7/2.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
typedef struct {
    int year;
    int month;
    int day;
}THEODate;
@interface Account : NSObject
@property (nonatomic , retain)NSString *userName;
@property (nonatomic , retain)NSString *password;
@property (nonatomic , assign)THEODate registDate;
@end

NS_ASSUME_NONNULL_END
