//
//  DivisionFaceKCancledMessage.m
//  Runner
//
//  Created by fuya on 07/03/23.
//

#import "DivisionFaceKCancledMessage.h"

@implementation DivisionFaceKCancledMessage

+ (instancetype)messageWithContent:(NSString *)jsonContent {
    DivisionFaceKCancledMessage *facekData = [DivisionFaceKCancledMessage new];
    if (facekData) {
        facekData.content = jsonContent;
    }
    
    return facekData;
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
    
    NSMutableDictionary *dic=[NSMutableDictionary dictionary];
    [dic setObject:self.content forKey:@"content"];
    if (self.fuyaExtra) {
        [dic setObject:self.fuyaExtra forKey:@"extra"];
    }
    
    NSData *data = [NSJSONSerialization dataWithJSONObject:dic
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
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data
                                                               options:kNilOptions
                                                                 error:&__error];
    if ([dic objectForKey:@"content"]) {
        self.content = dic[@"content"];
        self.fuyaExtra = dic[@"extra"];
    }else{
        self.content = [[NSString alloc]initWithData:[NSJSONSerialization dataWithJSONObject:dic options:kNilOptions error:nil] encoding:NSUTF8StringEncoding];
    }
    
}
//您定义的消息类型名，需要在各个平台上保持一致，以保证消息互通,别以 RC 开头，以免和融云系统冲突
+(NSString *)getObjectName {
    return @"HM:PKInfoMsgCancel";
}

//最后一条消息是自定义消息的时候，可以更改在会话列表显示的类型，为了区分消息类型
- (NSString *)conversationDigest {
    return @"[pk cancel]";
}

@end
