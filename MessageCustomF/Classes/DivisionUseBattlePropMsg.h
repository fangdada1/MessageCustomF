//
//  DivisionUseBattlePropMsg.h
//  Runner
//
//  Created by Kylin on 2023/11/8.
//

#import <RongIMLibCore/RongIMLibCore.h>

NS_ASSUME_NONNULL_BEGIN

@interface DivisionUseBattlePropMsg : RCMessageContent<NSCoding,RCMessageContentView>

@property(nonatomic,strong)NSString* content;

@property(nonatomic, copy) NSString* fuyaExtra;

+(instancetype)messageWithContent:(NSString *)jsonContent;

@end

NS_ASSUME_NONNULL_END
