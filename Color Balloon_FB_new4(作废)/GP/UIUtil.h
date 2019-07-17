/*
 ============================================================================
 Name        : UIUtil.h
 Version     : 1.0.0
 Copyright   : 
 Description : 工具类
 ============================================================================
 */

#import <UIKit/UIKit.h>


@interface UIUtil : NSObject
{
}

+ (UIAlertView*)showWarning:(NSString*)message title:(NSString*)title delegate:(id)delegate;
+ (UIAlertView*)showQuestion:(NSString*)message title:(NSString*)title delegate:(id)delegate;

+ (void)showToast:(NSString*)text inView:(UIView*)view;

+ (void)showProgressHUD:(NSString*)text inView:(UIView*)view;
+ (void)hideProgressHUD;

@end
