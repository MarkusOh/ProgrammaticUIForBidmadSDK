//
//  ViewController.m
//  ProgrammaticUI
//
//  Created by Seungsub Oh on 2021/06/01.
//

#import "ViewController.h"
#import "BidmadBannerManager.h"

@interface ViewController () {
    NSString *defaultCallbackString;
    NSString *defaultZoneId;
    
    UITextField *zoneIdTextField;
    UILabel *callbackLabel;
    UILabel *failTestLabel;
    UIButton *bannerTestStartButton;
    UIButton *cleanBannerButton;
    UIButton *presentVCButton;
    UIView *innerContainerView;
    UIView *innerInnerContainer1;
    UIView *adViewContainer;
    UIView *adView;
    UIView *buttonContainer1;
    UIView *buttonContainer2;
    UIView *buttonContainer3;
    
    BidmadBannerManager *bidmadBannerManager;
}

@end

@implementation ViewController

-(void)viewDidLoad{
    [super viewDidLoad];
    
    defaultCallbackString = @"NO CALLBACK";
    [self uiSetting];
    
    defaultZoneId = @"5cab1c9b-1831-4434-9365-5f36ea488f67";
    bidmadBannerManager = [[BidmadBannerManager alloc] initForBannerOption:BannerOptionBidmad parentVC:self uiView:adView zoneId:defaultZoneId refreshInterval:@60];
}

-(void)bannerTestLoadClicked{
    [bidmadBannerManager bannerLoad];
}

-(void)cleanBannerClicked{
    [bidmadBannerManager bannerRemove];
}

-(void)presentVCClicked{
    
}

-(void)textFieldDidChange:(UITextField *)textField{
    defaultZoneId = textField.text;
}

