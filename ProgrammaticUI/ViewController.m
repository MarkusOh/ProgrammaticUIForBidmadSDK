//
//  ViewController.m
//  ProgrammaticUI
//
//  Created by Seungsub Oh on 2021/06/01.
//

#import "ViewController.h"

@interface ViewController () {
    NSString *defaultCallbackString;
    
    UITextField *zoneIdTextField;
    UILabel *callbackLabel;
    UILabel *failTestLabel;
    UIButton *bannerTestStartButton;
    UIButton *cleanBannerButton;
    UIButton *presentVCButton;
    UIView *innerContainerView;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    defaultCallbackString = @"NO CALLBACK";
    
    [self.view setBackgroundColor: UIColor.whiteColor];
    
    zoneIdTextField = [[UITextField alloc] init];
    callbackLabel = [[UILabel alloc] init];
    failTestLabel = [[UILabel alloc] init];
    bannerTestStartButton = [[UIButton alloc] init];
    cleanBannerButton = [[UIButton alloc] init];
    innerContainerView = [[UIView alloc] init];
    presentVCButton = [[UIButton alloc] init];
    
    // A Boolean value that determines whether the view’s autoresizing mask is translated into Auto Layout constraints.
    [zoneIdTextField setTranslatesAutoresizingMaskIntoConstraints:NO];
    [zoneIdTextField setTextAlignment:NSTextAlignmentCenter];
    [zoneIdTextField setPlaceholder:@"Enter Your Zone ID"];
    [zoneIdTextField setFont: [UIFont systemFontOfSize:24]];
    
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
    
    [cleanBannerButton setTranslatesAutoresizingMaskIntoConstraints:NO];
    [cleanBannerButton setBackgroundColor: UIColor.systemTealColor];
    [cleanBannerButton setTitle:@"Banner Clean" forState:UIControlStateNormal];
    [cleanBannerButton.layer setCornerRadius:3];
    [cleanBannerButton.layer setShadowColor:UIColor.grayColor.CGColor];
    [cleanBannerButton.layer setShadowOffset:CGSizeMake(0, 3)];
    [cleanBannerButton.layer setShadowOpacity:0.6];
    [cleanBannerButton.layer setMasksToBounds:NO];
    [cleanBannerButton.layer setShadowRadius:5];
    
    [presentVCButton setTranslatesAutoresizingMaskIntoConstraints:NO];
    [presentVCButton setBackgroundColor: UIColor.systemYellowColor];
    [presentVCButton setTitle:@"Present VC" forState:UIControlStateNormal];
    [presentVCButton.layer setCornerRadius:3];
    [presentVCButton.layer setShadowColor:UIColor.grayColor.CGColor];
    [presentVCButton.layer setShadowOffset:CGSizeMake(0, 3)];
    [presentVCButton.layer setShadowOpacity:0.6];
    [presentVCButton.layer setMasksToBounds:NO];
    [presentVCButton.layer setShadowRadius:5];
    
    [innerContainerView setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    UIView *innerInnerContainer1 = [[UIView alloc] init];
    [innerInnerContainer1 setTranslatesAutoresizingMaskIntoConstraints:NO];
    UIView *adViewContainer = [[UIView alloc] init];
    [adViewContainer setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    UIView *buttonContainer1 = [[UIView alloc] init];
    [buttonContainer1 setTranslatesAutoresizingMaskIntoConstraints:NO];
    UIView *buttonContainer2 = [[UIView alloc] init];
    [buttonContainer2 setTranslatesAutoresizingMaskIntoConstraints:NO];
    UIView *buttonContainer3 = [[UIView alloc] init];
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
     ]];
}


@end
