//
//  ViewController.m
//  ZSOpenInTestForUTI
//
//  Created by bv-zheng on 12/25/15.
//  Copyright © 2015 Sera. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (NSInteger)numberOfPreviewItemsInPreviewController:(QLPreviewController *)controller
{
    return 1;
}

- (id<QLPreviewItem>)previewController:(QLPreviewController *)controller previewItemAtIndex:(NSInteger)index
{
    return self.fileURL;
}

- (CGRect)previewController:(QLPreviewController *)controller frameForPreviewItem:(id<QLPreviewItem>)item inSourceView:(UIView *__autoreleasing  _Nullable *)view
{
    return self.view.bounds;
}

- (void)previewControllerWillDismiss:(QLPreviewController *)controller
{
    [self.label setText:[self.fileURL lastPathComponent]];
}

@end
