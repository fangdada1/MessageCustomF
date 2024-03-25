//
//  DivisionBattleAudioStatesMsg.m
//  Runner
//
//  Created by FY0125 on 2023/9/14.
//

#import "DivisionBattleAudioStatesMsg.h"

@implementation DivisionBattleAudioStatesMsg

@synthesize extra = _extra;

+ (instancetype)messageWithContent:(NSString *)jsonContent {
    DivisionBattleAudioStatesMsg *data = [DivisionBattleAudioStatesMsg new];
    if (data) {
        data.content = jsonContent;
    }
    
    return data;
}

//存储状态和是否计入未读数
+(RCMessagePersistent)persistentFlag {
    //存储并计入未读数
    return (MessagePersistent_ISCOUNTED);
}

#pragma mark – NSCoding protocol methods
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    if (self) {
        self.content = [aDecoder decodeObjectForKey:@"content"];
        self.extra = [aDecoder decodeObjectForKey:@"extra"]; }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:self.content forKey:@"content"];
    [aCoder encodeObject:self.extra forKey:@"extra"];
    
}

#pragma mark – RCMessageCoding delegate methods
///将消息内容编码成json
-(NSData *)encode {
    
    NSMutableDictionary *dataDict=[NSMutableDictionary dictionary];
    [dataDict setObject:self.content forKey:@"content"];
    if (self.extra) {
        [dataDict setObject:self.extra forKey:@"extra"];
    }
    
    NSData *data = [NSJSONSerialization dataWithJSONObject:dataDict
                                                   options:kNilOptions
                                                     error:nil];
    
    return data;
}

//将json解码生成消息内容
-(void)decodeWithData:(NSData *)data {
    __autoreleasing NSError* __error = nil;
    if (!data) {
        return;
    }
    NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:data
                                                               options:kNilOptions
                                                                 error:&__error];
    
    self.extra = dictionary[@"extra"];
    self.content = [[NSString alloc]initWithData:[NSJSONSerialization dataWithJSONObject:dictionary options:kNilOptions error:nil] encoding:NSUTF8StringEncoding];
    
}
//您定义的消息类型名，需要在各个平台上保持一致，以保证消息互通,别以 RC 开头，以免和融云系统冲突
+(NSString *)getObjectName {
    return @"HM:BattleAudioStatesMsg";
}

//最后一条消息是自定义消息的时候，可以更改在会话列表显示的类型，为了区分消息类型
- (NSString *)conversationDigest {
    NSString *contentStr = @"[pk闭麦状态更新融云消息]";
    return contentStr;
}
@end
