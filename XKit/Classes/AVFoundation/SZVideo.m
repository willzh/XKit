//
//  SZVideo.m
//  XKit_Example
//
//  Created by Will on 2020/1/6.
//  Copyright © 2020 willzh. All rights reserved.
//

#import "SZVideo.h"

@implementation SZVideo


#pragma mark - init
+ (instancetype)videoWithPath:(NSString *)path
{
    return [[SZVideo alloc] initWithPath:path];
}

- (instancetype)initWithPath:(NSString *)path
{
    self = [super init];
    if (self)
    {
        self.filepath = path;
    }
    return self;
}



#pragma mark -
/// 获取视频时长
- (NSInteger)getVideoLength
{
    AVURLAsset *asset = [AVURLAsset assetWithURL:[NSURL URLWithString:_filepath]];
    CMTime time = [asset duration];

    return ceil(time.value / time.timescale);
}

/// 获取视频宽高
- (CGSize)getVideoSize
{
    AVURLAsset *asset = [AVURLAsset assetWithURL:[NSURL URLWithString:_filepath]];
    NSArray *tracks = asset.tracks;
    for (AVAssetTrack *t in tracks)
    {
        if ([t.mediaType isEqualToString:AVMediaTypeVideo]) {
              return t.naturalSize;
        }
    }
    return CGSizeZero;
}

/// 获取视频封面
/// 获取视频封面
- (UIImage *)thumbnailImageAtTime:(NSTimeInterval)time
{
    AVURLAsset *asset = [[AVURLAsset alloc] initWithURL:[NSURL URLWithString:_filepath] options:nil];
    NSParameterAssert(asset);
    
    AVAssetImageGenerator *generator = [[AVAssetImageGenerator alloc] initWithAsset:asset];
    generator.appliesPreferredTrackTransform = YES;
    generator.apertureMode = AVAssetImageGeneratorApertureModeEncodedPixels;
    
    CGImageRef tRef = NULL;
    NSError *error = nil;
    tRef = [generator copyCGImageAtTime:CMTimeMake((CFTimeInterval)time, 60) actualTime:NULL error:&error];
    
    if(!tRef) {
        NSLog(@"thumbnail Image Generation Error %@", error);
    }
    
    UIImage *thumbnailImage = tRef ? [[UIImage alloc] initWithCGImage:tRef] : nil;
    
    return thumbnailImage;
}

/// 提取视频中的背景音乐
- (void)getBgMusicWithCompletion:(void(^)(NSURL *outputURL, NSError *error))block
{
    AVURLAsset *asset = [[AVURLAsset alloc] initWithURL:[NSURL URLWithString:_filepath] options:nil];

    NSArray *keys = @[@"duration", @"tracks"];
    [asset loadValuesAsynchronouslyForKeys:keys completionHandler:^{

        NSError *error =nil;
        AVKeyValueStatus status = [asset statusOfValueForKey:@"tracks" error:&error];

        if (AVKeyValueStatusLoaded == status)
        {
            NSURL *outputURL = [NSURL fileURLWithPath:@""];
            AVMutableComposition *mixComposition = [[AVMutableComposition alloc] init];
            
            // 创建一个轨道, 类型是AVMediaTypeAudio
            AVMutableCompositionTrack *atrack = [mixComposition addMutableTrackWithMediaType:AVMediaTypeAudio preferredTrackID:kCMPersistentTrackID_Invalid];

            // 获取videoAsset中的音频,插入轨道
            [atrack insertTimeRange:CMTimeRangeMake(kCMTimeZero, asset.duration) ofTrack:[[asset tracksWithMediaType:AVMediaTypeAudio] objectAtIndex:0] atTime:kCMTimeZero error:nil];

            
            AVAssetExportSession *exporter = [[AVAssetExportSession alloc] initWithAsset:mixComposition presetName:AVAssetExportPresetAppleM4A]; // 输出为M4A音频
            exporter.outputURL = outputURL;
            exporter.outputFileType = @"com.apple.m4a-audio"; //类型和输出类型一致
            exporter.shouldOptimizeForNetworkUse = YES;
            [exporter exportAsynchronouslyWithCompletionHandler:^{
                dispatch_async(dispatch_get_main_queue(), ^{
                    if (exporter.status == AVAssetExportSessionStatusCompleted) {
                        if (block) block(outputURL, nil);
                    }else
                    {
                        //[SVProgressHUD showErrorWithStatus:exporter.error.userInfo.description];
                        //[SVProgressHUD dismissWithDelay:1.5];

                        if (block) block(nil, exporter.error);

                        NSLog(@"失败了，原因是：%@", exporter.error);
                    }
                });
            }];
        }
    }];
}





@end
