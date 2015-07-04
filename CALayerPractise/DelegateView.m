//
//  DelegateView.m
//  Layers
//
//  Created by Yang Chao on 7/4/15.
//  Copyright (c) 2015 Self. All rights reserved.
//

#import "DelegateView.h"

@implementation DelegateView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self.layer setNeedsDisplay];
        [self.layer setContentsScale:[[UIScreen mainScreen] scale]];
    }
    return self;
}

- (void)drawLayer:(CALayer *)layer inContext:(CGContextRef)ctx
{
    UIGraphicsPushContext(ctx);
    [[UIColor whiteColor] set];
    UIRectFill(layer.bounds);
    
    UIFont *font = [UIFont preferredFontForTextStyle:UIFontTextStyleHeadline];
    UIColor *color = [UIColor blackColor];
    
    NSMutableParagraphStyle *style = [NSMutableParagraphStyle new];
    [style setAlignment:NSTextAlignmentCenter];
    NSDictionary *attibs  = @{NSFontAttributeName : font, NSForegroundColorAttributeName : color, NSParagraphStyleAttributeName : style};
    NSAttributedString *text = [[NSAttributedString alloc] initWithString:@"Flipped to this view" attributes:attibs];
    
    [text drawInRect:CGRectInset([layer bounds], 10, 100)];
    UIGraphicsPopContext();
}

@end
