//
//  PagerViewController.h
//  Sample
//
//  Created by Peter Paulis on 09/08/14.
//  Copyright (c) 2014 min60 s.r.o. - Peter Paulis. All rights reserved.
//

#import "M6UniversalParallaxViewController.h"

@interface FancyViewController : M6UniversalParallaxViewController

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) IBOutlet UIView *scrollContentView;
@property (strong, nonatomic) IBOutlet UIScrollView *topParallaxScrollView;
@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;
@property (weak, nonatomic) IBOutlet UIImageView * bluredImageView;
@property (weak, nonatomic) IBOutlet UILabel *secretLabel;
@property (weak, nonatomic) IBOutlet UILabel *captionLabel;

@end
