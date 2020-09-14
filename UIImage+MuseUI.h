#import <UIKit/UIKit.h>

@interface UIImage (MuseUI)

+ (void)loadFromURL:(NSURL*)url callback:(void (^)(UIImage *image))callback;
- (UIImage *)resizeImageToWidth:(CGFloat)width;

@end
