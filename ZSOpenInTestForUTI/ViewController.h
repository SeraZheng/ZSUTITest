//
//  ViewController.h
//  ZSOpenInTestForUTI
//
//  Created by bv-zheng on 12/25/15.
//  Copyright © 2015 Sera. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuickLook/QuickLook.h>

@interface ViewController : UIViewController <QLPreviewControllerDataSource, QLPreviewControllerDelegate>

@property (weak, nonatomic) IBOutlet UILabel *label;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (copy, nonatomic) NSURL *fileURL;

@end

