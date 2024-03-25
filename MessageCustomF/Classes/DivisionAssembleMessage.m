//
//  DivisionAssembleMessage.m
//  Runner
//
//  Created by fuya on 13/11/23.
//

#import "DivisionAssembleMessage.h"
#import <rongcloud_im_wrapper_plugin/RCIMWrapperEngine.h>
#import <RongIMLibCore/RongIMLibCore.h>
#import "DivisionEndLiveMessage.h"
#import "DivisionGiftNormalMessage.h"
#import "DivisionEndRoomMessage.h"
#import "DivisionNewEndRoomMessage.h"
#import "DivisionRoomJoinMessage.h"
#import "DivisionLiveUserMsg.h"
#import "DivisionIncomeMsg.h"
#import "DivisionUpLMsg.h"
#import "DivisionAuthorUpLMsg.h"
#import "DivisionMyFowStartMsg.h"
#import "DivisionManagerSendMsg.h"
#import "DivisionChangeGiftRkMsg.h"
#import "DivisionPkServiceMsg.h"
#import "DivisionSystemChatMsg.h"
#import "DivisionGiftWinMsg.h"
#import "DivisionActivitysMsg.h"
#import "DivisionRoomGiftWinMsg.h"
#import "DivisionRechargeMsg.h"
#import "DivisionFaceKBlanceChangeMessage.h"
#import "DivisionFaceKCancledMessage.h"
#import "DivisionFaceKEndMessage.h"
#import "DivisionFaceKInvitedMessage.h"
#import "DivisionFaceKRefuseMessage.h"
#import "DivisionFaceKStartMessage.h"
#import "DivisionFaceKRefreshUserMessage.h"
#import "DivisionFaceKBeginLiveMessage.h"
#import "DivisionKickOutMsg.h"
#import "DivisionSetAdminMsg.h"
#import "DivisionShutUpMsg.h"
#import "DivisionBanUserMsg.h"
#import "DivisionUnBanUserMsg.h"
#import "DivisionRedEnvelopeRoomMsg.h"
#import "DivisionAllRoomTipMsg.h"
#import "DivisionMessageMoment.h"
#import "DivisionMessageRoomOne.h"
#import "DivisionCurrentLiveRank.h"
#import "DivisionAssistPopMsg.h"
#import "DivisionUpLoadZgSendMsg.h"
#import "DivisionLiveCallBeginMsg.h"
#import "DivisionApplyLiveCallMsg.h"
#import "DivisionRoomLiveCallEndMsg.h"
#import "DivisionRoomLiveCallChangeMsg.h"
#import "DivisionLiveCallCancelMsg.h"
#import "DivisionPKInfoFirstGiftMsg.h"
#import "DivisionMvpToBattleMsg.h"
#import "DivisionDiamondsCriticalMsg.h"
#import "DivisionBattleAudioStatesMsg.h"
#import "DivisionBattleCriticalRewardsMsg.h"
#import "DivisionChatRoomEndMix.h"
#import "DivisionRoomStartMix.h"
#import "DivisionOfficialSystemMsg.h"
#import "DivisionAnchorWarningMsg.h"
#import "DivisonQuestWarnMsg.h"
#import "DivisionMaxMultipleMsg.h"
#import "DivisionOfficalSystemV2Msg.h"
#import "DivisionDroppedCallReminder.h"
#import "DivisionUseBattlePropMsg.h"
#import "DivisionBattleAbnormalPunishmentMsg.h"
#import "DivisionPKInfoMsgPunishmentStart.h"
//#import "DivisionCustomGifts.h"

@implementation DivisionAssembleMessage

