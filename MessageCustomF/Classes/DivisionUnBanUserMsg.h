//
//  CouponInfoGiftMsg.h
//  Runner
//
//  Created by Kylin on 2022/11/25.
//

#import <RongIMLibCore/RongIMLibCore.h>

NS_ASSUME_NONNULL_BEGIN

@interface DivisionUnBanUserMsg : RCMessageContent <NSCoding,RCMessageContentView>

@property(nonatomic,strong)NSString *content;

@property (nonatomic, copy) NSString* fuyaExtra;

+(instancetype)messageWithContent:(NSString *)jsonContent;

@end

NS_ASSUME_NONNULL_END
