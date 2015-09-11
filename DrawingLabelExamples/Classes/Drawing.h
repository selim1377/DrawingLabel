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

@interface Drawing : NSObject

-(void) drawTextInRect:(CGRect)rect forLabel:(UILabel *)label;
-(void)requestDrawRect:(CGRect)rect;

@property (nonatomic, weak) id<DrawingDelegate>delegate;
@property (nonatomic,strong)  Drawing *childDrawing;

@end


