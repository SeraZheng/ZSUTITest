# ZSUTITest
Test for UTI.<br/>
This is a demo for presenting how to register document types and handle data from third-party Apps.

#Register `Document types`
![Register CFBundleDocumentTypes](https://github.com/SeraZheng/ZSUTITest/blob/master/ScreenShot/Screen%20Shot%202015-12-29%20at%2010.09.14.png)

#Result after run
![Display Document types](https://github.com/SeraZheng/ZSUTITest/blob/master/ScreenShot/Screen%20Shot%202015-12-29%20at%2010.09.51.png)

#Open Image
![Display app icon](https://github.com/SeraZheng/ZSUTITest/blob/master/ScreenShot/Screen%20Shot%202015-12-29%20at%2011.38.27.png)

#Open PDF
![None](https://github.com/SeraZheng/ZSUTITest/blob/master/ScreenShot/Screen%20Shot%202015-12-29%20at%2011.43.02.png)

#Callback
Handle files open from thirdy-party Apps.

```Objective-C
#if __IPHONE_OS_VERSION_MAX_ALLOWED < __IPHONE_9_0
- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(nullable NSString *)sourceApplication annotation:(id)annotation
{
    UINavigationController *navigation = (UINavigationController *)application.keyWindow.rootViewController;
    ViewController *displayController = (ViewController *)navigation.topViewController;
    
    [displayController.imageView setImage:[UIImage imageWithData:[NSData dataWithContentsOfURL:url]]];
    [displayController.label setText:sourceApplication];
    
    return YES;
}

#else
- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url options:(nonnull NSDictionary<NSString *,id> *)options
{
    UINavigationController *navigation = (UINavigationController *)application.keyWindow.rootViewController;
    ViewController *displayController = (ViewController *)navigation.topViewController;
    
    [displayController.imageView setImage:[UIImage imageWithData:[NSData dataWithContentsOfURL:url]]];
    [displayController.label setText:[options objectForKey:UIApplicationOpenURLOptionsSourceApplicationKey]];
    
    return YES;
}
#endif

```