+ (void)divisionAssembleInit {
    NSMutableArray *marr = [NSMutableArray arrayWithObject:[DivisionEndLiveMessage class]];
    [marr addObject:[DivisionGiftNormalMessage class]];
    [marr addObject:[DivisionEndRoomMessage class]];
    [marr addObject:[DivisionNewEndRoomMessage class]];
    [marr addObject:[DivisionRoomJoinMessage class]];
    [marr addObject:[DivisionLiveUserMsg class]];
    [marr addObject:[DivisionIncomeMsg class]];
    [marr addObject:[DivisionUpLMsg class]];
    [marr addObject:[DivisionAuthorUpLMsg class]];
    [marr addObject:[DivisionMyFowStartMsg class]];
    [marr addObject:[DivisionManagerSendMsg class]];
    [marr addObject:[DivisionChangeGiftRkMsg class]];
    [marr addObject:[DivisionPkServiceMsg class]];
    [marr addObject:[DivisionSystemChatMsg class]];
    [marr addObject:[DivisionGiftWinMsg class]];
    [marr addObject:[DivisionActivitysMsg class]];
    [marr addObject:[DivisionRoomGiftWinMsg class]];
    [marr addObject:[DivisionRechargeMsg class]];
    [marr addObject:[DivisionFaceKBlanceChangeMessage class]];
    [marr addObject:[DivisionFaceKCancledMessage class]];
    [marr addObject:[DivisionFaceKEndMessage class]];
    [marr addObject:[DivisionFaceKInvitedMessage class]];
    [marr addObject:[DivisionFaceKRefuseMessage class]];
    [marr addObject:[DivisionFaceKStartMessage class]];
    [marr addObject:[DivisionFaceKRefreshUserMessage class]];
    [marr addObject:[DivisionFaceKBeginLiveMessage class]];
    [marr addObject:[DivisionKickOutMsg class]];
    [marr addObject:[DivisionSetAdminMsg class]];
    [marr addObject:[DivisionShutUpMsg class]];
    [marr addObject:[DivisionBanUserMsg class]];
    [marr addObject:[DivisionUnBanUserMsg class]];
    [marr addObject:[DivisionRedEnvelopeRoomMsg class]];
    [marr addObject:[DivisionAllRoomTipMsg class]];
    [marr addObject:[DivisionMessageMoment class]];
    [marr addObject:[DivisionMessageRoomOne class]];
    [marr addObject:[DivisionCurrentLiveRank class]];
    [marr addObject:[DivisionAssistPopMsg class]];
    [marr addObject:[DivisionUpLoadZgSendMsg class]];
    [marr addObject:[DivisionLiveCallBeginMsg class]];
    [marr addObject:[DivisionApplyLiveCallMsg class]];
    [marr addObject:[DivisionRoomLiveCallEndMsg class]];
    [marr addObject:[DivisionRoomLiveCallChangeMsg class]];
    [marr addObject:[DivisionLiveCallCancelMsg class]];
    [marr addObject:[DivisionPKInfoFirstGiftMsg class]];
    [marr addObject:[DivisionMvpToBattleMsg class]];
    [marr addObject:[DivisionDiamondsCriticalMsg class]];
    [marr addObject:[DivisionBattleAudioStatesMsg class]];
    [marr addObject:[DivisionBattleCriticalRewardsMsg class]];
    [marr addObject:[DivisionChatRoomEndMix class]];
    [marr addObject:[DivisionRoomStartMix class]];
    [marr addObject:[DivisionOfficialSystemMsg class]];
    [marr addObject:[DivisionAnchorWarningMsg class]];
    [marr addObject:[DivisonQuestWarnMsg class]];
    [marr addObject:[DivisionMaxMultipleMsg class]];
    [marr addObject:[DivisionOfficalSystemV2Msg class]];
    [marr addObject:[DivisionDroppedCallReminder class]];
    [marr addObject:[DivisionUseBattlePropMsg class]];
    [marr addObject:[DivisionBattleAbnormalPunishmentMsg class]];
    [marr addObject:[DivisionPKInfoMsgPunishmentStart class]];
//    [marr addObject:[DivisionCustomGifts class]];
    
    [RCIMWrapperEngine sharedInstance].messageContentClassList = marr.copy;
}

@end
