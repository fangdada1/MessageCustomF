//
//  DivisionNewEndRoomMessage.m
//  Runner
//
//  Created by himi on 31/01/23.
//

#import "DivisionNewEndRoomMessage.h"

@implementation DivisionNewEndRoomMessage
@synthesize extra = _extra;
-(NSData *)encode {
    
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    [dic setObject:self.content forKey:@"content"];
    if (self.extra) {
        [dic setObject:self.extra forKey:@"extra"];
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
    self.extra = dic[@"extra"];
    self.content = [[NSString alloc]initWithData:[NSJSONSerialization dataWithJSONObject:dic options:kNilOptions error:nil] encoding:NSUTF8StringEncoding];
}

+ (instancetype)messageWithContent:(NSString *)jsonContent {
    DivisionNewEndRoomMessage *newData = [DivisionNewEndRoomMessage new];
    if (newData) {
        newData.content = jsonContent;
    }
    
    return newData;
}


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

+(NSString *)getObjectName {
    return @"HM:LiveEnd_Grade";
}

//[直播间结束消息]
- (NSString *)conversationDigest {
    return @"[New End Room]";
}

//存储状态和是否计入未读数
+(RCMessagePersistent)persistentFlag {
    return (MessagePersistent_ISCOUNTED);
}

@end
