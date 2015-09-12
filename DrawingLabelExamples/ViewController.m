//
//  ViewController.m
//  DrawingLabelExamples
//
//  Created by Selim on 10.09.15.
//  Copyright (c) 2015 Selim Bakdemir. All rights reserved.
//

#import "ViewController.h"
#import "DrawingLabel.h"
#import "DrawingStroke.h"
#import "DrawingCollection.h"
#import "DrawingShadow.h"
#import "DrawingGradient.h"
#import "DrawingInnerShadow.h"

@interface ViewController ()

@property (nonatomic,strong) DrawingLabel *styleLabel;
@property (nonatomic,strong) DrawingCollection *collection;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    CGRect bounds = self.view.bounds;
    
    self.styleLabel = [[DrawingLabel alloc] initWithFrame:CGRectMake(0, 50.0, bounds.size.width,50.0)];;
    self.styleLabel.textAlignment = NSTextAlignmentCenter;
    self.styleLabel.text  = @"Drawing-Label";
    self.styleLabel.adjustsFontSizeToFitWidth = YES;
    self.styleLabel.font = [UIFont fontWithName:@"ComicSCFTurkish" size:35.0];
    self.styleLabel.textColor = [UIColor yellowColor];
    
    [self.view addSubview:self.styleLabel];
    
    [self appleStyle:self.styleLabel];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)appleStyle:(DrawingLabel *)label
{
    self.collection = [DrawingCollection new];

    [self.collection addDrawing:[self generateGradientStyle1]];
    [self.collection addDrawing:[self generateInnerShadow]];
    [self.collection addDrawing:[self generateBlackStroke]];
    [self.collection addDrawing:[self generateGreenStroke]];
    [self.collection addDrawing:[self generateBlueShadow]];
    [self.collection addDrawing:[self generateRedShadow]];
    
    [self.collection applyDrawingsToLabel:label];

}

#pragma mark drawings generation

-(Drawing *)generateGradientStyle1
{
    
    DrawingGradient *gradient = [DrawingGradient new];
    gradient.colorArray = @[[UIColor greenColor],[UIColor yellowColor],[UIColor cyanColor]];
    gradient.locations  = @[@0,@0.3,@0.8];
    gradient.gradientType = DrawingGradientTypeVertical;
    
    return gradient;
}

-(Drawing *)generateInnerShadow
{
    DrawingInnerShadow *innerShadow = [DrawingInnerShadow new];
    innerShadow.innerShadowOffset = CGSizeMake(1.0, 1.0);
    innerShadow.innerShadowColor  = [UIColor redColor];
    innerShadow.innerShadowBlur   = 2.0f;

    return innerShadow;
}

-(Drawing *)generateBlackStroke
{
    DrawingStroke      *blackStroke      = [DrawingStroke new];
    blackStroke.strokeWidth  = 3.0;
    blackStroke.strokeColor  = [UIColor blackColor];
    
    return blackStroke;
}

-(Drawing *)generateGreenStroke
{
    DrawingStroke      *stroke      = [DrawingStroke new];
    stroke.strokeWidth  = 5.0;
    stroke.strokeColor  = [UIColor greenColor];
    
    return stroke;
}

-(Drawing *)generateBlueShadow
{
    UIColor *dropShadowColor = [UIColor colorWithRed:7.0/255.0
                                               green:104.0/255.0
                                                blue:181.0/255.0
                                               alpha:0.9];
    
    
    DrawingShadow *softShadow = [DrawingShadow new];
    softShadow.shadowSize = CGSizeMake(4.0f, 4.0f);
    softShadow.shadowColor = dropShadowColor;
    softShadow.shadowBlur  = 2.0f;
    
    return softShadow;
}

-(Drawing *)generateRedShadow
{
    DrawingShadow *softShadow = [DrawingShadow new];
    softShadow.shadowSize = CGSizeMake(-2.0f, -2.0f);
    softShadow.shadowColor = [UIColor redColor];
    
    return softShadow;
}
@end
