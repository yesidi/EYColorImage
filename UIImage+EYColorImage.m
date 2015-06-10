#import "UIImage+colorImage.h"

@implementation UIImage (EYColorImage)
+ (UIImage *)imageWithColor:(UIColor  *)color size:(CGSize)size radius:(CGFloat)radius
{
    radius = radius*4;
    CGRect  rect =  CGRectMake ( 0 ,  0 , size.width*4, size.height*4);
    UIGraphicsBeginImageContext (rect.size);
    CGContextRef  context =  UIGraphicsGetCurrentContext();
    
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path, nil, CGRectGetMidX(rect), 0);
    CGPathAddArcToPoint(path, nil, CGRectGetMaxX(rect), 0, CGRectGetMaxX(rect), CGRectGetMidY(rect), radius);
    CGPathAddArcToPoint(path, nil, CGRectGetMaxX(rect), CGRectGetMaxY(rect), CGRectGetMidX(rect), CGRectGetMaxY(rect), radius);
    CGPathAddArcToPoint(path, nil, CGRectGetMinX(rect), CGRectGetMaxY(rect), CGRectGetMinX(rect), CGRectGetMidY(rect), radius);
    CGPathAddArcToPoint(path, nil, CGRectGetMinX(rect), 0, CGRectGetMidX(rect), 0, radius);
    CGContextAddPath(context, path);
    CGPathRelease(path);
    CGContextSetFillColorWithColor (context, color.CGColor);
    CGContextFillPath(context);
    CGContextSetStrokeColorWithColor(context, color.CGColor);
    CGContextStrokePath(context);
    
    UIImage  *img =  UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return  img;
}
@end
