//
//  CODDrawableView.m
//  TestPlot
//
//  Created by David Santana Molina on 02/07/14.
//  Copyright (c) 2014 2Coders Studio. All rights reserved.
//

#import "CODDrawableView.h"

@interface CODDrawableView (){

    UIBezierPath *path; // our bezier path
    
    NSMutableArray * pointsArray; // To save all the captured points
    
    BOOL finish;
    
    UIView * backgroundView;



}

@end

@implementation CODDrawableView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        [self setMultipleTouchEnabled:NO]; // Configure the number of touchs
        
        [self setBackgroundColor:[UIColor clearColor]]; //Configure the view
        
        //Initalize vars
        path = [UIBezierPath bezierPath];
        [path setLineWidth:5.0];
        
        pointsArray = [NSMutableArray array];
        finish = NO;
        
        //Set a fill color optional
        backgroundView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
        [backgroundView setBackgroundColor:[UIColor colorWithWhite:0 alpha:0.2]];
        [self addSubview:backgroundView];
        // end fill color
        
    }
    return self;
}

- (void)drawRect:(CGRect)rect
{
    [[UIColor colorWithRed:0.3 green:0.24 blue:0.56 alpha:0.5] setStroke];
    
    [path stroke];
    
    if (finish) {
        [[UIColor colorWithRed:0.3 green:0.24 blue:0.56 alpha:0.2] setFill];
        [path fill];
    }
}


#pragma mark -
#pragma mark manage touchs
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    
    if (finish) {
        return;
    }
    
    UITouch *touch = [touches anyObject];
    CGPoint p = [touch locationInView:self];
    [path moveToPoint:p];
    
    [pointsArray addObject:[NSValue valueWithCGPoint:p]];
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    
    if (finish) {
        return;
    }
    UITouch *touch = [touches anyObject];
    CGPoint p = [touch locationInView:self];
    [path addLineToPoint:p];
    [self setNeedsDisplay];
    [pointsArray addObject:[NSValue valueWithCGPoint:p]];
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    
    if (finish) {
        return;
    }
    [path closePath]; //easy close the path! we are done!
    [self setNeedsDisplay];
    
    finish = YES; //we finish
}

- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self touchesEnded:touches withEvent:event];
}

@end
