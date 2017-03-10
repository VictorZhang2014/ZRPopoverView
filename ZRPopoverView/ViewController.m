//
//  ViewController.m
//  ZRPopoverView
//
//  Created by VictorZhang on 9/12/16.
//  Copyright © 2016 xiaoruigege. All rights reserved.
//

#import "ViewController.h"
#import "ZRPopoverView.h"

@interface ViewController ()<ZRPopoverViewDelegate, UITableViewDataSource, UITableViewDelegate>
- (IBAction)leftBar:(id)sender;

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) NSArray *demoList;

@property (nonatomic, strong)  ZRPopoverView *popover;

- (IBAction)showMenus:(id)sender;

- (IBAction)showCameraSelection:(id)sender;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:82.0 / 255.0 green:188.0 / 255.0 blue:248.0 / 255.0 alpha:1.0];
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent animated:YES];
    
    CGFloat bW = 100;
    CGFloat bH = 45;
    CGFloat bX = (self.view.frame.size.width - bW) / 2;
    UIButton *titleView =  [[UIButton alloc] initWithFrame:CGRectMake(bX, 0, bW, bH)];
    [titleView setTitle:@"CHOOSE" forState:UIControlStateNormal];
    [titleView.titleLabel setFont:[UIFont systemFontOfSize:14]];
    [titleView addTarget:self action:@selector(titleViewClick) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.titleView = titleView;
    
    
    
    _tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    [self.view addSubview:_tableView];
    
}

- (IBAction)showCameraSelection:(id)sender {
    
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

- (void)titleViewClick
{
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

- (IBAction)showMenus:(id)sender {
    
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

#pragma mark - ZRPopoverViewDelegate
- (void)popoverView:(ZRPopoverView *)popoverView didClick:(int)index
{
    NSLog(@"index = %d", index);
}


#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 15;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *reuseStr = @"reuseStr";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseStr];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:reuseStr];
    }
    cell.textLabel.text = @"Victor Zhang";
    cell.detailTextLabel.text = @"I'm visiting the Imperial Palace.";
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (IBAction)leftBar:(id)sender {
}
@end
