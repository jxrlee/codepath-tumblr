//
//  TabViewController.m
//  tumblr
//
//  Created by Joseph Lee on 7/3/14.
//  Copyright (c) 2014 mn8. All rights reserved.
//

#import "TabViewController.h"
#import "HomeViewController.h"
#import "SearchViewController.h"
#import "ComposeViewController.h"
#import "AccountViewController.h"
#import "TrendingViewController.h"


@interface TabViewController ()

@property (nonatomic, weak) IBOutlet UIView *contentView;
@property (nonatomic, strong) HomeViewController *homeViewController;
@property (nonatomic, strong) SearchViewController *searchViewController;
@property (nonatomic, strong) ComposeViewController *composeViewController;
@property (nonatomic, strong) AccountViewController *accountViewController;
@property (nonatomic, strong) TrendingViewController *trendingViewController;

- (IBAction)onHomeButton:(id)sender;
- (IBAction)onSearchButton:(id)sender;
- (IBAction)onComposeButton:(id)sender;
- (IBAction)onTrendingButton:(id)sender;
- (IBAction)onAccountButton:(id)sender;

@end

@implementation TabViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
        self.HomeViewController = [[HomeViewController alloc] init];
        self.SearchViewController = [[SearchViewController alloc] init];
        self.ComposeViewController = [[ComposeViewController alloc] init];
        self.AccountViewController = [[AccountViewController alloc] init];
        self.TrendingViewController = [[TrendingViewController alloc] init];
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onHomeButton:(id)sender {
    
    [self.contentView addSubview:self.homeViewController.view];
    
}

- (IBAction)onSearchButton:(id)sender {
    
    [self.contentView addSubview:self.searchViewController.view];
    
}

- (IBAction)onComposeButton:(id)sender {

    [self.contentView addSubview:self.composeViewController.view];
    
}

- (IBAction)onAccountButton:(id)sender {
    
    [self.contentView addSubview:self.accountViewController.view];
    
}

- (IBAction)onTrendingButton:(id)sender {
    
    [self.contentView addSubview:self.trendingViewController.view];
    
}


@end
