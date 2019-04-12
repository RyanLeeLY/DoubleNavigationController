# DoubleNavigationController

[![Platform](https://img.shields.io/cocoapods/p/DoubleNavigationController.svg?style=flat)](https://cocoapods.org/?q=doublenavigationcontroller)
[![Version](https://img.shields.io/cocoapods/v/DoubleNavigationController.svg?style=flat)](https://cocoapods.org/?q=doublenavigationcontroller)
[![License MIT](https://img.shields.io/badge/license-MIT-green.svg?style=flat)](https://github.com/RyanLeeLY/DoubleNavigationController/blob/master/LICENSE)
[![Gmail](https://img.shields.io/badge/Gmail-@liyaoxjtu2013-red.svg?style=flat)](mail://liyaoxjtu2013@gmail.com)

## Introduction

[中文文档](https://github.com/RyanLeeLY/DoubleNavigationController/blob/master/README-zhCN.md)

As we all known, `UINavigationController` is a container view controller that manages one or more child view controllers in a navigation interface. Sometimes, we just wanna update the appearance in current view controller instead of affecting the whole app. DoubleNavigationController is a library that can solve the problem above.

## Architecture

We can think of `UINavigationController` as a tree, and each node is a ViewController that managed by it. By using **DoubleNavigationController**, we can update the appearance of NavigationBar in current node without affecting its parent node's. However, its child nodes' NavigationBar will be affected. The relationship can be described as the picture below.

![Example](https://github.com/RyanLeeLY/DoubleNavigationController/blob/master/Resource/architecture.jpeg)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

![Example](https://github.com/RyanLeeLY/DoubleNavigationController/blob/master/Resource/example_high.gif)

## Usage

You can customize your navigation by implementing `dbn_configNavigationController:` in your ViewVontroller.

```objective-c
- (void)dbn_configNavigationController:(UINavigationController *)navigationController {
    [navigationController setNavigationBarHidden:NO animated:NO];
    navigationController.navigationBar.barTintColor = [UIColor whiteColor];
    navigationController.navigationBar.tintColor = [UIColor purpleColor];
    navigationController.navigationBar.titleTextAttributes = @{NSFontAttributeName: [UIFont systemFontOfSize:20], NSForegroundColorAttributeName: [UIColor redColor]};
}

- (void)dbn_configNavigationItem:(UINavigationItem *)navigationItem {
    UIBarButtonItem *btnItem = [[UIBarButtonItem alloc] initWithTitle:@"Next" style:UIBarButtonItemStylePlain target:self action:@selector(eventFromButton:)];
    navigationItem.rightBarButtonItem = btnItem;
    navigationItem.title = @"Hello";
}
```

You can also update the appearance of your app's navigation at any time by using `dbn_performBatchUpdates:` in the category of `UIViewController`.

```
[self dbn_performBatchUpdates:^(UINavigationController * _Nullable navigationController) {
    if (navigationController) {
        navigationController.navigationBar.tintColor = [UIColor purpleColor];
    }
}];
```

## Installation

DoubleNavigationController is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '8.0'

target 'TargetName' do
pod 'DoubleNavigationController'
end
```

## License

DoubleNavigationController is available under the MIT license. See the [LICENSE](https://github.com/RyanLeeLY/DoubleNavigationController/blob/master/LICENSE) file for more info.
