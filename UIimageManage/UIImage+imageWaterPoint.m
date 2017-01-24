//
//  UIImage+imageWaterPoint.m
//  UIimageManage
//
//  Created by jerry on 17/1/24.
//  Copyright © 2017年 Shuai. All rights reserved.
//

#import "UIImage+imageWaterPoint.h"

@implementation UIImage (imageWaterPoint)

-(UIImage*)imageWater:(UIImage*)imagelogo  waterString:(NSString*)waterString{

    UIGraphicsBeginImageContext(self.size);
    
    //将原始图片渲染
    [self  drawInRect:CGRectMake(0, 0, self.size.width, self.size.height)];
    
    CGFloat waterX = 300;
    CGFloat waterY = 300;
    CGFloat waterW = 16;
    CGFloat waterH = 16;
    [imagelogo drawInRect:CGRectMake(waterX, waterY, waterW, waterH)];
    
    NSMutableParagraphStyle *paraStyle = [[NSMutableParagraphStyle  defaultParagraphStyle] mutableCopy];
    paraStyle.lineBreakMode = NSLineBreakByCharWrapping;
    
    //渲染文字
    NSDictionary *dic = @{NSFontAttributeName:[UIFont systemFontOfSize:20.0],NSParagraphStyleAttributeName:paraStyle,NSForegroundColorAttributeName:[UIColor redColor]};
    
    
    [waterString  drawInRect:CGRectMake(0, 0, 300, 60) withAttributes:dic];
    
    
    //uiimage
    UIImage  *imageNew  = UIGraphicsGetImageFromCurrentImageContext();
    
    
    UIGraphicsEndImageContext();
    
    
    
    return imageNew;
}
@end
