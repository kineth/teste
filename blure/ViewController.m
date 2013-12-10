//
//  ViewController.m
//  blure
//
//  Created by joao vitor on 19/10/13.
//  Copyright (c) 2013 joao vitor. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self captureBlur];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) captureBlur {
    //Get a UIImage from the UIView
    NSLog(@"blur capture");
    
    
 
    UIGraphicsBeginImageContext(self.imgBlure.bounds.size);
    [self.view.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *viewImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    //Blur the UIImage
    CIImage *imageToBlur = [CIImage imageWithCGImage:viewImage.CGImage];
    CIFilter *gaussianBlurFilter = [CIFilter filterWithName: @"CIGaussianBlur"];
    [gaussianBlurFilter setValue:imageToBlur forKey: @"inputImage"];
    [gaussianBlurFilter setValue:[NSNumber numberWithFloat: 6] forKey: @"inputRadius"];
    CIImage *resultImage = [gaussianBlurFilter valueForKey: @"outputImage"];
    
    //create UIImage from filtered image
    UIImage *img = [[UIImage alloc] initWithCIImage:resultImage];

    
    _imgBlure.image = img;



}





@end
