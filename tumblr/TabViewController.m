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
#import "LoadingViewController.h"
#import "ActivityViewController.h"


@interface TabViewController ()

@property (nonatomic, weak) IBOutlet UIView *contentView;

@property (nonatomic, strong) HomeViewController *homeViewController;
@property (nonatomic, strong) SearchViewController *searchViewController;
@property (nonatomic, strong) ComposeViewController *composeViewController;
@property (nonatomic, strong) AccountViewController *accountViewController;
@property (nonatomic, strong) TrendingViewController *trendingViewController;
@property (nonatomic, strong) LoadingViewController *loadingViewController;
@property (nonatomic, strong) ActivityViewController *activityViewController;

@property (weak, nonatomic) IBOutlet UIButton *homeButton;
@property (weak, nonatomic) IBOutlet UIButton *searchButton;
@property (weak, nonatomic) IBOutlet UIButton *composeButton;
@property (weak, nonatomic) IBOutlet UIButton *trendingButton;
@property (weak, nonatomic) IBOutlet UIButton *accountButton;


@property (weak, nonatomic) IBOutlet UIView *composeModal;
@property (weak, nonatomic) IBOutlet UIButton *nevermindButton;

@property (weak, nonatomic) IBOutlet UIView *textView;
@property (weak, nonatomic) IBOutlet UIView *photoView;
@property (weak, nonatomic) IBOutlet UIView *quoteView;
@property (weak, nonatomic) IBOutlet UIView *linkView;
@property (weak, nonatomic) IBOutlet UIView *chatView;
@property (weak, nonatomic) IBOutlet UIView *videoView;

@property (strong, nonatomic) UIImageView *tooltipView;

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
        //self.SearchViewController = [[SearchViewController alloc] init];
        self.ComposeViewController = [[ComposeViewController alloc] init];
        self.AccountViewController = [[AccountViewController alloc] init];
        self.TrendingViewController = [[TrendingViewController alloc] init];
        self.LoadingViewController = [[LoadingViewController alloc] init];
        self.activityViewController = [[ActivityViewController alloc] init];
        
        //self.homeViewController.view.frame = self.contentView.frame;
        //self.searchViewController.view.frame = self.contentView.frame;
        self.composeViewController.view.frame = self.contentView.frame;
        self.accountViewController.view.frame = self.contentView.frame;
        self.activityViewController.view.frame = self.contentView.frame;
        
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
    [self.homeButton    setSelected:YES];
    
    // add tooltip
    UIImage * tooltipImage = [UIImage imageNamed:@"tooltip"];
    self.tooltipView = [[UIImageView alloc] initWithImage:tooltipImage];
    self.tooltipView.frame = CGRectMake(6, 462, tooltipImage.size.width, tooltipImage.size.height);
    [self.view addSubview:self.tooltipView];
    [self startTooltip];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onHomeButton:(id)sender {
    
    [self.homeButton    setSelected:YES];
    [self.searchButton  setSelected:NO];
    [self.accountButton  setSelected:NO];
    [self.trendingButton  setSelected:NO];
    
    [self.contentView addSubview:self.homeViewController.view];
    [self startTooltip];
}

- (IBAction)onSearchButton:(id)sender {
    
    [self.homeButton    setSelected:NO];
    [self.searchButton  setSelected:YES];
    [self.accountButton  setSelected:NO];
    [self.trendingButton  setSelected:NO];
    
    [self stopTooltip];
    
    //self.trendingViewController.view.frame = self.contentView.frame;
    [self.contentView addSubview:self.loadingViewController.view];
    
    [self performSelector:@selector(loadTrending) withObject:nil afterDelay:2];
        
}

- (IBAction)onComposeButton:(id)sender {
    
    [self stopTooltip];
    
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
    
    self.linkView.frame = CGRectMake(self.linkView.frame.origin.x, self.view.frame.size.height, self.linkView.frame.size.width, self.linkView.frame.size.height);
    self.chatView.frame = CGRectMake(self.chatView.frame.origin.x, self.view.frame.size.height, self.chatView.frame.size.width, self.chatView.frame.size.height);
    self.videoView.frame = CGRectMake(self.videoView.frame.origin.x, self.view.frame.size.height, self.videoView.frame.size.width, self.videoView.frame.size.height);
    
    
    // toprow 155 bottomrow 274
    
    // first
    [UIView animateWithDuration:.35 delay:0 usingSpringWithDamping:.8 initialSpringVelocity:8 options:UIViewAnimationOptionCurveEaseIn animations:^{
        
        self.photoView.frame = CGRectMake(self.photoView.frame.origin.x, 155, self.photoView.frame.size.width, self.photoView.frame.size.height);
        
    } completion:nil];
    // second
    [UIView animateWithDuration:.35 delay:.05 usingSpringWithDamping:.8 initialSpringVelocity:8 options:UIViewAnimationOptionCurveEaseIn animations:^{
        
        self.textView.frame = CGRectMake(self.textView.frame.origin.x, 155, self.textView.frame.size.width, self.textView.frame.size.height);
        
    } completion:nil];
    // third
    [UIView animateWithDuration:.35 delay:.1 usingSpringWithDamping:.8 initialSpringVelocity:8 options:UIViewAnimationOptionCurveEaseIn animations:^{
        
        self.quoteView.frame = CGRectMake(self.quoteView.frame.origin.x, 155, self.quoteView.frame.size.width, self.quoteView.frame.size.height);
        
    } completion:nil];
    // fourth
    [UIView animateWithDuration:.35 delay:.15 usingSpringWithDamping:.7 initialSpringVelocity:8 options:UIViewAnimationOptionCurveEaseIn animations:^{
        
        self.linkView.frame = CGRectMake(self.linkView.frame.origin.x, 274, self.linkView.frame.size.width, self.linkView.frame.size.height);
        
    } completion:nil];
    // fifth
    [UIView animateWithDuration:.35 delay:.20 usingSpringWithDamping:.7 initialSpringVelocity:8 options:UIViewAnimationOptionCurveEaseIn animations:^{
        
        self.chatView.frame = CGRectMake(self.chatView.frame.origin.x, 274, self.chatView.frame.size.width, self.chatView.frame.size.height);
        
    } completion:nil];
    // last
    [UIView animateWithDuration:.35 delay:.25 usingSpringWithDamping:.7 initialSpringVelocity:8 options:UIViewAnimationOptionCurveEaseIn animations:^{
        
        self.videoView.frame = CGRectMake(self.videoView.frame.origin.x, 274, self.videoView.frame.size.width, self.videoView.frame.size.height);
        
    } completion:nil];
        
}

