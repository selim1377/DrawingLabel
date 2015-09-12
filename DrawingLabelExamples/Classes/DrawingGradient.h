//
//  DrawingGradient.h
//  SpadesPlus
//
//  Created by Selım on 27/07/15.
//  Copyright (c) 2015 peakgames. All rights reserved.
//

#import "Drawing.h"


typedef enum : NSUInteger {
    DrawingGradientTypeVertical,
    DrawingGradientTypeHorizontal,
} DrawingGradientType;

@interface DrawingGradient : Drawing

@property (nonatomic,strong)  NSArray *colorArray;
@property (nonatomic)         NSArray *locations;
@property (nonatomic,assign)  DrawingGradientType gradientType;

@end
