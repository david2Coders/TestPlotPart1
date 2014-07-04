//
//  CODMainControllerViewController.m
//  TestPlot
//
//  Created by David Santana Molina on 02/07/14.
//  Copyright (c) 2014 2Coders Studio. All rights reserved.
//

#import "CODMainControllerViewController.h"
#import "CODDrawableView.h"
@interface CODMainControllerViewController ()

@end

@implementation CODMainControllerViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    CODDrawableView * drawableView = [[CODDrawableView alloc]initWithFrame:self.view.bounds];
    
    [self.view addSubview:drawableView];
    
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
