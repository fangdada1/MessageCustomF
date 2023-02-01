//
//  DivisionGiftNormalMessage.m
//  Runner
//
//  Created by himi on 31/01/23.
//

#import "DivisionGiftNormalMessage.h"

@implementation DivisionGiftNormalMessage

-(NSData *)encode {
    
    NSMutableDictionary *dataDict=[NSMutableDictionary dictionary];
    [dataDict setObject:self.content forKey:@"content"];
    if (self.extra) {
        [dataDict setObject:self.extra forKey:@"extra"];
    }
    
    return [NSJSONSerialization dataWithJSONObject:dataDict
                                           options:kNilOptions
                                             error:nil];
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
        self.extra = dic[@"extra"];
    }else{
        self.content = [[NSString alloc]initWithData:[NSJSONSerialization dataWithJSONObject:dic options:kNilOptions error:nil] encoding:NSUTF8StringEncoding];
    }
}

+ (instancetype)messageWithContent:(NSString *)jsonContent {
    DivisionGiftNormalMessage *giftData = [DivisionGiftNormalMessage new];
    if (giftData) {
        giftData.content = jsonContent;
    }
    return giftData;
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
    return @"HM:NormalGift";
}

-(NSString *)conversationDigest {
    return @"[Gift Info]";
}


//存储状态和是否计入未读数
+(RCMessagePersistent)persistentFlag {
    return (MessagePersistent_ISCOUNTED);
}

@end
