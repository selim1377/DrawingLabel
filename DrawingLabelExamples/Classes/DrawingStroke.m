//
//  Stroke.m
//  SpadesPlus
//
//  Created by Selım on 24/07/15.
//  Copyright (c) 2015 peakgames. All rights reserved.
//

#import "DrawingStroke.h"

@implementation DrawingStroke

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        self.strokeWidth = 2.0f;
        self.strokeColor = [UIColor blackColor];        
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
    CGImageRef alphaMask = CGBitmapContextCreateImage(context);
    
    CGContextSaveGState(context);
    
    // Outline width
    CGContextSetLineWidth(context, self.strokeWidth);
    CGContextSetLineJoin(context, kCGLineJoinRound);
    
    // Set the drawing method to stroke
    CGContextSetTextDrawingMode(context, kCGTextStroke);
    
    // Outline color
    UIColor *originalColor = label.textColor;
    
    label.textColor = self.strokeColor;
    CGContextSetBlendMode(context, kCGBlendModeCopy);
    [self requestDrawRect:rect];
    CGContextSetBlendMode(context, kCGBlendModeNormal);
    
    
    // Draw the saved image over the outline
    // and invert everything because CoreGraphics works with an inverted coordinate system
    CGContextTranslateCTM(context, 0, rect.size.height);
    CGContextScaleCTM(context, 1.0, -1.0);
    CGContextDrawImage(context, rect, alphaMask);
    
    CGContextRestoreGState(context);
    
    // Clean up because ARC doesnt handle CG
    CGImageRelease(alphaMask);
    
    label.textColor = originalColor;
}


-(id)copyWithZone:(NSZone *)zone
{
    DrawingStroke *drawing = [super copyWithZone:zone];
    if (drawing)
    {
        drawing.strokeColor = self.strokeColor;
        drawing.strokeWidth = self.strokeWidth;
    }
    return drawing;
}

@end
