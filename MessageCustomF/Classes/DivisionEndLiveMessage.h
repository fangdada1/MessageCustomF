//
//  DivisionEndLiveMessage.h
//  Runner
//
//  Created by himi on 31/01/23.
//

#import <RongIMLibCore/RongIMLibCore.h>

NS_ASSUME_NONNULL_BEGIN

@interface DivisionEndLiveMessage : RCMessageContent <NSCoding,RCMessageContentView>

@property(nonatomic,strong)NSString *content;

+(instancetype)messageWithContent:(NSString *)jsonContent;

@end

NS_ASSUME_NONNULL_END
