//
//  Stroke.h
//  SpadesPlus
//
//  Created by Selım on 24/07/15.
//  Copyright (c) 2015 peakgames. All rights reserved.
//

#import "Drawing.h"

@interface DrawingStroke : Drawing

@property (nonatomic,strong) UIColor *strokeColor;
@property (nonatomic)        CGFloat strokeWidth;

@end
