
# ZRPopoverView
ZRPopoverView is a popover view that pop UIView with a list of button by customising events and contents.
#####
1.If you like invoke this events by block so that Choose No.1 .
#####
2.If you like invoke this events by delegate so that Choose No.2.

### Effect Photo
![ZRPopoverView Effect Photo 1](https://github.com/VictorZhang2014/ZRPopoverView/blob/master/pictures/ZRPopoverView_showcase_cn.gif "ZRPopoverView")

## How to get started
-----------------------------------

- [Download ZRPopoverView](https://github.com/VictorZhang2014/ZRPopoverView) try out the example app


## Installation
-----------------------------------

[CocoaPods](http://cocoapods.org) is a dependency manager for Objective-C , which anutomates and simplifies the process of using 3rd-party libraries like ZRPopoverView in you projects.

```bash
$ gem install cocoapods
```

> Cocoapods 1.0.0+ is required to build ZRPopoverView 1.2

#### podfile

To integrate ZRPopoverView into your Xcode project using Cocoapods, specify it in your `Podfile`:

```ruby
platform :ios, '7.0'  

pod 'ZRPopoverView', '~>1.2'
```
Then, run the following command:

```bash
$ pod install
```


## Usage
----------------------------------

#### Show an top of left popover menu and theme is default , which means black background and white character.   Events can invoke by block or delegate.
```objective-c
   NSArray *menus = @[
                      @{ kZRPopoverViewTitle: @"Group Chat", kZRPopoverViewIcon: @"btn_Inter" },
                      @{ kZRPopoverViewTitle: @"Add Contacts", kZRPopoverViewIcon: @"btn_notice"  },
                      @{ kZRPopoverViewTitle: @"Scan QR Code", kZRPopoverViewIcon: @"btn_Inter"  },
                      @{ kZRPopoverViewTitle: @"Money", kZRPopoverViewIcon: @"btn_Tele"  }
                      ];
    ZRPopoverView *popover = [[ZRPopoverView alloc] initWithStyle:ZRPopoverViewStyleDefault menus:menus position:ZRPopoverViewPositionLeftOfTop];
    [popover showWithController:self completion:^(int index) {
        NSLog(@"index = %d", index );
    }];
```

#### Show an top of center popover menu and theme is superficial color , which means white background and black character.  Events can invoke by block or delegate.
```objective-c
    //You can add `ZRPopoverViewDelegate` to conform this protocol
    //Only one method need to implement `- (void)popoverView:(ZRPopoverView *)popoverView didClick:(int)index;`

    NSArray *menus = @[
                       @{ kZRPopoverViewTitle: @"创建群聊" },
                       @{ kZRPopoverViewTitle: @"私信" },
                       @{ kZRPopoverViewTitle: @"发送短信" },
                       @{ kZRPopoverViewTitle: @"直接拨打电话" },
                       @{ kZRPopoverViewTitle: @"VoIP电话" }
                       ];
    ZRPopoverView *popover = [[ZRPopoverView alloc] initWithStyle:ZRPopoverViewStyleLightContent menus:menus position:ZRPopoverViewPositionCenterOfTop];
    popover.delegate = self;
    [popover showWithController:self];
```

#### Show an top of right popover menu and theme is superficial color , which means white background and black character. Events can invoke by block or delegate.
```
    NSArray *menus = @[
                       @{ kZRPopoverViewTitle: @"Payment" , kZRPopoverViewIcon: @"btn_Install" },
                       @{ kZRPopoverViewTitle: @"Using Paypal" , kZRPopoverViewIcon: @"btn_Install" },
                       @{ kZRPopoverViewTitle: @"For Messenger" , kZRPopoverViewIcon: @"btn_Install" },
                       @{ kZRPopoverViewTitle: @"Say Hello To" , kZRPopoverViewIcon: @"btn_Install" },
                       @{ kZRPopoverViewTitle: @"AR/VR Store" , kZRPopoverViewIcon: @"btn_Install" }
                       ];
    ZRPopoverView *popover = [[ZRPopoverView alloc] initWithStyle:ZRPopoverViewStyleLightContent menus:menus position:ZRPopoverViewPositionRightOfTop];
    [popover showWithController:self completion:^(int index) {
        NSLog(@"index = %d", index );
    }];
```



# ZRPopoverView
ZRPopoverView是一个非常好用的弹出菜单，使用者可以自定义内容和事件.
######
1.事件的回调，喜欢block的，请使用第一种方式
#####
2.事件的回调，喜欢delegate的，请使用第二种方式

## 如何开始
-----------------------------------

- [下载ZRPopoverView](https://github.com/VictorZhang2014/ZRPopoverView) 试一试Demo，很简单


## 安装
-----------------------------------

[CocoaPods](http://cocoapods.org) Cocoapods是一个Objective-C的库文件依赖管理器，它会自动的，简单化的集成第三方库到你的项目，例如ZRPopoverView。

```bash
$ gem install cocoapods
```

> Cocoapods 1.0.0+ is required to build ZRPopoverView 1.2

#### podfile

使用Cocoapods把ZRPopoverView库集成到你的项目，podfile文件内容如下

```ruby
source 'https://github.com/VictorZhang2014/ZRPopoverView'
platform :ios, '7.0'  

pod 'ZRPopoverView', '~>1.2'
```
接着，运行以下命令

```bash
$ pod install
```

## 使用方法
----------------------------------

#### 显示一个左上角的popover菜单，默认主题是default, 黑色背景加白色文字 ，事件回调是block，也可以是delegate
```objective-c
   NSArray *menus = @[
                      @{ kZRPopoverViewTitle: @"Group Chat", kZRPopoverViewIcon: @"btn_Inter" },
                      @{ kZRPopoverViewTitle: @"Add Contacts", kZRPopoverViewIcon: @"btn_notice"  },
                      @{ kZRPopoverViewTitle: @"Scan QR Code", kZRPopoverViewIcon: @"btn_Inter"  },
                      @{ kZRPopoverViewTitle: @"Money", kZRPopoverViewIcon: @"btn_Tele"  }
                      ];
    ZRPopoverView *popover = [[ZRPopoverView alloc] initWithStyle:ZRPopoverViewStyleDefault menus:menus position:ZRPopoverViewPositionLeftOfTop];
    [popover showWithController:self completion:^(int index) {
        NSLog(@"index = %d", index );
    }];
```

#### 显示一个上中间的popover菜单，主题是浅色，白色背景加黑色文字，事件回调可以是block，也可以是delegate
```objective-c
    //添加`ZRPopoverViewDelegate`协议并且遵循该协议的方法
    //只需要实现此方法`- (void)popoverView:(ZRPopoverView *)popoverView didClick:(int)index;`

    NSArray *menus = @[
                       @{ kZRPopoverViewTitle: @"创建群聊" },
                       @{ kZRPopoverViewTitle: @"私信" },
                       @{ kZRPopoverViewTitle: @"发送短信" },
                       @{ kZRPopoverViewTitle: @"直接拨打电话" },
                       @{ kZRPopoverViewTitle: @"VoIP电话" }
                       ];
    ZRPopoverView *popover = [[ZRPopoverView alloc] initWithStyle:ZRPopoverViewStyleLightContent menus:menus position:ZRPopoverViewPositionCenterOfTop];
    popover.delegate = self;
    [popover showWithController:self];
```

#### 显示一个右上角的Popover菜单，主题是浅色，白色背景加黑色文字，事件回调是block，也可以是delegate
```
    NSArray *menus = @[
                       @{ kZRPopoverViewTitle: @"Payment" , kZRPopoverViewIcon: @"btn_Install" },
                       @{ kZRPopoverViewTitle: @"Using Paypal" , kZRPopoverViewIcon: @"btn_Install" },
                       @{ kZRPopoverViewTitle: @"For Messenger" , kZRPopoverViewIcon: @"btn_Install" },
                       @{ kZRPopoverViewTitle: @"Say Hello To" , kZRPopoverViewIcon: @"btn_Install" },
                       @{ kZRPopoverViewTitle: @"AR/VR Store" , kZRPopoverViewIcon: @"btn_Install" }
                       ];
    ZRPopoverView *popover = [[ZRPopoverView alloc] initWithStyle:ZRPopoverViewStyleLightContent menus:menus position:ZRPopoverViewPositionRightOfTop];
    [popover showWithController:self completion:^(int index) {
        NSLog(@"index = %d", index );
    }];
```
