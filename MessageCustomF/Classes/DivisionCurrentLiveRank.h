//
//  DivisionCurrentLiveRank.h
//  Runner
//
//  Created by Kylin on 2023/6/5.
//

#import <RongIMLibCore/RongIMLibCore.h>

NS_ASSUME_NONNULL_BEGIN

@interface DivisionCurrentLiveRank : RCMessageContent<NSCoding,RCMessageContentView>

@property(nonatomic,strong)NSString *content;

@property (nonatomic, copy) NSString* extra;

+(instancetype)messageWithContent:(NSString *)jsonContent;

@end

NS_ASSUME_NONNULL_END
