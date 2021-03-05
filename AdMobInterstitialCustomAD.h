//
//  AdMobInterCustomAD.h
//  Cfteat1
//
//  Created by Eric on 2018/10/26.
//  Copyright © 2018年 CF-NB. All rights reserved.
//



#import <Foundation/Foundation.h>
#import <iMFAD/MFInterstitialView.h>
@import GoogleMobileAds;
@interface AdMobInterstitialCustomAD : NSObject<GADCustomEventInterstitial,MFInterstitialViewDelegate>
{
    MFInterstitialView *InterstitialView;
}

@property(nonatomic, assign)id delegate;
@end
