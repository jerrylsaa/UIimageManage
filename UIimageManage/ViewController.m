//
//  ViewController.m
//  UIimageManage
//
//  Created by jerry on 17/1/16.
//  Copyright © 2017年 Shuai. All rights reserved.
//

#import "ViewController.h"
#import "UIImage+ImageManage.h"
#import "UIView+imageScreenShot.h"
#import "UIImage+imageWaterPoint.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    [self  cutImage];
    [self  imageTextWater];
}
-(void)rotateImage{

    UIImage   *image  = [UIImage  imageNamed:@"rotateImage"];
    UIImage  *imageNew = [image  ImageRotateIndegree:45*3.14/180];
    UIImageWriteToSavedPhotosAlbum(imageNew, nil, nil, nil);
    UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil);


}

-(void)cutImage{
    
    
    UIImage   *image  = [UIImage  imageNamed:@"rotateImage"];
    UIImage  *imageNew = [image  ImageCutSize:CGRectMake(0,  0, 400, 400)];
    UIImageWriteToSavedPhotosAlbum(imageNew, nil, nil, nil);
}

-(void)CircleImage{
    
    
    UIImage   *image  = [UIImage  imageNamed:@"rotateImage"];
    UIImage  *imageNew = [image  ImageClipCircle];
    UIImageWriteToSavedPhotosAlbum(imageNew, nil, nil, nil);
}

-(void)ScaleImage{
    
    UIImage   *image  = [UIImage  imageNamed:@"rotateImage"];
    UIImage  *imageNew = [image  imageScaleSize:CGSizeMake(200, 100)];
    UIImageWriteToSavedPhotosAlbum(imageNew, nil, nil, nil);



}

-(void)ViewScreenShot{
    
    UIImage  *imageNew = [self.view imageScreenShot];
    UIImageWriteToSavedPhotosAlbum(imageNew, nil, nil, nil);
    
    
    
}

-(void)imageTextWater{
    
    UIImage   *image  = [UIImage  imageNamed:@"image1"];
    UIImage   *imageLogo  = [UIImage  imageNamed:@"imagelogo"];
    UIImage  *imageNew = [image  imageWater:imageLogo waterString:@"www.baidu.com"];
    UIImageWriteToSavedPhotosAlbum(imageNew, nil, nil, nil);

}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
