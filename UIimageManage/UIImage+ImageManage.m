//
//  UIImage+ImageManage.m
//  UIimageManage
//
//  Created by jerry on 17/1/16.
//  Copyright © 2017年 Shuai. All rights reserved.
//

#import "UIImage+ImageManage.h"
#import <Accelerate/Accelerate.h>
#import <QuartzCore/QuartzCore.h>


//图片剪切成圆形
@interface view : UIView
@property(nonatomic,retain)UIImage *image;
@end

@implementation view


-(void)drawRect:(CGRect)rect{
    
    CGContextRef  ctx = UIGraphicsGetCurrentContext();
    CGContextSaveGState(ctx);
    
    
    CGContextAddEllipseInRect(ctx, CGRectMake(0, 0, rect.size.width/2, rect.size.height/2));
    
    CGContextClip(ctx);
    
    CGContextFillPath(ctx);
    
    [_image drawAtPoint:CGPointMake(0, 0)];
    
    CGContextRestoreGState(ctx);
    

}



@end


@implementation UIImage (ImageManage)


#pragma mark---  图片旋转
-(UIImage*)ImageRotateIndegree:(float)degree{

    size_t  width  = (size_t)(self.size.width*self.scale);
    size_t  height = (size_t)(self.size.height*self.scale);
    
    size_t  bytePerRow = width*4;  //每行图片数据字节
    CGImageAlphaInfo  alphaInfo =  kCGImageAlphaPremultipliedFirst;
    
    //配置上下文参数
    CGContextRef  bmContext = CGBitmapContextCreate(NULL, width, height, 8, bytePerRow, CGColorSpaceCreateDeviceRGB(), kCGBitmapByteOrderDefault|alphaInfo);
    if (!bmContext) {
        return nil;
    }
    
    CGContextDrawImage(bmContext, CGRectMake(0, 0, width, height), self.CGImage);
    
     //旋转
    
    UInt8  *data = (UInt8*)CGBitmapContextGetData(bmContext);
    
    vImage_Buffer  scr  = {data,height,width,bytePerRow};
    vImage_Buffer  dest  ={data,height,width,bytePerRow};
    Pixel_8888 bgColor = {0 , 0 , 0 ,0};
    
    
    vImageRotate_ARGB8888(&scr, &dest, NULL, degree, bgColor, kvImageBackgroundColorFill);
    
    //3  content ---image
    
    CGImageRef RotateImageRef = CGBitmapContextCreateImage(bmContext);
    
    UIImage  *RotateImage = [UIImage imageWithCGImage:RotateImageRef scale:self.scale orientation:self.imageOrientation];
    
    return  RotateImage;


}

#pragma mark---  图片剪切
-(UIImage*)ImageCutSize:(CGRect)rect{

    CGImageRef subImageRef = CGImageCreateWithImageInRect(self.CGImage, rect);
    
    CGRect  smallRect  = CGRectMake(0, 0, CGImageGetWidth(subImageRef), CGImageGetHeight(subImageRef));
    
    UIGraphicsBeginImageContext(smallRect.size);
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextDrawImage(context, smallRect, subImageRef);
    UIImage  *cutImage = [UIImage  imageWithCGImage:subImageRef];
    
    UIGraphicsEndImageContext();


    return cutImage;
    
}

#pragma mark---  //图片剪切圆形

-(UIImage*)ImageClipCircle{

    CGFloat ImageSizeMin = MIN(self.size.width, self.size.height);
    CGSize ImageSize = CGSizeMake(ImageSizeMin, ImageSizeMin);
    view *mview = [[view  alloc]init];
    mview.image = self;
    
    UIGraphicsBeginImageContext(ImageSize);
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    mview.frame = CGRectMake(0, 0, ImageSizeMin, ImageSizeMin);
    mview.backgroundColor = [UIColor blueColor];
    [mview.layer  renderInContext:context  ];
    UIImage  *imageNew = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return imageNew;
    
}


#pragma mark---  //图片拉伸
-(UIImage *)imageScaleSize:(CGSize)size{

    UIGraphicsBeginImageContext(size);
    
    [self  drawInRect:CGRectMake(0, 0, size.width, size.height)];
    
    UIImage  *imageNew = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    
    return  imageNew;

}

@end
