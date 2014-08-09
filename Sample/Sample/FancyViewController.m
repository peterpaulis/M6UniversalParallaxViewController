//
//  PagerViewController.m
//  Sample
//
//  Created by Peter Paulis on 09/08/14.
//  Copyright (c) 2014 min60 s.r.o. - Peter Paulis. All rights reserved.
//

#import "FancyViewController.h"

#import "UIImage+ImageEffects.h"

@interface FancyViewController ()

@end

@implementation FancyViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:NSStringFromClass([UITableViewCell class])];
    
    [self.topParallaxScrollView addSubview:self.scrollContentView];
    self.topParallaxScrollView.contentSize = self.scrollContentView.frame.size;
    
    self.bluredImageView.image = [self captureScrollContentViewImageWithBlur];
    
}

- (UIImage *)captureScrollContentViewImageWithBlur {
    
    CGFloat previousAlpha = self.parallaxView.alpha;
    self.parallaxView.alpha = 1.f;
    
    CGRect rect = [self.parallaxContainerView bounds];
    if (rect.size.height <= 1) {
        return nil;
    }
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    [self.parallaxContainerView.layer renderInContext:context];
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    self.parallaxView.alpha = previousAlpha;
    
    return [img applyBlurWithRadius:20 tintColor:nil saturationDeltaFactor:2.f maskImage:nil];
}

////////////////////////////////////////////////////////////////////////
#pragma mark - Overwrite
////////////////////////////////////////////////////////////////////////


- (void)parallaxViewContainerHeightWillChange:(CGFloat)newHeight fromOldHeight:(CGFloat)height {
    
    self.topParallaxScrollView.contentSize = CGSizeMake(self.scrollContentView.frame.size.width, newHeight);
    
    CGRect frame = self.scrollContentView.frame;
    frame.size.height = newHeight;
    self.scrollContentView.frame = frame;
    
    CGFloat r = MIN(MAX(0.f, (newHeight / 250.f) * (newHeight / 250.f) * (newHeight / 250.f)), 1.f);
    self.parallaxView.alpha = r;
    
    self.bluredImageView.alpha = MIN(MAX(0.f, (newHeight - 270.f) / 50.f ), 1.f);
    
    self.secretLabel.alpha = self.bluredImageView.alpha;
    
}

////////////////////////////////////////////////////////////////////////
#pragma mark - ScrollCell delegate
////////////////////////////////////////////////////////////////////////

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if (scrollView == self.topParallaxScrollView) {
        self.pageControl.currentPage = scrollView.contentOffset.x/scrollView.frame.size.width;
        
        if (self.pageControl.currentPage == 0) {
            self.captionLabel.text = @"Castle in France";
        } else if (self.pageControl.currentPage == 1) {
            self.captionLabel.text = @"Hospital in Baune";
        } else if (self.pageControl.currentPage == 2) {
            self.captionLabel.text = @"Village in countryside";
        }
    }
    
    //!!!!!!!!!!! always call super
    [super scrollViewDidScroll:scrollView];
    
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
 
    if (scrollView == self.topParallaxScrollView) {
        self.bluredImageView.image = [self captureScrollContentViewImageWithBlur];
    }
    
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
