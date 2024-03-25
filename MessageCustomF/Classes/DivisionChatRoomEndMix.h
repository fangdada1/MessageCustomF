//
//  DivisionChatRoomEndMix.h
//  Runner
//
//  Created by fuya on 16/10/23.
//

#import <RongIMLibCore/RongIMLibCore.h>

NS_ASSUME_NONNULL_BEGIN

@interface DivisionChatRoomEndMix : RCMessageContent <NSCoding,RCMessageContentView>

@property(nonatomic,strong)NSString* content;

@property(nonatomic, copy) NSString* newExtra;

+(instancetype)messageWithContent:(NSString *)jsonContent;

@end

NS_ASSUME_NONNULL_END
