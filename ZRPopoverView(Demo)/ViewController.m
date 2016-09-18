//
//  ViewController.m
//  ZRPopoverView(Demo)
//
//  Created by VictorZhang on 9/18/16.
//  Copyright © 2016 xiaoruigege. All rights reserved.
//

#import "ViewController.h"
#import <ZRPopoverView/ZRPopoverView.h>

@interface ViewController ()<ZRPopoverViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(rightBarClick)];

}

- (void)rightBarClick
{
    NSArray *menus = @[
                       @{ kZRPopoverViewTitle: @"扫一扫", kZRPopoverViewIcon : @"btn_Install" }
                       ];
    ZRPopoverView *popover = [[ZRPopoverView alloc] initWithStyle:ZRPopoverViewStyleLightContent menus:menus position:ZRPopoverViewPositionRightOfTop];
    popover.delegate = self;
    [popover showWithController:self];
}



#pragma mark - ZRPopoverViewDelegate
- (void)popoverView:(ZRPopoverView *)popoverView didClick:(int)index
{
    if (index == 0) {
        
    }
}

@end
