//
//  HMViewController.m
//  02-下载进度条
//
//  Created by apple on 14-9-2.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "HMViewController.h"

#import "HMProgressView.h"

@interface HMViewController ()
@property (weak, nonatomic) IBOutlet HMProgressView *progressView;

@end

@implementation HMViewController
- (IBAction)valueChange:(UISlider *)sender {
    _progressView.progress = sender.value;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
