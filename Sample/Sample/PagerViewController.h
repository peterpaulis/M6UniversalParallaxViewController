//
//  PagerViewController.h
//  Sample
//
//  Created by Peter Paulis on 09/08/14.
//  Copyright (c) 2014 min60 s.r.o. - Peter Paulis. All rights reserved.
//

#import "M6UniversalParallaxViewController.h"

@interface PagerViewController : M6UniversalParallaxViewController

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) IBOutlet UIView *scrollContentView;
@property (strong, nonatomic) IBOutlet UIScrollView *topParallaxScrollView;

@end
