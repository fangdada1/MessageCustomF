//
//  DivisionOfficialSystemMsg.h
//  Runner
//
//  Created by fuya on 16/10/23.
//

#import <RongIMLibCore/RongIMLibCore.h>

NS_ASSUME_NONNULL_BEGIN

@interface DivisionOfficialSystemMsg : RCMessageContent <NSCoding,RCMessageContentView>

@property(nonatomic,strong)NSString* content;

@property(nonatomic, copy) NSString* extra;

+(instancetype)messageWithContent:(NSString *)jsonContent;

@end

NS_ASSUME_NONNULL_END