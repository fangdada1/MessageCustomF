//
//  DivisonQuestWarnMsg.h
//  Runner
//
//  Created by FY0125 on 2023/10/23.
//

#import <RongIMLibCore/RongIMLibCore.h>

NS_ASSUME_NONNULL_BEGIN

@interface DivisonQuestWarnMsg : RCMessageContent <NSCoding,RCMessageContentView>
@property(nonatomic,strong)NSString* content;

@property(nonatomic, copy) NSString* newExtra;

+(instancetype)messageWithContent:(NSString *)jsonContent;
@end

NS_ASSUME_NONNULL_END
