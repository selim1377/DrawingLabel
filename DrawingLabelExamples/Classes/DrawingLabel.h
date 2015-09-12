//
//  DrawingLabel.h
//  SpadesPlus
//
//  Created by Selım on 24/07/15.
//  Copyright (c) 2015 peakgames. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Drawing.h"

/*!
 An examples UILabel subclass, which uses the drawing library
 */
@interface DrawingLabel : UILabel <DrawingDelegate>

@property (nonatomic,strong) Drawing *drawing;

@end
