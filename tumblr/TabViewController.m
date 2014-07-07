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
@property (weak, nonatomic) IBOutlet UIView *composeModal;
@property (weak, nonatomic) IBOutlet UIButton *nevermindButton;
@property (weak, nonatomic) IBOutlet UIView *textView;
@property (weak, nonatomic) IBOutlet UIView *photoView;
@property (weak, nonatomic) IBOutlet UIView *quoteView;
@property (weak, nonatomic) IBOutlet UIView *linkView;
@property (weak, nonatomic) IBOutlet UIView *chatView;
@property (weak, nonatomic) IBOutlet UIView *videoView;


- (IBAction)onHomeButton:(id)sender;
- (IBAction)onSearchButton:(id)sender;
- (IBAction)onComposeButton:(id)sender;
- (IBAction)onTrendingButton:(id)sender;
- (IBAction)onAccountButton:(id)sender;
- (IBAction)onDismiss:(id)sender;

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
        
        self.homeViewController.view.frame = self.contentView.frame;
        self.searchViewController.view.frame = self.contentView.frame;
        self.composeViewController.view.frame = self.contentView.frame;
        self.accountViewController.view.frame = self.contentView.frame;
        self.trendingViewController.view.frame = self.contentView.frame;
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // hide compose modal
    self.composeModal.alpha = 0;
    self.nevermindButton.frame = CGRectMake(self.nevermindButton.frame.origin.x, self.nevermindButton.frame.origin.y + self.nevermindButton.frame.size.height, self.nevermindButton.frame.size.width, self.nevermindButton.frame.size.height);
    
    // add homeview
    [self.contentView addSubview:self.homeViewController.view];
    
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

    //[self.contentView addSubview:self.composeViewController.view];
    
    // animate modal in
    [UIView animateWithDuration:.2 animations:^{
        self.composeModal.alpha = .95;
    }];
    
    // animate in nevermind button
    self.nevermindButton.frame = CGRectMake(self.nevermindButton.frame.origin.x, self.nevermindButton.frame.origin.y - self.nevermindButton.frame.size.height, self.nevermindButton.frame.size.width, self.nevermindButton.frame.size.height);
    
    // set compose buttons below frame
    self.textView.frame = CGRectMake(self.textView.frame.origin.x, self.view.frame.size.height, self.textView.frame.size.width, self.textView.frame.size.height);
    self.photoView.frame = CGRectMake(self.photoView.frame.origin.x, self.view.frame.size.height, self.photoView.frame.size.width, self.photoView.frame.size.height);
    self.quoteView.frame = CGRectMake(self.quoteView.frame.origin.x, self.view.frame.size.height, self.quoteView.frame.size.width, self.quoteView.frame.size.height);
    
    self.linkView.frame = CGRectMake(self.linkView.frame.origin.x, 155, self.linkView.frame.size.width, self.linkView.frame.size.height);
    self.chatView.frame = CGRectMake(self.chatView.frame.origin.x, 155, self.chatView.frame.size.width, self.chatView.frame.size.height);
    self.videoView.frame = CGRectMake(self.videoView.frame.origin.x, 155, self.videoView.frame.size.width, self.videoView.frame.size.height);
    
    
    // 155
    [UIView animateWithDuration:.4 delay:0 usingSpringWithDamping:.6 initialSpringVelocity:8 options:UIViewAnimationOptionCurveEaseIn animations:^{
        
        self.textView.frame = CGRectMake(self.textView.frame.origin.x, 155, self.textView.frame.size.width, self.textView.frame.size.height);
        self.photoView.frame = CGRectMake(self.photoView.frame.origin.x, 155, self.photoView.frame.size.width, self.photoView.frame.size.height);
        self.quoteView.frame = CGRectMake(self.quoteView.frame.origin.x, 155, self.quoteView.frame.size.width, self.quoteView.frame.size.height);
        
    } completion:nil];
    
    // 274
    [UIView animateWithDuration:.4 delay:0 usingSpringWithDamping:.4 initialSpringVelocity:8 options:UIViewAnimationOptionCurveEaseIn animations:^{
        
        self.linkView.frame = CGRectMake(self.linkView.frame.origin.x, 274, self.linkView.frame.size.width, self.linkView.frame.size.height);
        self.chatView.frame = CGRectMake(self.chatView.frame.origin.x, 274, self.chatView.frame.size.width, self.chatView.frame.size.height);
        self.videoView.frame = CGRectMake(self.videoView.frame.origin.x, 274, self.videoView.frame.size.width, self.videoView.frame.size.height);
        
    } completion:nil];
    
}

- (IBAction)onAccountButton:(id)sender {
    
    [self.contentView addSubview:self.accountViewController.view];
    
}

- (IBAction)onDismiss:(id)sender {
    
    // animate modal & nevermind out
    [UIView animateWithDuration:.2 animations:^{
        self.composeModal.alpha = 0;
        
        self.nevermindButton.frame = CGRectMake(self.nevermindButton.frame.origin.x, self.nevermindButton.frame.origin.y + self.nevermindButton.frame.size.height, self.nevermindButton.frame.size.width, self.nevermindButton.frame.size.height);
    }];
    
    // animate compose buttons out
    [UIView animateWithDuration:.2 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        
        self.textView.frame = CGRectMake(self.textView.frame.origin.x, 0 - self.textView.frame.size.height, self.textView.frame.size.width, self.textView.frame.size.height);
        self.photoView.frame = CGRectMake(self.photoView.frame.origin.x, 0 - self.photoView.frame.size.height, self.photoView.frame.size.width, self.photoView.frame.size.height);
        self.quoteView.frame = CGRectMake(self.quoteView.frame.origin.x, 0 - self.quoteView.frame.size.height, self.quoteView.frame.size.width, self.quoteView.frame.size.height);
        self.linkView.frame = CGRectMake(self.linkView.frame.origin.x, 0 - self.linkView.frame.size.height, self.linkView.frame.size.width, self.linkView.frame.size.height);
        self.chatView.frame = CGRectMake(self.chatView.frame.origin.x, 0 - self.chatView.frame.size.height, self.chatView.frame.size.width, self.chatView.frame.size.height);
        self.videoView.frame = CGRectMake(self.videoView.frame.origin.x, 0 - self.videoView.frame.size.height, self.videoView.frame.size.width, self.videoView.frame.size.height);
        
    } completion:nil];
    
    
}

- (IBAction)onTrendingButton:(id)sender {
    
    [self.contentView addSubview:self.trendingViewController.view];
    
}

- (void)showCompose {
    
}


@end
