//
//  JPCATransform3D.m
//  JSPatchTransform3DExtention
//
//  Created by 王博 on 16/2/11.
//  Copyright © 2016年 FlashHand. All rights reserved.
//

#import "JPCATransform3D.h"
#define TRANSFORM3D_DEFINE @{ \
@"name": @"CATransform3D",  \
@"types": @"FFFFFFFFFFFFFFFF",    \
@"keys": @[@"m11", @"m12", @"m13", @"m14", @"m21", @"m22",@"m23",@"m24",@"m31",@"m32",@"m33",@"m34",@"m41",@"m42",@"m43",@"m44"]    \
}
#define AFFINETRANSFORM_DEFINE @{ \
@"name": @"CGAffineTransform",  \
@"types": @"FFFFFF",    \
@"keys": @[@"a", @"b", @"c", @"d", @"tx", @"ty"]    \
}
static NSDictionary *transform3DStructDefine;
static NSDictionary *affineTransformStructDefine;
@implementation JPCATransform3D
+ (void)main:(JSContext *)context
{
    transform3DStructDefine=TRANSFORM3D_DEFINE;
    affineTransformStructDefine=AFFINETRANSFORM_DEFINE;
    [JPEngine defineStruct:transform3DStructDefine];
    [JPEngine defineStruct:affineTransformStructDefine];
    context[@"CATransform3DIdentity"] = ^id(){
        CATransform3D transform = CATransform3DIdentity;
        return [self getDictOfStruct:&transform structDefine:transform3DStructDefine];
    };
    context[@"CATransform3DIsIdentity"] = ^BOOL(NSDictionary *transformDict){
        CATransform3D tmpTransform;
        [self getStructDataWithDict:&tmpTransform  dict:transformDict structDefine:transform3DStructDefine];
        return CATransform3DIsIdentity(tmpTransform);
    };
    context[@"CATransform3DEqualToTransform"] = ^BOOL(NSDictionary *transformDict1,NSDictionary * transformDict2){
        CATransform3D tmpTransform1,tmpTransform2;
        [self getStructDataWithDict:&tmpTransform1 dict:transformDict1 structDefine:transform3DStructDefine];
        [self getStructDataWithDict:&tmpTransform2 dict:transformDict2 structDefine:transform3DStructDefine];
        return (BOOL)CATransform3DEqualToTransform(tmpTransform1, tmpTransform2);
    };
    context[@"CATransform3DMakeTranslation"] = ^id(CGFloat tx,CGFloat ty,CGFloat tz){
        CATransform3D tmpTransform;
        tmpTransform=CATransform3DMakeTranslation(tx, ty, tz);
        return [self getDictOfStruct:&tmpTransform structDefine:transform3DStructDefine];
    };
    context[@"CATransform3DMakeScale"] = ^id(CGFloat sx,CGFloat sy,CGFloat sz){
        CATransform3D tmpTransform;
        tmpTransform=CATransform3DMakeScale(sx, sy, sz);
        return [self getDictOfStruct:&tmpTransform structDefine:transform3DStructDefine];
    };
    context[@"CATransform3DMakeRotation"] = ^id(CGFloat angle,CGFloat x,CGFloat y,CGFloat z){
        CATransform3D tmpTransform;
        tmpTransform=CATransform3DMakeRotation(angle, x,y, z);
        return [self getDictOfStruct:&tmpTransform structDefine:transform3DStructDefine];
    };
    context[@"CATransform3DTranslate"] = ^id(NSDictionary *transformDict,CGFloat tx,CGFloat ty,CGFloat tz){
        CATransform3D tmpTransform;
        [self getStructDataWithDict:&tmpTransform dict:transformDict structDefine:transform3DStructDefine];
        CATransform3DTranslate(tmpTransform, tx, ty, tz);
        return [self getDictOfStruct:&tmpTransform structDefine:transform3DStructDefine];
    };
    context[@"CATransform3DScale"] = ^id(NSDictionary *transformDict,CGFloat sx,CGFloat sy,CGFloat sz){
        CATransform3D tmpTransform;
        [self getStructDataWithDict:&tmpTransform dict:transformDict structDefine:transform3DStructDefine];
        CATransform3DScale(tmpTransform, sx, sy, sz);
        return [self getDictOfStruct:&tmpTransform structDefine:transform3DStructDefine];
    };
    context[@"CATransform3DRotate"] = ^id(NSDictionary *transformDict,CGFloat angle,CGFloat x ,CGFloat y,CGFloat z){
        CATransform3D tmpTransform;
        [self getStructDataWithDict:&tmpTransform dict:transformDict structDefine:transform3DStructDefine];
        CATransform3DRotate(tmpTransform, angle, x, y, z);
        return [self getDictOfStruct:&tmpTransform structDefine:transform3DStructDefine];
    };
    context[@"CATransform3DConcat"] = ^id(NSDictionary *transformDict1,NSDictionary *transformDict2){
        CATransform3D tmpTransform1,tmpTransform2,concatedTransform;
        [self getStructDataWithDict:&tmpTransform1 dict:transformDict1 structDefine:transform3DStructDefine];
        [self getStructDataWithDict:&tmpTransform2 dict:transformDict2 structDefine:transform3DStructDefine];
       concatedTransform = CATransform3DConcat(tmpTransform1, tmpTransform2);
        return [self getDictOfStruct:&concatedTransform structDefine:transform3DStructDefine];
    };
    context[@"CATransform3DInvert"] = ^id(NSDictionary *transformDict){
        CATransform3D tmpTransform,inverseTransform;
        [self getStructDataWithDict:&tmpTransform dict:transformDict structDefine:transform3DStructDefine];
        inverseTransform = CATransform3DInvert(tmpTransform);
        return [self getDictOfStruct:&inverseTransform structDefine:transform3DStructDefine];
    };
    context[@"CATransform3DMakeAffineTransform"] = ^id(NSDictionary *affineTransformDict){
        CATransform3D tmpTransform;
        CGAffineTransform affineTransform;
        [self getStructDataWithDict:&affineTransform dict:affineTransformDict structDefine:affineTransformStructDefine];
        tmpTransform = CATransform3DMakeAffineTransform(affineTransform);
        return [self getDictOfStruct:&tmpTransform structDefine:transform3DStructDefine];
    };
    context[@"CATransform3DIsAffine"] = ^BOOL(NSDictionary *transformDict){
        CATransform3D tmpTransform;
        [self getStructDataWithDict:&tmpTransform dict:transformDict structDefine:transform3DStructDefine];
        return (BOOL)CATransform3DIsAffine(tmpTransform);
    };
    context[@"CATransform3DGetAffineTransform"] = ^id(NSDictionary *transformDict){
        CATransform3D tmpTransform;
        CGAffineTransform tmpAffineTransform;
        [self getStructDataWithDict:&tmpTransform dict:transformDict structDefine:transform3DStructDefine];
        tmpAffineTransform = CATransform3DGetAffineTransform(tmpTransform);
        return [self getDictOfStruct:&tmpAffineTransform structDefine:affineTransformStructDefine];
    };
    //MARK: 设置CATransform3D矩阵的具体元素
    //m必须等于@"m11", @"m12", @"m13", @"m14", @"m21", @"m22",@"m23",@"m24",@"m31",@"m32",@"m33",@"m34",@"m41",@"m42",@"m43",@"m44"中的一个
    context[@"CATransform3DSetElement"] = ^id(NSDictionary *transformDict,NSString *m,CGFloat elementValue){
        CATransform3D tmpTransform;
        [self getStructDataWithDict:&tmpTransform dict:transformDict structDefine:transform3DStructDefine];
        NSArray *keys=transform3DStructDefine[@"keys"];
        NSInteger index=[keys indexOfObjectIdenticalTo:m];
        if (index != NSNotFound) {
            size_t size = sizeof(void *);
            CGFloat val;
            val = elementValue;
            memcpy(&tmpTransform + index, &val, size);
        }
        else
        {
            NSLog(@"元素名必须等于\
                \"m11,m12,m13,m14,m21,m22,m23,m24,m31,m32,m33,m34,m\
                  41,m42,m43,m44\"中的一种\
                  ");
        }
        return [self getDictOfStruct:&tmpTransform structDefine:transform3DStructDefine];

        
    };
    //MARK: 获取CATransform3D矩阵的具体元素
    //m必须等于@"m11", @"m12", @"m13", @"m14", @"m21", @"m22",@"m23",@"m24",@"m31",@"m32",@"m33",@"m34",@"m41",@"m42",@"m43",@"m44"中的一个
    context[@"CATransform3DGetElement"] = ^CGFloat(NSDictionary *transformDict,NSString *m){
        NSArray *keys=transform3DStructDefine[@"keys"];
        CGFloat elementValue;
        NSInteger index=[keys indexOfObjectIdenticalTo:m];
        if (index != NSNotFound) {
#if CGFLOAT_IS_DOUBLE
            elementValue = [transformDict[keys[index]] doubleValue];
#else
            elementValue = [transformDict[keys[index]] floatValue];
#endif
        }
        else
        {
            NSLog(@"元素名必须等于\
                  \"m11,m12,m13,m14,m21,m22,m23,m24,m31,m32,m33,m34,m\
                  41,m42,m43,m44\"中的一种\
                  ");
        }
        return elementValue;

    };

    
}
+ (NSDictionary *)transDictOfStruct:(CATransform3D *)trans
{
    return [self getDictOfStruct:trans structDefine:TRANSFORM3D_DEFINE];
}
+ (void)transStruct:(CATransform3D *)trans ofDict:(NSDictionary *)dict
{
    [self getStructDataWithDict:trans dict:dict structDefine:TRANSFORM3D_DEFINE];
}
@end
