//
//  DivisionGiftWinMsg.h
//  Runner
//
//  Created by Kylin on 2023/2/20.
//

#import <RongIMLibCore/RongIMLibCore.h>

NS_ASSUME_NONNULL_BEGIN

@interface DivisionGiftWinMsg : RCMessageContent <NSCoding,RCMessageContentView>

@property(nonatomic,strong)NSString *content;

@property (nonatomic, copy) NSString* extra;

+(instancetype)messageWithContent:(NSString *)jsonContent;

@end

NS_ASSUME_NONNULL_END
