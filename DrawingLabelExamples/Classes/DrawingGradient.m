//
//  DrawingGradient.m
//  SpadesPlus
//
//  Created by Selım on 27/07/15.
//  Copyright (c) 2015 peakgames. All rights reserved.
//

#import "DrawingGradient.h"

@implementation DrawingGradient

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        self.gradientType = DrawingGradientTypeVertical;
        
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
    // Create a mask from the text
    CGImageRef alphaMask = CGBitmapContextCreateImage(context);
    
    // clear the image
    CGContextClearRect(context, rect);
    
    CGContextSaveGState(context);
    
    // invert everything because CoreGraphics works with an inverted coordinate system
    CGContextTranslateCTM(context, 0, rect.size.height);
    CGContextScaleCTM(context, 1.0, -1.0);
    
    // Clip the current context to our alphaMask
    CGContextClipToMask(context, rect, alphaMask);

    
    
    CGGradientRef gradient = [self gradientRefForColors:self.colorArray
                                           forLocations:self.locations];
    
    CGPoint startPoint = [self startPointForGradientType: self.gradientType
                                                    rect:rect];
    
    CGPoint endPoint = [self endPointForGradientType:self.gradientType
                                                rect:rect];
    

    CGContextDrawLinearGradient(context, gradient, startPoint, endPoint, 0);
    
    CGGradientRelease(gradient), gradient = NULL;
    
    CGContextRestoreGState(context);
    
    // Clean up because ARC doesnt handle CG
    CGImageRelease(alphaMask);
}

-(CGGradientRef)gradientRefForColors:(NSArray *)colors forLocations:(NSArray *)locations
{
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    
    // ColorRef generation
    NSMutableArray *colorRefs = [NSMutableArray new];
    for (UIColor *color in self.colorArray)
        [colorRefs addObject:(__bridge id) color.CGColor];
    
    
    // Location array generation
    NSUInteger locationCount    = self.locations.count;
    
    CGGradientRef gradient = NULL;
    
    if (locationCount == 0)
    {
        gradient = CGGradientCreateWithColors(colorSpace, (__bridge CFArrayRef) colorRefs, NULL);
    }
    else
    {
        CGFloat loc[locationCount];
        for (int i=0; i<locationCount; i++) {
            
            NSNumber *location = [self.locations objectAtIndex:i];
            loc[i] =  location.floatValue;
        }

        gradient = CGGradientCreateWithColors(colorSpace, (__bridge CFArrayRef) colorRefs, loc);
    }
    
    CGColorSpaceRelease(colorSpace);
    return gradient;
}

-(CGPoint)startPointForGradientType:(DrawingGradientType) drawingType rect:(CGRect)rect
{
    if (self.gradientType == DrawingGradientTypeVertical) {
        return CGPointMake(CGRectGetMidX(rect), CGRectGetMaxY(rect));
    }
    else
    {
        return CGPointMake(CGRectGetMinX(rect), CGRectGetMidY(rect));
    }
    
}

-(CGPoint)endPointForGradientType:(DrawingGradientType) drawingType  rect:(CGRect)rect
{
    if (self.gradientType == DrawingGradientTypeVertical) {
        return CGPointMake(CGRectGetMidX(rect), CGRectGetMinY(rect));
    }
    else
    {
        return CGPointMake(CGRectGetMaxX(rect), CGRectGetMidY(rect));
    }
}

-(id)copyWithZone:(NSZone *)zone
{
    DrawingGradient *drawing = [super copyWithZone:zone];
    if (drawing)
    {
        drawing.colorArray = self.colorArray;
        drawing.locations  = self.locations;
        drawing.gradientType = self.gradientType;
    }
    return drawing;
}


@end
