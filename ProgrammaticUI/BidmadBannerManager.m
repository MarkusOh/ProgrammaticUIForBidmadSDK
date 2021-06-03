//
//  BidmadBannerManager.m
//  ProgrammaticUI
//
//  Created by Seungsub Oh on 2021/06/03.
//

#import "BidmadBannerManager.h"

@implementation BidmadBannerManager{
    BIDMADBanner *bidmadBanner;
    OpenBiddingBanner *openBiddingBanner;
}

-(id)initForBannerOption:(BannerOption)bannerOption parentVC:(UIViewController *)parentVC uiView:(UIView *)uiView zoneId:(NSString *)zoneId refreshInterval:(NSNumber *)refreshInterval{
    self = [super init];
    
    switch (bannerOption) {
        case BannerOptionBidmad:
            bidmadBanner = [[BIDMADBanner alloc] initWithParentViewController:parentVC rootView:uiView bannerSize:banner_320_50];
            bidmadBanner.zoneID = zoneId;
            bidmadBanner.refreshInterval = [refreshInterval intValue];
            bidmadBanner.delegate = self;
            break;
            
        case BannerOptionOpenBidding:
            openBiddingBanner = [[OpenBiddingBanner alloc] initWithParentViewController:parentVC rootView:uiView bannerSize:banner_320_50];
            openBiddingBanner.zoneID = zoneId;
            openBiddingBanner.refreshInterval = [refreshInterval intValue];
            openBiddingBanner.delegate = self;
            break;
    }
    
    return self;
}

-(void)bannerLoad{
    if (bidmadBanner != nil) {
        [bidmadBanner requestBannerView];
    }
    if (openBiddingBanner != nil) {
        [openBiddingBanner requestBannerView];
    }
}

-(void)bannerRemove{
    if (bidmadBanner != nil) {
        [bidmadBanner removeAds];
    }
    if (openBiddingBanner != nil) {
        [openBiddingBanner removeAds];
    }
}

-(void)setZoneId:(NSString *)zoneId{
    if(bidmadBanner != nil){
        [bidmadBanner setZoneID:zoneId];
    }
    if(openBiddingBanner != nil){
        [openBiddingBanner setZoneID:zoneId];
    }
}

-(void)BIDMADBannerLoad:(BIDMADBanner *)core{
    if(self.callbackLabel != nil){
        [self.callbackLabel setText:[NSString stringWithFormat:@"%s", __FUNCTION__]];
    }
}

-(void)BIDMADOpenBiddingBannerLoad:(OpenBiddingBanner *)core{
    if(self.callbackLabel != nil){
        [self.callbackLabel setText:[NSString stringWithFormat:@"%s", __FUNCTION__]];
    }
}

@end
