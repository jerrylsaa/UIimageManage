//
//  UIView+imageScreenShot.m
//  UIimageManage
//
//  Created by jerry on 17/1/24.
//  Copyright © 2017年 Shuai. All rights reserved.
//

#import "UIView+imageScreenShot.h"

@implementation UIView (imageScreenShot)
#pragma mark---  //屏幕截屏

-(UIImage*)imageScreenShot{
    
    UIGraphicsBeginImageContext(self.frame.size);
    
    [self.layer  renderInContext:UIGraphicsGetCurrentContext()];
    
    UIImage  *imageNew = UIGraphicsGetImageFromCurrentImageContext();
    
    
    UIGraphicsEndImageContext();
    return imageNew;
    
}


@end
