# CYLWebViewController
WebViewControllerDemo,可App类似 Safari 的效果，能随着滑动隐藏底部工具栏
How to use：

``` Objective-C
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    WebViewController *vc = [[WebViewController alloc] init];
 NSURL *baseURL = [NSURL URLWithString:@"http://weibo.com"];
    vc.URL = baseURL;
    [self.window addSubview:vc.view];
    vc.toolbar.hidden = NO;
    self.window.rootViewController = vc;
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}
```
if you want toolBar to be hidden all the time ,you can do like this
 
``` Objective-C
    [self.window addSubview:vc.view];
    vc.toolbar.hidden = YES;
```
require  [PureLayout](https://github.com/smileyborg/PureLayout)


the Demo of [WebViewController](https://github.com/mergesort/WebViewController)
![Example screenshot](https://github.com/ChenYilong/CYLWebViewController/blob/master/webViewDemo.gif)

Check out [my weibo](http://weibo.com/luohanchenyilong/) for more info.

Check out [my twitter](https://twitter.com/stevechen1010) for more info.
