//
//  AdMobInterCustomAD.m
//  Cfteat1
//
//  Created by Eric on 2018/10/26.
//  Copyright © 2018年 CF-NB. All rights reserved.
//

#import "AdMobInterstitialCustomAD.h"

#import <iMFAD/MFInterstitialView.h>



@implementation AdMobInterstitialCustomAD

@synthesize delegate;

/// Constant for Sample Ad Network custom event error domain.
static NSString *const customEventErrorDomain = @"com.google.CustomEvent";



- (void)requestInterstitialAdWithParameter:(NSString *)serverParameter
                                       label:(NSString *)serverLabel
                                     request:(GADCustomEventRequest *)request
{
    InterstitialView = [[MFInterstitialView alloc] init];
    InterstitialView.bannerId = serverParameter ;
    InterstitialView.delegate = self;
    [InterstitialView requestFullScreenAD];
   
}

#pragma mark GADCustomEventInterstitial implementation

- (void)onRequestItstAdSuccess{
   [InterstitialView show];
    [self interstitialDidLoad:InterstitialView];
}

- (void)onRequestItstAdFail{
    [self interstitial:InterstitialView didFailToLoadAdWithErrorCode:0];
}

- (void)onClickItst{
    [self interstitialWillLeaveApplications:InterstitialView];
}



- (void)interstitialDidLoad:(MFInterstitialView *)interstitial {
    [self.delegate customEventInterstitialDidReceiveAd:self];
    
    NSLog(@"interstitialDidReceiveAd");
    
}
- (void)presentFromRootViewController:(nonnull UIViewController *)rootViewController {
    [self.delegate customEventInterstitialWillPresent:self];
    NSLog(@"presentFromRootViewController");
}

- (void)interstitial:(MFInterstitialView *)interstitial didFailToLoadAdWithErrorCode:(int)errorCode {
    NSError *error = [NSError errorWithDomain:customEventErrorDomain code:errorCode userInfo:nil];
    [self.delegate customEventInterstitial:self didFailAd:error];
    NSLog(@"Not interstitialAd");
}

- (void)interstitialWillLeaveApplications:(MFInterstitialView *)interstitial {
    [self.delegate customEventInterstitialWasClicked:self];
    [self.delegate customEventInterstitialWillLeaveApplication:self];
    NSLog(@"click");
}


@end

