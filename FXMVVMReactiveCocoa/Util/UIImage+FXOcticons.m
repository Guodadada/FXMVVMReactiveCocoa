//
//  UIImage+FXOcticons.m
//  FXMVVMReactiveCocoa
//
//  Created by V on 2017/3/11.
//  Copyright © 2017年 com.fengxian. All rights reserved.
//

#import "UIImage+FXOcticons.h"
#import <OcticonsIOS/UIImage+Octicons.h>

@implementation UIImage (FXOcticons)

+ (UIImage *)fx_octicon_imageWithIdentifier:(NSString *)identifier size:(CGSize)size {
    return [UIImage octicon_imageWithIcon:identifier
                          backgroundColor:[UIColor clearColor]
                                iconColor:[UIColor darkGrayColor]
                                iconScale:1
                                  andSize:size];
}

@end
