//
//  XGeometry.h
//  XKit
//
//  Created by Will on 2019/8/22.
//  Copyright © 2019 willzh. All rights reserved.
//

#ifndef XGeometry_h
#define XGeometry_h


/// 按比例（Aspect Fit）填充方式计算 size 在 inRect 中的实际范围
//CGRect zs_aspectFitSizeInRect(CGSize size, CGRect inRect) {
//    CGFloat sw = inRect.size.width;
//    CGFloat sh = inRect.size.height;
//    
//    CGFloat scale  = MAX(size.width / sw, size.height / sh);
//    
//    CGFloat tw = size.width / scale;
//    CGFloat th = size.height / scale;
//    
//    return CGRectMake(inRect.origin.x + (sw - tw) / 2.0, inRect.origin.y + (sh - th) / 2.0, tw, th);
//}
//
///// 按比例（Aspect Fill）填充方式计算 size 在 inRect 中的实际范围
//CGRect zs_aspectFillSizeInRect(CGSize size, CGRect inRect) {
//    CGFloat sw = inRect.size.width;
//    CGFloat sh = inRect.size.height;
//    
//    CGFloat scale  = MAX(size.width / sw, size.height / sh);
//    
//    CGFloat tw = size.width / scale;
//    CGFloat th = size.height / scale;
//    
//    return CGRectMake(inRect.origin.x + (sw - tw) / 2.0, inRect.origin.y + (sh - th) / 2.0, tw, th);
//}




#endif /* XGeometry_h */
