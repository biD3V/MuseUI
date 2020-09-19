#import <UIKit/UIKit.h>

@interface UIImage (MuseUI)

+ (UIImage *)emptyImageWithSize:(CGSize)size;
+ (void)loadFromURL:(NSURL*)url callback:(void (^)(UIImage *image))callback;
- (UIImage *)resizeImageToWidth:(CGFloat)width;

@end
