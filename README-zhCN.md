# DoubleNavigationController

[![Platform](https://img.shields.io/cocoapods/p/DoubleNavigationController.svg?style=flat)](https://cocoapods.org/?q=doublenavigationcontroller)
[![Version](https://img.shields.io/cocoapods/v/DoubleNavigationController.svg?style=flat)](https://cocoapods.org/?q=doublenavigationcontroller)
[![License MIT](https://img.shields.io/badge/license-MIT-green.svg?style=flat)](https://github.com/RyanLeeLY/DoubleNavigationController/blob/master/LICENSE)
[![Gmail](https://img.shields.io/badge/Gmail-@liyaoxjtu2013-red.svg?style=flat)](mail://liyaoxjtu2013@gmail.com)

## 些许疑问
* 为什么要开发这个库？

`UINavigationController`在苹果官方文档上的是这样介绍的:

> A navigation controller is a container view controller that manages one or more child view controllers in a navigation interface. 

![UINavigationController](https://docs-assets.developer.apple.com/published/83ef757907/navigation_interface_2x_8f059f7f-2e2f-4c86-8468-7402b7b3cfe0.png)

也就是说`UINavigationController `是作为`UIViewController`的管理者，因此它的NavigationBar不应该从属于任何一个ViewController。但是大部分UI设计者都没有明白苹果设计的用意，因此在业务中经常出现一个场景：在逻辑上应该从属于**同一个NavigationController**的**多个ViewController**却拥有**不同的NavigationBar样式**。

不同页面的开发者只能看到对自己开发的便利性，对`UINavigationController`的理解不到位，到处修改NavigationBar样式，在页面专场过程中NavigationBar出现了各种不可控的问题。这个问题在App支持路由后会变得更为突出，原因是各个页面的跳转关系将会非常复杂且不可预知。

**DoubleNavigationController**解决的便是这个问题，让开发者自由地修改NavigationBar样式，并且不用担心在退回到栈下ViewController后NavigationBar的样式也被修改。简单来说就是，我们修改NavigationBar不再会影响栈内现有的页面样式，而只影响之后Push的新页面。

![Example](https://github.com/RyanLeeLY/DoubleNavigationController/blob/master/Resource/architecture.jpeg)

* 为什么不设计成既不影响栈内现有的页面样式，也不影响新页面？

在这里先讲一下**DoubleNavigationController**的两个设计思想**“先到先得”**、**“谁用谁修改”**。

### “先到先得”
先出现的页面样式不应该受到后出现的页面影响。用户在使用过程中先看到了页面A的样式，接着从A页面跳转到B页面，B页面的导航栏样式与A页面不同，这时用户再返回A页面，从正常逻辑上来说，用户希望看到的A页面导航栏应该还是之前见过的样式，不应该受到B的影响而改变。

![Example](https://github.com/RyanLeeLY/DoubleNavigationController/blob/master/Resource/001.jpeg)

### “谁用谁修改”
继续上面一个场景，用户从页面A到页面B，再从页面B跳转到页面C，在上一个场景下我们知道，页面B修改了导航栏样式，使其与页面A不同，当我们跳转到页面C时，此时存在如下两种可能：

1. 页面C也对刚才B页面修改过的导航栏样式属性进行了修改。

2. 页面C没有对刚才B页面修改过的导航栏样式属性进行修改。

在第1种情况下我们很容易确定，C页面的导航栏样式就应该是C页面自己修改的样式。那么在第2种情况下，C页面导航栏应该长什么样？

![Example](https://github.com/RyanLeeLY/DoubleNavigationController/blob/master/Resource/002.jpeg)

再考虑以下3种方案：**跟A页面一样？跟UIAppearance配置一样？跟B页面一样？**

**C页面导航栏跟A页面一样？**

这个方案在逻辑上就是错误的，因为C页面根本不应该关心它的上上一个页面样式。如下图，假设B页面有两条跳转路径A1和A2，此时C页面的样式就有2种可能，相信绝大多数App的设计都不会出现**“1个页面，2种UI”**的情况吧。

![Example](https://github.com/RyanLeeLY/DoubleNavigationController/blob/master/Resource/003.jpeg)

**C页面导航栏跟UIAppearance配置一样？**

让C页面保持和UIAppearance配置一致，这里也存在两个问题，一个问题是如果用户没有配置UIAppearance怎么办？

还有一个更大的问题是，这么做似乎破坏了苹果对于`UINavigationController`的定义，这就使得导航栏在逻辑上成为了单个页面所独立持有的个体，在这种情况下倒不如隐藏系统NavigationBar，每个页面是实现一个自己的导航栏来个更方便维护。

**C页面导航栏跟B页面一样？**

保持和B页面一样，粗略一想，这和“跟A页面一样？”方案似乎是差不多的，但实际上这两种方案有着本质区别。“跟B页面一样”换一个更好的说法应该是“跟最近一次用户对导航栏修改之后的样式一样”，也就是说C页面只需要关注导航栏本身，而不需要关注谁修改了导航栏，这样一来就满足来上述的设计思想 **“谁用谁修改”**。

## 实现

关于这个库的实现，笔者在这里参考了美团点评的这篇文章[iOS系统中导航栏的转场解决方案与最佳实践](https://tech.meituan.com/2018/10/25/navigation-transition-solution-and-best-practice-in-meituan.html)。

> 在转场的过程中隐藏原有的导航栏并添加假的 NavigationBar，当转场结束后删除假的 NavigationBar 并恢复原有的导航栏，这一过程可以通过 Swizzle 的方式完成，而每个 ViewController 只需要关心自身的样式即可。

**DoubleNavigationController**核心的解决方案与这篇文章提到的是一样的，但是在实现方式和细节上可能与文章中提到的并不一样，另外有一些实现细节在美团点评的这篇文章中并没有过多地透露。

## 几个细节

细节1：**DoubleNavigationController**中选择直接`NSKeyedArchiver`来复制一个FakeNavigationBar而并没有自定义UIView。

细节2：有些时候一个页面的NavigationBar可能会在用户交互过程中动态变化，因此我们需要记录每一次用户对NavigationBar外观的修改，并在适当的时候对FakeNavigationBar外观也进行更新。

细节3：由于`UIAppearance`的原理是在UIView被添加到视图树后才会去改变对象的外观，因此在使用FakeNavigationBar之前需要再一次和当前的navigationBar进行一次UIAppearance属性的复制。参考：[iOS UIAppearance 探秘 — HyanCat's](https://hyancat.com/posts/2016/04/13/UIAppearance/)

![Example](https://github.com/RyanLeeLY/DoubleNavigationController/blob/master/Resource/hf5r9.jpeg)

## 例子

clone这个仓库，进到`Example`目录下执行`pod install`来运行一个demo。

![Example](https://github.com/RyanLeeLY/DoubleNavigationController/blob/master/Resource/example_high.gif)

## 用法

通过在ViewController中实现`dbn_configNavigationController`这个方法来定制导航栏样式。

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

你还可以使用`dbn_performBatchUpdates:`这个方法来随时更新导航栏样式。

```
[self dbn_performBatchUpdates:^(UINavigationController * _Nullable navigationController) {
    if (navigationController) {
        navigationController.navigationBar.tintColor = [UIColor purpleColor];
    }
}];
```

## 参考

[iOS系统中导航栏的转场解决方案与最佳实践](https://tech.meituan.com/2018/10/25/navigation-transition-solution-and-best-practice-in-meituan.html)

[UIKit UIAppearance - APPLE](https://developer.apple.com/documentation/uikit/uiappearance)

[iOS UIAppearance 探秘 — HyanCat's](https://hyancat.com/posts/2016/04/13/UIAppearance/)

## 证书

DoubleNavigationController is available under the MIT license. See the [LICENSE](https://github.com/RyanLeeLY/DoubleNavigationController/blob/master/LICENSE) file for more info.
