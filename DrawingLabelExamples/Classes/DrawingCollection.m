//
//  DrawingCollection.m
//  DrawingLabelExamples
//
//  Created by Selim on 10.09.15.
//  Copyright (c) 2015 Selim Bakdemir. All rights reserved.
//

#import "DrawingCollection.h"

@interface DrawingCollection ()

@end

@implementation DrawingCollection

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.drawings = [NSMutableArray new];
    }
    return self;
}

-(void)applyDrawingsToLabel:(DrawingLabel *)drawingLabel
{
    for (Drawing *drawing in self.drawings) {
        
        if ([drawing isKindOfClass:[Drawing class]]) {
            drawing.delegate = drawingLabel;
        }
    }
    
    for (NSInteger index = self.drawings.count - 1; index >= 0; index--) {
        
        Drawing *drawing = [self.drawings objectAtIndex:index];
        if ([drawing isKindOfClass:[Drawing class]]) {
            
            if(index > 0)
            {
                Drawing *childDrawing = [self.drawings objectAtIndex:index-1];
                drawing.childDrawing = childDrawing;
            }
        }
    }
    
    Drawing *mostParent = self.drawings.lastObject;
    drawingLabel.drawing = mostParent;
    
}

-(void)addDrawing:(Drawing *)drawing
{
    [self.drawings addObject:drawing];
}
@end
