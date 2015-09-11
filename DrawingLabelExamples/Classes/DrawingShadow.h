//
//  DrawingShadow.h
//  SpadesPlus
//
//  Created by Selım on 24/07/15.
//  Copyright (c) 2015 peakgames. All rights reserved.
//

#import "Drawing.h"

@interface DrawingShadow : Drawing

@property (nonatomic,strong)    UIColor *shadowColor;
@property (nonatomic)           CGSize  shadowSize;
@property (nonatomic)           CGFloat shadowBlur;

@end
