//
//  DivisionEndLiveMessage.m
//  Runner
//
//  Created by himi on 31/01/23.
//

#import "DivisionEndLiveMessage.h"

@implementation DivisionEndLiveMessage

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
        self.extra = dic[@"extra"];
    }else{
        self.content = [[NSString alloc]initWithData:[NSJSONSerialization dataWithJSONObject:dic options:kNilOptions error:nil] encoding:NSUTF8StringEncoding];
    }
}

+ (instancetype)messageWithContent:(NSString *)jsonContent {
    DivisionEndLiveMessage *endData = [DivisionEndLiveMessage new];
    if (endData) {
        endData.content = jsonContent;
    }
    
    return endData;
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
    return @"HM:LiveEnd";
}

//直播间结束界面通知消息
- (NSString *)conversationDigest {
    return @"[Live End]";
}

//存储状态和是否计入未读数
+(RCMessagePersistent)persistentFlag {
    return (MessagePersistent_ISCOUNTED);
}


@end
