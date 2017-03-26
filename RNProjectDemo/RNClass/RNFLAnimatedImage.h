//
//  RNFLAnimatedImage.h
//  RNProjectDemo
//
//  Created by 李义真 on 2017/3/25.
//  Copyright © 2017年 李义真. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <RCTEventDispatcher.h>
#import <RCTView.h>
#import <FLAnimatedImage.h>

@interface RNFLAnimatedImage : UIView
@property(nonatomic,strong)NSString* gifIndex;
@property(nonatomic,strong)NSNumber* contentMode;
@property(nonatomic,copy)RCTDirectEventBlock onViewHandler;
- (instancetype)initWithEventDispatcher:(RCTEventDispatcher*)eventDispatcher;
- (instancetype)init NS_UNAVAILABLE;
- (instancetype)initWithFrame:(CGRect)frame NS_UNAVAILABLE;
@end
