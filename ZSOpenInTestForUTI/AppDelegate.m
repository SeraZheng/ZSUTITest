//
//  AppDelegate.m
//  ZSOpenInTestForUTI
//
//  Created by bv-zheng on 12/25/15.
//  Copyright © 2015 Sera. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    NSLog(@"%@", launchOptions);
    
    return YES;
}

#pragma mark -
#pragma mark Image view

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

///////////////////////////////////////////////////////////////////////////////////////////////////////////
#pragma mark -
#pragma mark Quick Look

//#if __IPHONE_OS_VERSION_MAX_ALLOWED < __IPHONE_9_0
//- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(nullable NSString *)sourceApplication annotation:(id)annotation
//{
//    UINavigationController *navigation = (UINavigationController *)application.keyWindow.rootViewController;
//    [navigation popToRootViewControllerAnimated:NO];
//    
//    ViewController *displayController = (ViewController *)navigation.topViewController;
//    displayController.fileURL = url;
//    
//    QLPreviewController *preview = [[QLPreviewController alloc] initWithNibName:nil bundle:nil];
//    preview.dataSource = displayController;
//    preview.delegate = displayController;
//    [preview setCurrentPreviewItemIndex:0];
//    
//    [navigation pushViewController:preview animated:YES];
//    return YES;
//}
//
//#else
//- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url options:(nonnull NSDictionary<NSString *,id> *)options
//{
//    UINavigationController *navigation = (UINavigationController *)application.keyWindow.rootViewController;
//    [navigation popToRootViewControllerAnimated:NO];
//    
//    ViewController *displayController = (ViewController *)navigation.topViewController;
//    displayController.fileURL = url;
//    
//    QLPreviewController *preview = [[QLPreviewController alloc] initWithNibName:nil bundle:nil];
//    preview.dataSource = displayController;
//    preview.delegate = displayController;
//    [preview setCurrentPreviewItemIndex:0];
//    
//    [navigation pushViewController:preview animated:YES];
//    return YES;
//}
//#endif

@end
