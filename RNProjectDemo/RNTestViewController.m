//
//  RNTestViewController.m
//  RNProjectDemo
//
//  Created by 李义真 on 2017/3/23.
//  Copyright © 2017年 李义真. All rights reserved.
//

#import "RNTestViewController.h"
#import <RCTRootView.h>

@interface RNTestViewController ()
@property(nonatomic,strong)RCTRootView* rootView;
@end

@implementation RNTestViewController
- (instancetype)init
{
    if(self = [super init])
    {
        NSURL *jsCodeLocation = [NSURL
                                 URLWithString:@"http://localhost:8081/index.ios.bundle?platform=ios"];
        
        self.rootView = [[RCTRootView alloc] initWithBundleURL:jsCodeLocation moduleName:@"RNProjectDemo" initialProperties:nil launchOptions:nil];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.view addSubview:self.rootView];
    
    self.rootView.frame = self.view.bounds;
}
@end
