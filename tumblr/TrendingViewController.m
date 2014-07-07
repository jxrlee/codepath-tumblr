//
//  TrendingViewController.m
//  tumblr
//
//  Created by Joseph Lee on 7/3/14.
//  Copyright (c) 2014 mn8. All rights reserved.
//

#import "TrendingViewController.h"

@interface TrendingViewController ()

@property (weak, nonatomic) IBOutlet UIScrollView *trendingScrollView;
@property (weak, nonatomic) IBOutlet UIImageView *trendingImageView;

@end

@implementation TrendingViewController

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
    
    //self.trendingScrollView.contentSize = self.trendingImageView.frame.size;
    
    self.trendingScrollView.contentSize = CGSizeMake(10000,10000);
    
    NSLog(@"%f %f", self.trendingScrollView.contentOffset.x, self.trendingScrollView.contentOffset.y);
    
    NSLog(@"%f %f", self.trendingScrollView.frame.size.width, self.trendingScrollView.frame
          .size.height);
    NSLog(@"%f %f", self.trendingImageView.frame.size.width, self.trendingImageView.frame
          .size.height);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
