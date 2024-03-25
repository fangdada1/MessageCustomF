//
//  DivisionRedEnvelopeRoomMsg.m
//  Runner
//
//  Created by fuya on 23/03/23.
//

#import "DivisionRedEnvelopeRoomMsg.h"

@implementation DivisionRedEnvelopeRoomMsg
+ (instancetype)messageWithContent:(NSString *)jsonContent {
    DivisionRedEnvelopeRoomMsg *model = [DivisionRedEnvelopeRoomMsg new];
    if (model) {
        model.content = jsonContent;
    }
    
    return model;
}

//存储状态和是否计入未读数
+(RCMessagePersistent)persistentFlag {
    //存储并计入未读数
    return (MessagePersistent_ISCOUNTED);
}

#pragma mark – NSCoding protocol methods
#define KEY_TXTMSG_CONTENT @"content"
#define KEY_TXTMSG_EXTRA @"extra"

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    if (self) {
        self.content = [aDecoder decodeObjectForKey:KEY_TXTMSG_CONTENT];
        self.newExtra = [aDecoder decodeObjectForKey:KEY_TXTMSG_EXTRA]; }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:self.content forKey:KEY_TXTMSG_CONTENT];
    [aCoder encodeObject:self.newExtra forKey:KEY_TXTMSG_EXTRA];
    
}

#pragma mark – RCMessageCoding delegate methods
///将消息内容编码成json
-(NSData *)encode {
    
    NSMutableDictionary *dataDict=[NSMutableDictionary dictionary];
    [dataDict setObject:self.content forKey:@"content"];
    if (self.newExtra) {
        [dataDict setObject:self.newExtra forKey:@"extra"];
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
//    NSLog(@"dictionary == %@",dictionary);
//    if ([dictionary objectForKey:@"content"]) {
//        self.content = dictionary[@"content"];
//        NSLog(@"dictionary1111 == %@",dictionary[@"content"]);
//    }else{
        NSError *error;
        NSData *contentData = [NSJSONSerialization dataWithJSONObject:dictionary options:kNilOptions error:nil];
        NSString *content ;
        if (!data) {
            NSLog(@"%@",error);
        }else{
            content = [[NSString alloc]initWithData:contentData encoding:NSUTF8StringEncoding];
        }
        self.newExtra = dictionary[@"extra"];
        self.content = content;
//    }
    
}
//您定义的消息类型名，需要在各个平台上保持一致，以保证消息互通,别以 RC 开头，以免和融云系统冲突
+(NSString *)getObjectName {
    return @"HM:RedEnvelopeRoomMsg";
}

//最后一条消息是自定义消息的时候，可以更改在会话列表显示的类型，为了区分消息类型
- (NSString *)conversationDigest {
    NSString *contentStr = @"[红包消息]";
    return contentStr;
}
@end
