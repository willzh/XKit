//
//  SZVideo.h
//  XKit_Example
//
//  Created by Will on 2020/1/6.
//  Copyright © 2020 willzh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SZVideo : NSObject

@property (nonatomic, copy) NSString *filepath; //!< 文件路径

+ (instancetype)videoWithPath:(NSString *)path;
- (instancetype)initWithPath:(NSString *)path;


/// 获取视频时长
- (NSInteger)getVideoLength;

/// 获取视频宽高
- (CGSize)getVideoSize;


/// 获取视频封面
- (UIImage *)thumbnailImageAtTime:(NSTimeInterval)time;


/// 提取视频中的背景音乐
- (void)getBgMusicWithCompletion:(void(^)(NSURL *outputURL, NSError *error))block;


@end

NS_ASSUME_NONNULL_END
