//
//  ViewController.m
//  RNProjectDemo
//
//  Created by 李义真 on 2017/2/22.
//  Copyright © 2017年 李义真. All rights reserved.
//

#import "ViewController.h"
#import "RNTestViewController.h"
#import <FLAnimatedImage.h>
#import <FLAnimatedImageView.h>

@interface ViewController ()
@property(nonatomic,strong)FLAnimatedImageView* animatedImageView1;
@property(nonatomic,strong)FLAnimatedImage* animatedImage1;
	
@property(nonatomic,strong)FLAnimatedImageView* animatedImageView2;
@property(nonatomic,strong)FLAnimatedImage* animatedImage2;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CGSize buttonSize = CGSizeMake(120, 60);
    UIButton* button = [[UIButton alloc] initWithFrame:CGRectMake(CGRectGetMidX(self.view.bounds) - buttonSize.width/2.0, 60, buttonSize.width, buttonSize.height)];
    [button setTitle:@"测试按钮" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor cyanColor] forState:UIControlStateNormal];
    button.backgroundColor = [UIColor blueColor];
    [self.view addSubview:button];
    
    [button addTarget:self action:@selector(buttonClickEvent:) forControlEvents:UIControlEventTouchUpInside];
	
	self.animatedImageView1.frame = CGRectMake(0, CGRectGetMaxY(button.frame) + 10.0, CGRectGetWidth(self.view.frame), 200);
	[self.view addSubview:self.animatedImageView1];
	self.animatedImageView1.animatedImage = self.animatedImage1;
	
	self.animatedImageView2.frame = CGRectMake(0, CGRectGetMaxY(self.animatedImageView1.frame) + 10.0, CGRectGetWidth(self.view.frame), 200);
	[self.view addSubview:self.animatedImageView2];
	self.animatedImageView2.animatedImage = self.animatedImage2;
}

- (void)buttonClickEvent:(UIButton*)button
{
    RNTestViewController* viewController = [RNTestViewController new];
//    UINavigationController* navi = [[UINavigationController alloc] initWithRootViewController:self];
    
    [self presentViewController:viewController animated:YES completion:nil];
}

- (FLAnimatedImage*)animatedImage1
{
	if(_animatedImage1 == nil)
	{
		NSURL *url1 = [[NSBundle mainBundle] URLForResource:@"city_gif" withExtension:@"gif"];
		NSData *data1 = [NSData dataWithContentsOfURL:url1];
		_animatedImage1 = [FLAnimatedImage animatedImageWithGIFData:data1];
    }
    return _animatedImage1;
}

- (FLAnimatedImageView*)animatedImageView1
{
    if(_animatedImageView1 == nil)
    {
        _animatedImageView1 = [[FLAnimatedImageView alloc] init];
        _animatedImageView1.contentMode = UIViewContentModeScaleAspectFill;
        _animatedImageView1.clipsToBounds = YES;
    }
    return _animatedImageView1;
}
	
- (FLAnimatedImage*)animatedImage2
	{
		if(_animatedImage2 == nil)
		{
			NSURL *url1 = [[NSBundle mainBundle] URLForResource:@"montain_gif" withExtension:@"gif"];
			NSData *data1 = [NSData dataWithContentsOfURL:url1];
			_animatedImage2 = [FLAnimatedImage animatedImageWithGIFData:data1];
		}
		return _animatedImage2;
	}
	
- (FLAnimatedImageView*)animatedImageView2
{
	if(_animatedImageView2 == nil)
	{
		_animatedImageView2 = [[FLAnimatedImageView alloc] init];
		_animatedImageView2.contentMode = UIViewContentModeScaleAspectFill;
		_animatedImageView2.clipsToBounds = YES;
	}
	return _animatedImageView2;
}
@end
