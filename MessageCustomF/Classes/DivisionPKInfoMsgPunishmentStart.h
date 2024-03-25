//
//  DivisionPKInfoMsgPunishmentStart.h
//  Runner
//
//  Created by FY0125 on 2023/11/18.
//

#import <RongIMLibCore/RongIMLibCore.h>

NS_ASSUME_NONNULL_BEGIN

@interface DivisionPKInfoMsgPunishmentStart : RCMessageContent
@property(nonatomic,strong)NSString* content;

@property(nonatomic, copy) NSString* newExtra;

+(instancetype)messageWithContent:(NSString *)jsonContent;
@end

NS_ASSUME_NONNULL_END
