//
//  ZRDMViewController.m
//  ZRPopoverView
//
//  Created by Victor Zhang on 10/4/16.
//  Copyright © 2016 xiaoruigege. All rights reserved.
//

#import "ZRDMViewController.h"
#import <ZRPopoverView/ZRPopoverView.h>

@interface ZRDMViewController ()<ZRPopoverViewDelegate>
- (IBAction)leftbar:(id)sender;
- (IBAction)rightbar:(id)sender;
- (IBAction)choose:(id)sender;


@property (nonatomic, strong) ZRPopoverView *popover;

@end
@implementation ZRDMViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:82.0 / 255.0 green:188.0 / 255.0 blue:248.0 / 255.0 alpha:1.0];
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent animated:YES];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)leftbar:(id)sender {
    
    NSArray *menus = @[
                       @{ kZRPopoverViewTitle: @"从相册选择", kZRPopoverViewIcon: @"btn_Inter" },
                       @{ kZRPopoverViewTitle: @"拍照", kZRPopoverViewIcon: @"btn_notice"  },
                       @{ kZRPopoverViewTitle: @"视频", kZRPopoverViewIcon: @"btn_Inter"  },
                       @{ kZRPopoverViewTitle: @"拍全景照片", kZRPopoverViewIcon: @"btn_Tele"  }
                       ];
    //    NSArray *menus = @[
    //                       @{ kZRPopoverViewTitle: @"Group Chat", kZRPopoverViewIcon: @"btn_Inter" },
    //                       @{ kZRPopoverViewTitle: @"Add Contacts", kZRPopoverViewIcon: @"btn_notice"  },
    //                       @{ kZRPopoverViewTitle: @"Scan QR Code", kZRPopoverViewIcon: @"btn_Inter"  },
    //                       @{ kZRPopoverViewTitle: @"Money", kZRPopoverViewIcon: @"btn_Tele"  }
    //                       ];
    _popover = [[ZRPopoverView alloc] initWithStyle:ZRPopoverViewStyleDefault menus:menus position:ZRPopoverViewPositionLeftOfTop];
    [_popover showWithController:self completion:^(int index) {
        NSLog(@"index = %d", index );
    }];
    
}

- (IBAction)rightbar:(id)sender {
    
    NSArray *menus = @[
                       @{ kZRPopoverViewTitle: @"创建群聊" },
                       @{ kZRPopoverViewTitle: @"私信" },
                       @{ kZRPopoverViewTitle: @"发送短信" },
                       @{ kZRPopoverViewTitle: @"直接拨打电话" },
                       @{ kZRPopoverViewTitle: @"VoIP电话" }
                       ];
    //    NSArray *menus = @[
    //                       @{ kZRPopoverViewTitle: @"To FaceBook" },
    //                       @{ kZRPopoverViewTitle: @"Send To Google" },
    //                       @{ kZRPopoverViewTitle: @"Mobile Email" },
    //                       @{ kZRPopoverViewTitle: @"Open PPT" },
    //                       @{ kZRPopoverViewTitle: @"To Call Free " }
    //                       ];
    _popover = [[ZRPopoverView alloc] initWithStyle:ZRPopoverViewStyleLightContent menus:menus position:ZRPopoverViewPositionCenterOfTop];
    _popover.delegate = self;
    [_popover showWithController:self];
}

- (IBAction)choose:(id)sender {
    
    
    //    NSArray *menus = @[
    //                       @{ kZRPopoverViewTitle: @"扫一扫" , kZRPopoverViewIcon: @"btn_Install" },
    //                       @{ kZRPopoverViewTitle: @"付款Paypal" , kZRPopoverViewIcon: @"btn_Install" },
    //                       @{ kZRPopoverViewTitle: @"发送邮件" , kZRPopoverViewIcon: @"btn_Install" },
    //                       @{ kZRPopoverViewTitle: @"选朋友聊聊天" , kZRPopoverViewIcon: @"btn_Install" },
    //                       @{ kZRPopoverViewTitle: @"AR/VR商城" , kZRPopoverViewIcon: @"btn_Install" }
    //                       ];
    NSArray *menus = @[
                       @{ kZRPopoverViewTitle: @"Payment" , kZRPopoverViewIcon: @"btn_Install" },
                       @{ kZRPopoverViewTitle: @"Using Paypal" , kZRPopoverViewIcon: @"btn_Install" },
                       @{ kZRPopoverViewTitle: @"For Messenger" , kZRPopoverViewIcon: @"btn_Install" },
                       @{ kZRPopoverViewTitle: @"Say Hello To" , kZRPopoverViewIcon: @"btn_Install" },
                       @{ kZRPopoverViewTitle: @"AR/VR Store" , kZRPopoverViewIcon: @"btn_Install" }
                       ];
    _popover = [[ZRPopoverView alloc] initWithStyle:ZRPopoverViewStyleLightContent menus:menus position:ZRPopoverViewPositionRightOfTop];
    [_popover showWithController:self completion:^(int index) {
        NSLog(@"index = %d", index );
    }];
}

@end
