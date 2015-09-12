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
    NSMutableArray *copyDrawing = [[NSMutableArray alloc] initWithArray:self.drawings copyItems:YES];
    
    for (Drawing *drawing in copyDrawing) {
        
        if ([drawing isKindOfClass:[Drawing class]]) {
            drawing.delegate = drawingLabel;
        }
    }
    
    for (NSInteger index = copyDrawing.count - 1; index >= 0; index--) {
        
        Drawing *drawing = [copyDrawing objectAtIndex:index];
        if ([drawing isKindOfClass:[Drawing class]]) {
            
            if(index > 0)
            {
                Drawing *childDrawing = [copyDrawing objectAtIndex:index-1];
                drawing.childDrawing = childDrawing;
            }
        }
    }
    
    Drawing *mostParent = copyDrawing.lastObject;
    drawingLabel.drawing = mostParent;
    
}

-(void)addDrawing:(Drawing *)drawing
{
    [self.drawings addObject:drawing];
}
@end
