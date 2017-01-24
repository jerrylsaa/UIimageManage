//
//  UIImage+ImageManage.h
//  UIimageManage
//
//  Created by jerry on 17/1/16.
//  Copyright © 2017年 Shuai. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (ImageManage)

//图片旋转
-(UIImage*)ImageRotateIndegree:(float)degree;


//图片剪切
-(UIImage*)ImageCutSize:(CGRect)rect;


//图片剪切圆形
-(UIImage*)ImageClipCircle;

//图片拉伸
-(UIImage *)imageScaleSize:(CGSize)size;

@end
