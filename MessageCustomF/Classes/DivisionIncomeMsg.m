//
//  IncomeRoomMsg.m
//  Runner
//
//  Created by Kylin on 2022/10/20.
//

#import "DivisionIncomeMsg.h"

@implementation DivisionIncomeMsg

+ (instancetype)messageWithContent:(NSString *)jsonContent {
    DivisionIncomeMsg *data = [DivisionIncomeMsg new];
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
        self.fuyaExtra = [aDecoder decodeObjectForKey:@"extra"]; }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:self.content forKey:@"content"];
    [aCoder encodeObject:self.fuyaExtra forKey:@"extra"];
    
}

#pragma mark – RCMessageCoding delegate methods
///将消息内容编码成json
-(NSData *)encode {
    
    NSMutableDictionary *dataDict=[NSMutableDictionary dictionary];
    [dataDict setObject:self.content forKey:@"content"];
    if (self.fuyaExtra) {
        [dataDict setObject:self.fuyaExtra forKey:@"extra"];
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
    if ([dictionary objectForKey:@"content"]) {
        self.content = dictionary[@"content"];
        self.fuyaExtra = dictionary[@"extra"];
    }else{
        self.content = [[NSString alloc]initWithData:[NSJSONSerialization dataWithJSONObject:dictionary options:kNilOptions error:nil] encoding:NSUTF8StringEncoding];
    }
    
}
//您定义的消息类型名，需要在各个平台上保持一致，以保证消息互通,别以 RC 开头，以免和融云系统冲突
+(NSString *)getObjectName {
    return @"HM:IncomeRoomMsg";
}

//最后一条消息是自定义消息的时候，可以更改在会话列表显示的类型，为了区分消息类型
- (NSString *)conversationDigest {
    NSString *contentStr = @"[直播间收益消息]";
    return contentStr;
}

@end
