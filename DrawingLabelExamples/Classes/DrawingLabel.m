//
//  DrawingLabel.m
//  SpadesPlus
//
//  Created by Selım on 24/07/15.
//  Copyright (c) 2015 peakgames. All rights reserved.
//

#import "DrawingLabel.h"

@implementation DrawingLabel

-(void)drawTextInRect:(CGRect)rect
{
    [super drawTextInRect:rect];
    [self drawLabelStyleOnRect:rect];
}

-(void)drawLabelStyleOnRect:(CGRect)rect
{    
    if (self.drawing)
        [self.drawing drawTextInRect:rect forLabel:self];

}

-(void)shouldDrawRect:(CGRect)rect
{
    [super drawTextInRect:rect];
}

@end
