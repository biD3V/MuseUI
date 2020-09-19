#import "UIImage+MuseUI.h"

@implementation UIImage (MuseUI)

+ (UIImage *)emptyImageWithSize:(CGSize)size {
    UIGraphicsBeginImageContext(size);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

+ (void)loadFromURL:(NSURL*)url callback:(void (^)(UIImage *image))callback {
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0ul);
    dispatch_async(queue, ^{
        NSData * imageData = [NSData dataWithContentsOfURL:url];
        dispatch_async(dispatch_get_main_queue(), ^{
            UIImage *image = [UIImage imageWithData:imageData];
            callback(image);
        });
    });
}

- (UIImage *)resizeImageToWidth:(CGFloat)width {
    CGSize newSize = CGSizeMake(width, (width / self.size.width) * self.size.height);

    UIGraphicsBeginImageContextWithOptions(newSize, // context size
                                           NO,      // opaque?
                                           0);      // image scale. 0 means "device screen scale"
    CGContextRef context = UIGraphicsGetCurrentContext();

    CGContextSetInterpolationQuality(context, kCGInterpolationHigh);
    [self drawInRect:CGRectMake(0, 0, newSize.width, newSize.height)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return newImage;
}

@end
