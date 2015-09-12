//
//  DrawingInnerShadow.m
//  DrawingLabelExamples
//
//  Created by Selim on 12.09.15.
//  Copyright (c) 2015 Selim Bakdemir. All rights reserved.
//

#import "DrawingInnerShadow.h"

@implementation DrawingInnerShadow


- (instancetype)init
{
    self = [super init];
    if (self) {
        
        self.innerShadowColor = [UIColor darkGrayColor];
        self.innerShadowOffset  = CGSizeMake(1.0, 1.0);
        self.innerShadowBlur  = 0.0f;
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
    
    // Invert to draw the inner shadow correctly.
    CGContextTranslateCTM(context, 0.0, CGRectGetHeight(rect));
    CGContextScaleCTM(context, 1.0, -1.0);
    
    CGImageRef alphaMask = CGBitmapContextCreateImage(context);
    
    CGContextSaveGState(context);

    // Clip the current context to alpha mask.
    CGContextClipToMask(context, rect, alphaMask);
    
    // Invert to draw the inner shadow correctly.
    CGContextTranslateCTM(context, 0.0, CGRectGetHeight(rect));
    CGContextScaleCTM(context, 1.0, -1.0);
    
    // Draw inner shadow.
    CGImageRef shadowImage = [self inverseMaskFromAlphaMask:alphaMask withRect:rect];
    CGContextSetShadowWithColor(context, self.innerShadowOffset, self.innerShadowBlur, self.innerShadowColor.CGColor);
    CGContextSetBlendMode(context, kCGBlendModeDarken);
    CGContextDrawImage(context, rect, shadowImage);
    
    // Clean up.
    //CGImageRelease(shadowImage);
    
    CGContextRestoreGState(context);
    
    // Invert to draw the inner shadow correctly.
    CGContextTranslateCTM(context, 0.0, CGRectGetHeight(rect));
    CGContextScaleCTM(context, 1.0, -1.0);
    
}


- (CGImageRef)inverseMaskFromAlphaMask:(CGImageRef)alphaMask withRect:(CGRect)rect CF_RETURNS_RETAINED {
    // Create context.
    UIGraphicsBeginImageContextWithOptions(rect.size, NO, 0.0);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    // Fill rect, clip to alpha mask and clear.
    [[UIColor whiteColor] setFill];
    UIRectFill(rect);
    CGContextClipToMask(context, rect, alphaMask);
    CGContextClearRect(context, rect);
    
    // Return image.
    CGImageRef image = CGBitmapContextCreateImage(context);
    UIGraphicsEndImageContext();
    return image;
}


-(id)copyWithZone:(NSZone *)zone
{
    DrawingInnerShadow *drawing = [super copyWithZone:zone];
    if (drawing)
    {
        drawing.innerShadowBlur     = self.innerShadowBlur;
        drawing.innerShadowColor    = self.innerShadowColor;
        drawing.innerShadowOffset   = self.innerShadowOffset;
    }
    return drawing;
}

@end