-(void)uiSetting{
    [self.view setBackgroundColor: UIColor.whiteColor];
    
    zoneIdTextField = [[UITextField alloc] init];
    callbackLabel = [[UILabel alloc] init];
    failTestLabel = [[UILabel alloc] init];
    bannerTestStartButton = [[UIButton alloc] init];
    cleanBannerButton = [[UIButton alloc] init];
    innerContainerView = [[UIView alloc] init];
    presentVCButton = [[UIButton alloc] init];
    innerInnerContainer1 = [[UIView alloc] init];
    adViewContainer = [[UIView alloc] init];
    adView = [[UIView alloc] init];
    
    // A Boolean value that determines whether the view’s autoresizing mask is translated into Auto Layout constraints.
    [zoneIdTextField setTranslatesAutoresizingMaskIntoConstraints:NO];
    [zoneIdTextField setTextAlignment:NSTextAlignmentCenter];
    [zoneIdTextField setPlaceholder:@"Enter Your Zone ID"];
    [zoneIdTextField setFont: [UIFont systemFontOfSize:24]];
    [zoneIdTextField addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
    
    callbackLabel = [[UILabel alloc] init];
    [callbackLabel setTranslatesAutoresizingMaskIntoConstraints:NO];
    [callbackLabel setFont: [UIFont systemFontOfSize:24]];
    [callbackLabel setText: defaultCallbackString];
    [callbackLabel setTextAlignment:NSTextAlignmentCenter];
    
    [bannerTestStartButton setTranslatesAutoresizingMaskIntoConstraints:NO];
    [bannerTestStartButton setBackgroundColor: UIColor.systemBlueColor];
    [bannerTestStartButton setTitle:@"Banner Load" forState:UIControlStateNormal];
    [bannerTestStartButton.layer setCornerRadius:3];
    [bannerTestStartButton.layer setShadowColor:UIColor.grayColor.CGColor];
    [bannerTestStartButton.layer setShadowOffset:CGSizeMake(0, 3)];
    [bannerTestStartButton.layer setShadowOpacity:0.6];
    [bannerTestStartButton.layer setMasksToBounds:NO];
    [bannerTestStartButton.layer setShadowRadius:5];
    [bannerTestStartButton addTarget:self action:@selector(bannerTestLoadClicked) forControlEvents:UIControlEventTouchUpInside];
    
    [cleanBannerButton setTranslatesAutoresizingMaskIntoConstraints:NO];
    [cleanBannerButton setBackgroundColor: UIColor.systemTealColor];
    [cleanBannerButton setTitle:@"Banner Clean" forState:UIControlStateNormal];
    [cleanBannerButton.layer setCornerRadius:3];
    [cleanBannerButton.layer setShadowColor:UIColor.grayColor.CGColor];
    [cleanBannerButton.layer setShadowOffset:CGSizeMake(0, 3)];
    [cleanBannerButton.layer setShadowOpacity:0.6];
    [cleanBannerButton.layer setMasksToBounds:NO];
    [cleanBannerButton.layer setShadowRadius:5];
    [cleanBannerButton addTarget:self action:@selector(cleanBannerClicked) forControlEvents:UIControlEventTouchUpInside];
    
    [presentVCButton setTranslatesAutoresizingMaskIntoConstraints:NO];
    [presentVCButton setBackgroundColor: UIColor.systemYellowColor];
    [presentVCButton setTitle:@"Present VC" forState:UIControlStateNormal];
    [presentVCButton.layer setCornerRadius:3];
    [presentVCButton.layer setShadowColor:UIColor.grayColor.CGColor];
    [presentVCButton.layer setShadowOffset:CGSizeMake(0, 3)];
    [presentVCButton.layer setShadowOpacity:0.6];
    [presentVCButton.layer setMasksToBounds:NO];
    [presentVCButton.layer setShadowRadius:5];
    [presentVCButton addTarget:self action:@selector(presentVCClicked) forControlEvents:UIControlEventTouchUpInside];
    
    [innerContainerView setTranslatesAutoresizingMaskIntoConstraints:NO];
    [innerInnerContainer1 setTranslatesAutoresizingMaskIntoConstraints:NO];
    [adViewContainer setTranslatesAutoresizingMaskIntoConstraints:NO];
    [adView setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    buttonContainer1 = [[UIView alloc] init];
    [buttonContainer1 setTranslatesAutoresizingMaskIntoConstraints:NO];
    buttonContainer2 = [[UIView alloc] init];
    [buttonContainer2 setTranslatesAutoresizingMaskIntoConstraints:NO];
    buttonContainer3 = [[UIView alloc] init];
    [buttonContainer3 setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    /**---------------------------UIView Closer to RootVC-----------------------------*/
    
    [self.view addSubview: callbackLabel];
    [self.view addSubview: zoneIdTextField];
    [self.view addSubview: innerContainerView];
    
    [innerContainerView addSubview: innerInnerContainer1];
    [innerContainerView addSubview: adViewContainer];
    
    [innerInnerContainer1 addSubview: buttonContainer1];
    [innerInnerContainer1 addSubview: buttonContainer2];
    [innerInnerContainer1 addSubview: buttonContainer3];
    [adViewContainer addSubview:adView];
    
    [buttonContainer1 addSubview: bannerTestStartButton];
    [buttonContainer2 addSubview: cleanBannerButton];
    [buttonContainer3 addSubview: presentVCButton];
    
    /**---------------------------UIView On Top-----------------------------*/
    
    [NSLayoutConstraint activateConstraints:
     @[
         [zoneIdTextField.topAnchor constraintEqualToAnchor:self.view.layoutMarginsGuide.topAnchor],
         [zoneIdTextField.centerXAnchor constraintEqualToAnchor:self.view.layoutMarginsGuide.centerXAnchor],
         [callbackLabel.bottomAnchor constraintEqualToAnchor:self.view.layoutMarginsGuide.bottomAnchor constant: -30],
         [callbackLabel.centerXAnchor constraintEqualToAnchor:self.view.layoutMarginsGuide.centerXAnchor],
         [innerContainerView.bottomAnchor constraintEqualToAnchor:callbackLabel.topAnchor],
         [innerContainerView.topAnchor constraintEqualToAnchor:zoneIdTextField.bottomAnchor],
         [innerContainerView.widthAnchor constraintEqualToAnchor:self.view.widthAnchor],
         [innerInnerContainer1.topAnchor constraintEqualToAnchor:innerContainerView.topAnchor],
         [innerInnerContainer1.widthAnchor constraintEqualToAnchor:innerContainerView.widthAnchor],
         [innerInnerContainer1.heightAnchor constraintEqualToAnchor:innerContainerView.heightAnchor multiplier:0.5],
         [adViewContainer.topAnchor constraintEqualToAnchor:innerInnerContainer1.bottomAnchor],
         [adViewContainer.bottomAnchor constraintEqualToAnchor:innerContainerView.bottomAnchor],
         [adViewContainer.widthAnchor constraintEqualToAnchor:innerContainerView.widthAnchor],
         [adViewContainer.heightAnchor constraintEqualToAnchor:innerContainerView.heightAnchor multiplier:0.5],
         [buttonContainer1.topAnchor constraintEqualToAnchor:innerInnerContainer1.topAnchor],
         [buttonContainer1.widthAnchor constraintEqualToAnchor:innerInnerContainer1.widthAnchor],
         [buttonContainer1.heightAnchor constraintEqualToAnchor:innerInnerContainer1.heightAnchor multiplier:0.33],
         [buttonContainer2.topAnchor constraintEqualToAnchor:buttonContainer1.bottomAnchor],
         [buttonContainer2.widthAnchor constraintEqualToAnchor:innerInnerContainer1.widthAnchor],
         [buttonContainer2.heightAnchor constraintEqualToAnchor:innerInnerContainer1.heightAnchor multiplier:0.33],
         [buttonContainer3.topAnchor constraintEqualToAnchor:buttonContainer2.bottomAnchor],
         [buttonContainer3.widthAnchor constraintEqualToAnchor:innerInnerContainer1.widthAnchor],
         [buttonContainer3.heightAnchor constraintEqualToAnchor:innerInnerContainer1.heightAnchor multiplier:0.33],
         [bannerTestStartButton.widthAnchor constraintEqualToAnchor:buttonContainer1.widthAnchor multiplier:0.5],
         [bannerTestStartButton.centerXAnchor constraintEqualToAnchor:buttonContainer1.centerXAnchor],
         [bannerTestStartButton.centerYAnchor constraintEqualToAnchor:buttonContainer1.centerYAnchor],
         [cleanBannerButton.widthAnchor constraintEqualToAnchor:buttonContainer2.widthAnchor multiplier:0.5],
         [cleanBannerButton.centerXAnchor constraintEqualToAnchor:buttonContainer2.centerXAnchor],
         [cleanBannerButton.centerYAnchor constraintEqualToAnchor:buttonContainer2.centerYAnchor],
         [presentVCButton.widthAnchor constraintEqualToAnchor:buttonContainer3.widthAnchor multiplier:0.5],
         [presentVCButton.centerXAnchor constraintEqualToAnchor:buttonContainer3.centerXAnchor],
         [presentVCButton.centerYAnchor constraintEqualToAnchor:buttonContainer3.centerYAnchor],
         [adView.centerYAnchor constraintEqualToAnchor:adViewContainer.centerYAnchor],
         [adView.centerXAnchor constraintEqualToAnchor:adViewContainer.centerXAnchor],
         [adView.widthAnchor constraintEqualToAnchor:adViewContainer.widthAnchor],
     ]];
}

@end
