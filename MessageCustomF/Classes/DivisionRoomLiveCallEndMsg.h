//
//  DivisionRoomLiveCallEndMsg.h
//  Runner
//
//  Created by FY0125 on 2023/8/30.
//

#import <RongIMLibCore/RongIMLibCore.h>

NS_ASSUME_NONNULL_BEGIN

@interface DivisionRoomLiveCallEndMsg : RCMessageContent<NSCoding,RCMessageContentView>
@property(nonatomic,strong)NSString *content;

@property (nonatomic, copy) NSString* newExtra;

+(instancetype)messageWithContent:(NSString *)jsonContent;
@end

NS_ASSUME_NONNULL_END
