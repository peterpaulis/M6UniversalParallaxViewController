//
//  PagerViewController.m
//  Sample
//
//  Created by Peter Paulis on 09/08/14.
//  Copyright (c) 2014 min60 s.r.o. - Peter Paulis. All rights reserved.
//

#import "PagerViewController.h"

@interface PagerViewController ()

@end

@implementation PagerViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:NSStringFromClass([UITableViewCell class])];
    
    [self.topParallaxScrollView addSubview:self.scrollContentView];
    self.topParallaxScrollView.contentSize = self.scrollContentView.frame.size;
    
}

- (void)parallaxViewContainerHeightWillChange:(CGFloat)newHeight fromOldHeight:(CGFloat)height {
    
    self.topParallaxScrollView.contentSize = CGSizeMake(self.scrollContentView.frame.size.width, newHeight);
    
    CGRect frame = self.scrollContentView.frame;
    frame.size.height = newHeight;
    self.scrollContentView.frame = frame;
}

////////////////////////////////////////////////////////////////////////
#pragma mark - UITableViewCell delegate
////////////////////////////////////////////////////////////////////////

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 6;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([UITableViewCell class])];
    cell.textLabel.text = [NSString stringWithFormat:@"%@ %@", @(indexPath.section), @(indexPath.row)];
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return [NSString stringWithFormat:@"Section %@", @(section)];
}

@end
