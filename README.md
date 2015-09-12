# DrawingLabel

DrawingLabel library consists of objects, which creates different UILabel styles such as multiple strokes, shadows, inner shadow and gradients. 

## Requirements
  - iOS 6.0 or higher
  - Requires ARC

## Installation

The easiest way to use DrawingLabel in your app is via [CocoaPods](http://cocoapods.org/ "CocoaPods").

1. Add the following line in the project's Podfile file: `pod 'DrawingLabel' `
2. Run the command `pod install` from the Podfile folder directory.

## Usage

To style the labels at runtime, DrawingLabel provides different drawing objects such as:
  - DrawingGradient
  - DrawingInnerShadow
  - DrawingStroke
  - DrawingShadow

Each of these objects have different configurations and properties you can play with.

If you want to have a stroke on your label, you simply create a `'DrawingStroke'`:

``` objective-c
	DrawingStroke *blackStroke  = [DrawingStroke new];
    blackStroke.strokeWidth     = 3.0f;
    blackStroke.strokeColor     = [UIColor blackColor];
```

Now you have your style object but what to do with it ? 

You create simple a `DrawingCollection` object. It is responsible for keeping different style objects and apply them to a `DrawingLabel`
``` objective-c
    DrawingCollection *collection = [DrawingCollection new];
    [collection addDrawing:blackStroke];
```

You can create different styles with different properties and enhance the collection object:
``` objective-c
    DrawingCollection *collection = [DrawingCollection new];
    [collection addDrawing:blueToRedGradient];
    [collection addDrawing:blackStroke];
    [collection addDrawing:darkGrayShadow];
```

In this step you complete your style. Here is how to apply this bunch of styles to the `DrawingLabel`:
``` objective-c
    DrawingCollection *collection = [DrawingCollection new];
    .
    .
    
    [collection applyDrawingsToLabel: anyDrawingLabel];
```
`DrawingLabel` is a subclass of UILabel which have ability to draw any subclass of `Drawing` class, and in this case it draws `DrawingStroke`,`DrawingGradient` and `DrawingShadow` respectively.

Now there is the power of this library. You can create even your own drawing style by subclassing `Drawing` class, and use it as any predefined styles in library.

Additionally you can chain those styles, add multiple strokes or shadows. You can even swap them at runtime.

# Properties

Here is the drawing object properties, which are very common to use in any iOS applications

`DrawingGradient:`
``` objective-c
    typedef enum : NSUInteger {
    DrawingGradientTypeVertical,
    DrawingGradientTypeHorizontal,
    } DrawingGradientType;

    @property (nonatomic,strong)  NSArray *colorArray;
    @property (nonatomic)         NSArray *locations;
    @property (nonatomic,assign)  DrawingGradientType gradientType;
```

`DrawingInnerShadow:`
``` objective-c
    @property (nonatomic, assign) CGFloat innerShadowBlur;
    @property (nonatomic, assign) CGSize  innerShadowOffset;
    @property (nonatomic, strong) UIColor *innerShadowColor;
```

`DrawingStroke:`
``` objective-c
    @property (nonatomic,strong) UIColor *strokeColor;
    @property (nonatomic)        CGFloat strokeWidth;
```

`DrawingShadow:`
``` objective-c
    @property (nonatomic,strong)    UIColor *shadowColor;
    @property (nonatomic)           CGSize  shadowSize;
    @property (nonatomic)           CGFloat shadowBlur;
```

# Notes

Core Graphics draws these styles step by step therefore to have a proper style, you must respect the order of the styles while adding.

The order will be Gradient -> InnerShadow -> Stroke (or Multiple Strokes) -> Shadow (or Multiple Shadows)

Currently,there is no mechanism to adjust this order in `DrawingCollection`. I might add this feature to future version of these libraries.

Currently,the subject label must be kind of `DrawingLabel`. I might change that, for any UILabel can draw itself using `Drawing` objects.

# Credits
Inspiration from:

- THLabel by Tobias Hagemann, https://github.com/MuscleRumble/THLabel

The library is created while we are developing a 2D Card Game 'Spades' at Peak Games Board Studio. 

## License
Distributed under the permissive zlib license. See the LICENSE file for more info.

## Contact
Selim Bakdemir

- selim.bakdemir@gmail.com
