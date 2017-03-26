//
//  RNFLAnimatedImage.m
//  RNProjectDemo
//
//  Created by 李义真 on 2017/3/25.
//  Copyright © 2017年 李义真. All rights reserved.
//

#import "RNFLAnimatedImage.h"
#import <FLAnimatedImageView.h>
#import <RCTBridgeModule.h>
#import <RCTEventDispatcher.h>
#import <UIView+React.h>
#import <RCTLog.h>

@implementation RNFLAnimatedImage
{
    RCTEventDispatcher* _eventDispatcher;
    FLAnimatedImage* _image;
    FLAnimatedImageView* _imageView;
}
    
- (instancetype)initWithEventDispatcher:(RCTEventDispatcher *)eventDispatcher{
    if(self = [super init]){
        _eventDispatcher = eventDispatcher;
        _imageView = [[FLAnimatedImageView alloc] init];
        [self addSubview:_imageView];
        [_imageView addObserver:self forKeyPath:@"currentFrameIndex" options:0 context:nil];
    }
    return self;
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context{
    if(object == _imageView){
        if([keyPath isEqualToString:@"currentFrameIndex"]){
            if(self.onViewHandler){
                NSDictionary* dic = @{@"currentFrameIndex":[NSNumber numberWithUnsignedInteger:[object currentFrameIndex]],@"frameCount":[NSNumber numberWithUnsignedInteger:[_image frameCount]],@"target":self.reactTag};
                self.onViewHandler(@{@"myData":dic});
                
            }
        }
    }
}
    
- (void)removeFromSuperview{
    [_imageView removeObserver:self forKeyPath:@"currentFrameIndex"];
    _eventDispatcher = nil;
    [super removeFromSuperview];
}
    
- (void)reloadImage{
    
    NSString* gifSrc = @"";
    if(self.gifIndex.intValue == 1){
        gifSrc = @"lasa_gif";
    }else if (self.gifIndex.intValue == 2){
        gifSrc = @"xinjiang_gif";
    }else if (self.gifIndex.intValue == 3){
        gifSrc = @"city_gif";
    }else{
        gifSrc = @"montain_gif";
    }
    
    NSURL *url = [[NSBundle mainBundle] URLForResource:gifSrc withExtension:@"gif"];
    NSData *data = [NSData dataWithContentsOfURL:url];
    _image = [FLAnimatedImage animatedImageWithGIFData:data];
    _imageView.contentMode = [self.contentMode integerValue];
    _imageView.animatedImage = _image;
}
    
- (void)layoutSubviews{
    _imageView.frame = self.bounds;
}

- (void)setGifIndex:(NSString *)gifIndex{
    if(![_gifIndex isEqual:gifIndex]){
        _gifIndex = [gifIndex copy];
        [self reloadImage];
    }
}
    
- (void)setContentMode:(NSNumber *)contentMode{
    if(![_contentMode isEqual:contentMode]){
        _contentMode = [contentMode copy];
        [self reloadImage];
    }
}
@end





