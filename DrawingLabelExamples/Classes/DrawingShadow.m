//
//  DrawingShadow.m
//  SpadesPlus
//
//  Created by Selım on 24/07/15.
//  Copyright (c) 2015 peakgames. All rights reserved.
//

#import "DrawingShadow.h"

@implementation DrawingShadow

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        self.shadowColor = [UIColor darkGrayColor];
        self.shadowSize  = CGSizeMake(1.0, 1.0);
        self.shadowBlur  = 0.0f;
    }
    return self;
}

-(void)drawTextInRect:(CGRect)rect forLabel:(UILabel *)label
{
    if (self.childDrawing) {
        [self.childDrawing drawTextInRect:rect
                                 forLabel:label];
    }
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSaveGState(context);
    
    // Create an image from the text.
    CGImageRef alphaMask = CGBitmapContextCreateImage(context);
    
    // Clear the content.
    CGContextClearRect(context, rect);
    
    CGContextSetShadowWithColor(context, self.shadowSize, self.shadowBlur, self.shadowColor.CGColor);
    
    // Draw the saved image, which throws off a shadow.
    CGContextTranslateCTM(context, 0, rect.size.height);
    CGContextScaleCTM(context, 1.0, -1.0);
    CGContextDrawImage(context, rect, alphaMask);
    
    // Clean up.
    CGImageRelease(alphaMask);
    
    CGContextRestoreGState(context);
}

-(id)copyWithZone:(NSZone *)zone
{
    DrawingShadow *drawing = [super copyWithZone:zone];
    if (drawing)
    {
        drawing.shadowBlur  = self.shadowBlur;
        drawing.shadowColor = self.shadowColor;
        drawing.shadowSize  = self.shadowSize;
    }
    return drawing;
}


@end
