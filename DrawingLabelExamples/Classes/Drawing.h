//
//  Drawing.h
//  SpadesPlus
//
//  Created by Selım on 24/07/15.
//  Copyright (c) 2015 peakgames. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>
#import <UIKit/UIKit.h>

@protocol DrawingDelegate <NSObject>

-(void)shouldDrawRect:(CGRect)rect;

@end

@interface Drawing : NSObject <NSCopying>

/*!
 Actual drawing happens here, includes heavily core graphics drawing code.
 */
-(void) drawTextInRect:(CGRect)rect forLabel:(UILabel *)label;

/*!
 
 Calling this method forces the subcject label to invoke drawRect:
 If you create a drawing subclass which performs any drawing, you can use this method
 if you want your labels default drawRect method.
 
 */
-(void)requestDrawRect:(CGRect)rect;

/*!
This delegate will be the subject label
 */
@property (nonatomic, weak) id<DrawingDelegate>delegate;

/*!
 This child object gives the flexibility of Decorator pattern,
 Any drawing draws its childDrawing first, which is the real power in this library
 */
@property (nonatomic,strong)  Drawing *childDrawing;

@end


