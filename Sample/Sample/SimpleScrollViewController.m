//
//  SimpleScrollViewController.m
//  Sample
//
//  Created by Peter Paulis on 09/08/14.
//  Copyright (c) 2014 min60 s.r.o. - Peter Paulis. All rights reserved.
//

#import "SimpleScrollViewController.h"

@interface SimpleScrollViewController ()

@end

@implementation SimpleScrollViewController


- (void)viewDidLoad
{
    [super viewDidLoad];

    [self.scrollView addSubview:self.scrollViewContent];
    self.scrollView.contentSize = self.scrollViewContent.frame.size;
    
}

@end
