//
//  JPCATransform3D.h
//  JSPatchTransform3DExtention
//
//  Created by 王博 on 16/2/11.
//  Copyright © 2016年 FlashHand. All rights reserved.
//

#import "JPEngine.h"
#import <CoreGraphics/CoreGraphics.h>
#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
@interface JPCATransform3D : JPExtension
+ (NSDictionary *)transDictOfStruct:(CATransform3D *)trans;
+ (void)transStruct:(CATransform3D *)trans ofDict:(NSDictionary *)dict;
@end
