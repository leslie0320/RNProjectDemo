//
//  RNFLAnimatedImageManager.m
//  RNProjectDemo
//
//  Created by 李义真 on 2017/3/25.
//  Copyright © 2017年 李义真. All rights reserved.
//

#import "RNFLAnimatedImageManager.h"
#import "RNFLAnimatedImage.h"
#import <RCTBridge.h>


@implementation RNFLAnimatedImageManager
RCT_EXPORT_MODULE();
	
@synthesize bridge = _bridge;
- (UIView*)view
{
    return [[RNFLAnimatedImage alloc] initWithEventDispatcher:self.bridge.eventDispatcher];
}

- (dispatch_queue_t)methodQueue
{
    return dispatch_get_main_queue();
}
    
//向JS侧面暴露属性
RCT_EXPORT_VIEW_PROPERTY(contentMode,NSNumber);
RCT_EXPORT_VIEW_PROPERTY(gifIndex,NSString);
RCT_EXPORT_VIEW_PROPERTY(onViewHandler,RCTDirectEventBlock);

- (NSArray*)customDirectEventTypes
{
    return @[@"onFrameChange"];
}

- (NSDictionary*)constantsToExport{
    return @{
             @"ScaleAspectFit":@(UIViewContentModeScaleAspectFit),
             @"ScaleAspectFill":@(UIViewContentModeScaleAspectFill),
             @"ScaleToFit":@(UIViewContentModeScaleToFill)
             };
}
@end
