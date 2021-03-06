//
//  MUMLabelView.m
//  
//
//  Created by biD3V on 8/16/20.
//  Adapted from AUILabelView by AntiqueDev
//

#import "MUILabelView.h"

@implementation MUILabelView

@synthesize titleLabel, artistLabel;

- (id)init {
  if(self = [super init]) {
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self setup];
  } return self;
}

- (void)setup {
    [self addTitleLabel];
    [self addArtistLabel];
}

- (void)addTitleLabel {
    titleLabel = [UILabel new];
    [titleLabel setTranslatesAutoresizingMaskIntoConstraints:NO];
    [titleLabel setFont:[UIFont systemFontOfSize:13 weight:UIFontWeightSemibold]];
    [titleLabel setTextAlignment:NSTextAlignmentLeft];
    [self addSubview:titleLabel];

    [titleLabel.topAnchor constraintEqualToAnchor:self.topAnchor].active = YES;
    [titleLabel.leadingAnchor constraintEqualToAnchor:self.leadingAnchor].active = YES;
    [titleLabel.trailingAnchor constraintEqualToAnchor:self.trailingAnchor].active = YES;
    [titleLabel setContentCompressionResistancePriority:1000 forAxis:1];
    [titleLabel setContentHuggingPriority:1000 forAxis:1];
}

-(void) addArtistLabel {
    artistLabel = [UILabel new];
    [artistLabel setTranslatesAutoresizingMaskIntoConstraints:NO];
    [artistLabel setFont:[UIFont systemFontOfSize:13 weight:UIFontWeightMedium]];
    [artistLabel setTextAlignment:NSTextAlignmentLeft];
    [artistLabel setTextColor:[UIColor labelColor]];
    [self addSubview:artistLabel];

    [artistLabel.topAnchor constraintEqualToAnchor:titleLabel.lastBaselineAnchor constant:4].active = YES;
    [artistLabel.leadingAnchor constraintEqualToAnchor:self.leadingAnchor].active = YES;
    [artistLabel.trailingAnchor constraintEqualToAnchor:self.trailingAnchor].active = YES;
    [artistLabel.bottomAnchor constraintEqualToAnchor:self.bottomAnchor].active = YES;
    [artistLabel setContentCompressionResistancePriority:1000 forAxis:1];
    [artistLabel setContentHuggingPriority:1000 forAxis:1];
}

@end
