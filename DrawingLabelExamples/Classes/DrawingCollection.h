//
//  DrawingCollection.h
//  DrawingLabelExamples
//
//  Created by Selim on 10.09.15.
//  Copyright (c) 2015 Selim Bakdemir. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DrawingLabel.h"

@interface DrawingCollection : NSObject

@property (nonatomic, strong) NSMutableArray *drawings;

/*!
 After filled with drawings, this method actually applies the style to the subject label
 */
-(void)applyDrawingsToLabel:(DrawingLabel *)drawingLabel;

/*!
 Adds a new drawing to existing drawing collection
 */
-(void)addDrawing:(Drawing *)drawing;

@end
