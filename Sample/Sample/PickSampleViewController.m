//
//  PickSampleViewController.m
//  Sample
//
//  Created by Peter Paulis on 09/08/14.
//  Copyright (c) 2014 min60 s.r.o. - Peter Paulis. All rights reserved.
//

#import "PickSampleViewController.h"

#import "MapSampleViewController.h"
#import "ImageSampleViewController.h"
#import "PagerViewController.h"
#import "FancyViewController.h"
#import "SimpleScrollViewController.h"

@interface PickSampleViewController ()

@end

@implementation PickSampleViewController

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
    // Do any additional setup after loading the view from its nib.
    
    self.navigationItem.title = @"Pick sample";
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

////////////////////////////////////////////////////////////////////////
#pragma mark -
////////////////////////////////////////////////////////////////////////

- (IBAction)imageButtonPressed:(id)sender {
    
    ImageSampleViewController * isvc = [ImageSampleViewController new];
    [self.navigationController pushViewController:isvc animated:YES];
    
}

- (IBAction)mapButtonPressed:(id)sender {

    MapSampleViewController * msvc = [MapSampleViewController new];
    [self.navigationController pushViewController:msvc animated:YES];
    
}

- (IBAction)scrollPagingPressed:(id)sender {

    PagerViewController * pvc = [PagerViewController new];
    [self.navigationController pushViewController:pvc animated:YES];
    
}

- (IBAction)fancyPressed:(id)sender {

    FancyViewController * fvc = [FancyViewController new];
    [self.navigationController pushViewController:fvc animated:YES];
    
}

- (IBAction)simpleScrollView:(id)sender {

    SimpleScrollViewController * ssvc = [SimpleScrollViewController new];
    [self.navigationController pushViewController:ssvc animated:YES];
    
}

@end
