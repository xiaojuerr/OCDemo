//
//  Assistant.h
//  MsgForward
//
//  Created by Theo on 2024/7/16.
//

#import <Foundation/Foundation.h>
#import "Person.h"
NS_ASSUME_NONNULL_BEGIN

@interface Assistant : NSObject
@property (nonatomic, weak) Person *person;
@end

NS_ASSUME_NONNULL_END
