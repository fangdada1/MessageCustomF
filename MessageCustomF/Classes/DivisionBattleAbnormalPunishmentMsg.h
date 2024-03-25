//
//  DivisionBattleAbnormalPunishmentMsg.h
//  Runner
//
//  Created by FY0125 on 2023/11/15.
//

#import <RongIMLibCore/RongIMLibCore.h>

NS_ASSUME_NONNULL_BEGIN

@interface DivisionBattleAbnormalPunishmentMsg : RCMessageContent
@property(nonatomic,strong)NSString* content;

@property(nonatomic, copy) NSString* extra;

+(instancetype)messageWithContent:(NSString *)jsonContent;

@end

NS_ASSUME_NONNULL_END
