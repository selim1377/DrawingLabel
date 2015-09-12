//
//  Drawing.m
//  SpadesPlus
//
//  Created by Selım on 24/07/15.
//  Copyright (c) 2015 peakgames. All rights reserved.
//

#import "Drawing.h"

@implementation Drawing

-(void)drawTextInRect:(CGRect)rect forLabel:(Drawing *)label
{
    // TODO: Override this method in subclasses.
}

-(void)requestDrawRect:(CGRect)rect
{
    if (self.delegate)
        [self.delegate shouldDrawRect:rect];
}

- (id)copyWithZone:(NSZone *)zone
{
    id copy = [[[self class] alloc] init];
    Drawing *drawing =  (Drawing *)copy;
    
    if (drawing)
    {
        drawing.childDrawing = self.childDrawing;
        drawing.delegate     = self.delegate;
    }
    
    return drawing;
}

@end
