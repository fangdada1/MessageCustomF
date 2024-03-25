//
//  DivisionChangeGiftRkMsg.h
//  Runner
//
//  Created by fuya on 02/06/23.
//

#import <RongIMLibCore/RongIMLibCore.h>

NS_ASSUME_NONNULL_BEGIN

@interface DivisionChangeGiftRkMsg : RCMessageContent<NSCoding,RCMessageContentView>

@property(nonatomic,strong)NSString *content;

@property (nonatomic, copy) NSString* extra;

+(instancetype)messageWithContent:(NSString *)jsonContent;

@end

NS_ASSUME_NONNULL_END