- (IBAction)onAccountButton:(id)sender {
    
    [self.homeButton    setSelected:NO];
    [self.searchButton  setSelected:NO];
    [self.accountButton  setSelected:YES];
    [self.trendingButton  setSelected:NO];
    
    [self.contentView addSubview:self.accountViewController.view];
    [self startTooltip];
    
}

- (IBAction)onDismiss:(id)sender {
    
    // animate modal & nevermind out
    [UIView animateWithDuration:.4 animations:^{
        self.composeModal.alpha = 0;
        
        self.nevermindButton.frame = CGRectMake(self.nevermindButton.frame.origin.x, self.nevermindButton.frame.origin.y + self.nevermindButton.frame.size.height, self.nevermindButton.frame.size.width, self.nevermindButton.frame.size.height);
    }];
    
    
    // first
    [UIView animateWithDuration:.5 delay:0 usingSpringWithDamping:.8 initialSpringVelocity:8 options:UIViewAnimationOptionCurveEaseIn animations:^{
        
        self.photoView.frame = CGRectMake(self.photoView.frame.origin.x, 0 - self.photoView.frame.size.height, self.photoView.frame.size.width, self.photoView.frame.size.height);
        
    } completion:nil];
    // second
    [UIView animateWithDuration:.5 delay:.05 usingSpringWithDamping:.8 initialSpringVelocity:8 options:UIViewAnimationOptionCurveEaseIn animations:^{
        
        self.textView.frame = CGRectMake(self.textView.frame.origin.x, 0 - self.textView.frame.size.height, self.textView.frame.size.width, self.textView.frame.size.height);
        
    } completion:nil];
    // third
    [UIView animateWithDuration:.5 delay:.1 usingSpringWithDamping:.8 initialSpringVelocity:8 options:UIViewAnimationOptionCurveEaseIn animations:^{
        
        self.quoteView.frame = CGRectMake(self.quoteView.frame.origin.x, 0 - self.quoteView.frame.size.height, self.quoteView.frame.size.width, self.quoteView.frame.size.height);
        
    } completion:nil];
    // fourth
    [UIView animateWithDuration:.5 delay:.15 usingSpringWithDamping:.7 initialSpringVelocity:8 options:UIViewAnimationOptionCurveEaseIn animations:^{
        
        self.linkView.frame = CGRectMake(self.linkView.frame.origin.x, 0 - self.linkView.frame.size.height, self.linkView.frame.size.width, self.linkView.frame.size.height);
        
    } completion:nil];
    // fifth
    [UIView animateWithDuration:.5 delay:.20 usingSpringWithDamping:.7 initialSpringVelocity:8 options:UIViewAnimationOptionCurveEaseIn animations:^{
        
        self.chatView.frame = CGRectMake(self.chatView.frame.origin.x, 0 - self.chatView.frame.size.height, self.chatView.frame.size.width, self.chatView.frame.size.height);
        
    } completion:nil];
    // last
    [UIView animateWithDuration:.5 delay:.25 usingSpringWithDamping:.7 initialSpringVelocity:8 options:UIViewAnimationOptionCurveEaseIn animations:^{
        
        self.videoView.frame = CGRectMake(self.videoView.frame.origin.x, 0 - self.videoView.frame.size.height, self.videoView.frame.size.width, self.videoView.frame.size.height);
        
    } completion:nil];

    
}



- (IBAction)onTrendingButton:(id)sender {
    
    [self.homeButton    setSelected:NO];
    [self.searchButton  setSelected:NO];
    [self.accountButton  setSelected:NO];
    [self.trendingButton  setSelected:YES];
    
    //self.trendingViewController.view.frame = self.contentView.frame;
    [self.contentView addSubview:self.activityViewController.view];
    
    [self startTooltip];
    
}

- (void)loadTrending {
    
    [self.contentView addSubview:self.trendingViewController.view];

}

- (void)selectButton:(UIButton*)sender {
    
    
}

- (void)startTooltip {
    
    [UIView animateWithDuration:1 delay:1 options:UIViewAnimationOptionAutoreverse | UIViewAnimationOptionRepeat | UIViewAnimationCurveEaseInOut animations:^{
        self.tooltipView.frame = CGRectMake(6, 467, self.tooltipView.frame.size.width, self.tooltipView.frame.size.height);
    } completion:nil];
    self.tooltipView.hidden = NO;
    
}

- (void)stopTooltip {
    
    self.tooltipView.hidden = YES;
    
}


@end
