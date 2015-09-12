//
//  DrawingInnerShadow.h
//  DrawingLabelExamples
//
//  Created by Selim on 12.09.15.
//  Copyright (c) 2015 Selim Bakdemir. All rights reserved.
//

#import "Drawing.h"

@interface DrawingInnerShadow : Drawing

@property (nonatomic, assign) CGFloat innerShadowBlur;
@property (nonatomic, assign) CGSize  innerShadowOffset;
@property (nonatomic, strong) UIColor *innerShadowColor;

@end
