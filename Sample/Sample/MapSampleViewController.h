//
//  MapSampleViewController.h
//  Sample
//
//  Created by Peter Paulis on 09/08/14.
//  Copyright (c) 2014 min60 s.r.o. - Peter Paulis. All rights reserved.
//

#import "M6UniversalParallaxViewController.h"

@interface MapSampleViewController : M6UniversalParallaxViewController<UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end
