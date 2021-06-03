//
//  BidmadBannerManager.h
//  ProgrammaticUI
//
//  Created by Seungsub Oh on 2021/06/03.
//

@import UIKit;
@import BidmadSDK;
@import OpenBiddingHelper;

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, BannerOption) {
    BannerOptionOpenBidding,
    BannerOptionBidmad
};

@interface BidmadBannerManager : NSObject<BIDMADBannerDelegate, BIDMADOpenBiddingBannerDelegate>

@property (weak, nonatomic) UILabel *callbackLabel;

-(id)initForBannerOption:(BannerOption)bannerOption parentVC:(UIViewController *)parentVC uiView:(UIView *)uiView zoneId:(NSString *)zoneId refreshInterval:(NSNumber *)refreshInterval;
-(void)bannerLoad;
-(void)bannerRemove;
-(void)setZoneId:(NSString *)zoneId;
-(void)BIDMADBannerLoad:(BIDMADBanner *)core;
-(void)BIDMADOpenBiddingBannerLoad:(OpenBiddingBanner *)core;

@end

NS_ASSUME_NONNULL_END
