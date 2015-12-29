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

- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url options:(nonnull NSDictionary<NSString *,id> *)options
{
    UINavigationController *navigation = (UINavigationController *)application.keyWindow.rootViewController;
    [navigation popToRootViewControllerAnimated:NO];
    
    ViewController *displayController = (ViewController *)navigation.topViewController;
    displayController.fileURL = url;
    
    QLPreviewController *preview = [[QLPreviewController alloc] initWithNibName:nil bundle:nil];
    preview.dataSource = displayController;
    preview.delegate = displayController;
    [preview setCurrentPreviewItemIndex:0];
    
    [navigation pushViewController:preview animated:YES];
    return YES;
}

@end
