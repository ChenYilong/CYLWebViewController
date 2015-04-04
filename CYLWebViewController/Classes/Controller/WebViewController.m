//
//  WebViewController.m
//  Picks
//
//  Created by Joe Fabisevich on 7/22/14.
//  Copyright (c) 2014 Snarkbots. All rights reserved.
//

//#import "CustomButtons.h"
#import "WebViewController.h"
#import "ForwardArrowButton.h"
#import "ShareButton.h"
#import "BackArrowButton.h"

#import "PureLayout.h"
#define floatVal(val) ((float)val/(float)255)
#define lightBlueColor [UIColor colorWithRed:floatVal(1) green:floatVal(126) blue:floatVal(204) alpha:1.0f]

////////////////////////////////////////////////////////////////////////////////
#pragma mark - Constants

CGFloat const WebViewControllertoolbarHeight = 44.0f;


////////////////////////////////////////////////////////////////////////////////
#pragma mark - Interface

@interface WebViewController ()
<
UIScrollViewDelegate
>

@property UIRefreshControl *refreshControl;
@property UIWebView *webView;

@property UIBarButtonItem *backItem;
@property UIBarButtonItem *forwardItem;

@property NSLayoutConstraint *toolbarBottomConstraint;

@property BOOL viewHasAppeared;

@end


////////////////////////////////////////////////////////////////////////////////
#pragma mark - Implementation

@implementation WebViewController


////////////////////////////////////////////////////////////////////////////////
#pragma mark - Lifecycle methods

- (void)viewDidLoad
{
    [self commonInit];
    
    [self load];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self.navigationController setNavigationBarHidden:YES animated:YES];
    [[UIApplication sharedApplication] setStatusBarHidden:YES withAnimation:UIStatusBarAnimationSlide];
}

- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    
    if (!self.viewHasAppeared)
    {
        self.viewHasAppeared = YES;
        [self setupConstraints];
    }
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    [self.navigationController setNavigationBarHidden:NO animated:NO];
    [[UIApplication sharedApplication] setStatusBarHidden:NO withAnimation:UIStatusBarAnimationSlide];
}


////////////////////////////////////////////////////////////////////////////////
#pragma mark - Setup

- (void)commonInit
{
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    UIColor *backgroundColor = [UIColor whiteColor];
    self.view.backgroundColor = backgroundColor;
    
    _webView = [[UIWebView alloc] init];
    [self.view addSubview:_webView];
    _webView.scalesPageToFit = YES;
    _webView.backgroundColor = backgroundColor;
    _webView.delegate = self;
    
    _toolbar = [[UIToolbar alloc] init];
    [self.view addSubview:_toolbar];
    _toolbar.translucent = YES;
    
    CGFloat const browserButtonWidth = 50.0f;
    CGFloat const buttonHeight = 30.0f;
    
    BackArrowButton *backButton = [BackArrowButton buttonWithType:UIButtonTypeCustom];
    backButton.frame = CGRectMake(0, 0, browserButtonWidth, buttonHeight);
    [backButton addTarget:self action:@selector(goBack) forControlEvents:UIControlEventTouchUpInside];
    backButton.tintColor = lightBlueColor;
    _backItem = [[UIBarButtonItem alloc] initWithCustomView:backButton];
    
    ForwardArrowButton *forwardButton = [ForwardArrowButton buttonWithType:UIButtonTypeCustom];
    forwardButton.frame = CGRectMake(0, 0, browserButtonWidth, buttonHeight);
    [forwardButton addTarget:self action:@selector(goForward) forControlEvents:UIControlEventTouchUpInside];
    forwardButton.tintColor = lightBlueColor;
    _forwardItem = [[UIBarButtonItem alloc] initWithCustomView:forwardButton];
    
    _shareButton = [ShareButton buttonWithType:UIButtonTypeCustom];
    _shareButton.frame = CGRectMake(0, 0, buttonHeight, buttonHeight);
    _shareButton.tintColor = lightBlueColor;
    [_shareButton addTarget:self action:@selector(showSharingOptions) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *shareItem = [[UIBarButtonItem alloc] initWithCustomView:_shareButton];
    
    CGFloat const buttonWidth = 60.0f;
    UIButton *doneButton = [UIButton buttonWithType:UIButtonTypeSystem];
    doneButton.layer.cornerRadius = 4.0f;
    doneButton.frame = CGRectMake(0, 0, buttonWidth, buttonHeight);
    doneButton.titleLabel.font = [UIFont fontWithName:@"Avenir-Heavy" size:17.0f];
    doneButton.tintColor = [UIColor whiteColor];
    doneButton.backgroundColor = lightBlueColor;
    [doneButton setTitle:NSLocalizedString(@"Done", nil) forState:UIControlStateNormal];
    [doneButton addTarget:self action:@selector(dismissViewControllerAnimated) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *doneItem = [[UIBarButtonItem alloc] initWithCustomView:doneButton];
    
    UIBarButtonItem *wideFixedSpaceItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    wideFixedSpaceItem.width = 10.0f;
    
    UIBarButtonItem *flexibleSpaceItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    
    _toolbar.tintColor = lightBlueColor;
    _toolbar.translatesAutoresizingMaskIntoConstraints = YES;
    _toolbar.items = @[ _backItem, wideFixedSpaceItem, _forwardItem, flexibleSpaceItem, shareItem, wideFixedSpaceItem, doneItem, ];
    
    self.refreshControl = [[UIRefreshControl alloc] init];
    self.refreshControl.tintColor = [UIColor colorWithRed:0.2f green:0.2f blue:0.2f alpha:1.0f];
    [self.refreshControl addTarget:self action:@selector(refreshWebView) forControlEvents:UIControlEventValueChanged];
    [self.webView.scrollView addSubview:self.refreshControl];
    self.webView.scrollView.delegate = self;
    
    [self setBrowserButtonState];
}

- (void)setupConstraints
{
    _webView.translatesAutoresizingMaskIntoConstraints = NO;
    _toolbar.translatesAutoresizingMaskIntoConstraints = NO;
    [_webView autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsMake(self.topLayoutGuide.length, 0, 0, 0)];
    
    self.toolbarBottomConstraint = [_toolbar autoPinEdgeToSuperviewEdge:ALEdgeBottom withInset:0];
    [_toolbar autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:0];
    [_toolbar autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:0];
    [_toolbar autoSetDimension:ALDimensionHeight toSize:WebViewControllertoolbarHeight];
    
    [self.view layoutIfNeeded];
}


////////////////////////////////////////////////////////////////////////////////
#pragma mark - Delegation - UIWebView

- (void)webViewDidStartLoad:(UIWebView *)webView
{
    [self setToolbarVisible:YES];
}

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    [self setBrowserButtonState];
    
    if (self.refreshControl.isRefreshing)
    {
        [self.refreshControl endRefreshing];
    }
}


////////////////////////////////////////////////////////////////////////////////
#pragma mark - Delegation - UIScrollView

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat translation = [scrollView.panGestureRecognizer translationInView:scrollView.superview].y;
    BOOL scrollingUp = (translation > 0.0f);
    if (!self.webView.isLoading)
    {
        [self setToolbarVisible:scrollingUp];
    }
}


////////////////////////////////////////////////////////////////////////////////
#pragma mark - Mutators

- (void)setURL:(NSURL *)URL
{
    _URL = URL;
    
    if (self.isViewLoaded)
    {
        [self load];
    }
}


////////////////////////////////////////////////////////////////////////////////
#pragma mark - Public methods

- (void)load
{
    if (self.URL)
    {
        NSURLRequest *request = [NSURLRequest requestWithURL:self.URL];
        [self.webView loadRequest:request];
    }
}


////////////////////////////////////////////////////////////////////////////////
#pragma mark - Private methods

- (void)goBack
{
    if (self.tappedBackButton)
    {
        self.tappedBackButton();
    }
    
    [self.webView goBack];
}

- (void)goForward
{
    if (self.tappedForwardButton)
    {
        self.tappedForwardButton();
    }
    [self.webView goForward];
}

- (void)refreshWebView
{
    [self.webView stopLoading];
    [self.webView reload];
}

- (void)setBrowserButtonState
{
    self.backItem.enabled = [self.webView canGoBack];
    self.forwardItem.enabled = [self.webView canGoForward];
}

- (void)showSharingOptions
{
    if (self.tappedShareButton)
    {
        self.tappedShareButton();
    }
    else if (self.URL)
    {
        UIActivityViewController *activityViewController = [[UIActivityViewController alloc] initWithActivityItems:@[ self.URL ] applicationActivities:nil];
        [self presentViewController:activityViewController animated:YES completion:nil];
    }
}

- (void)dismissViewControllerAnimated
{
    BOOL isPresented = self.presentingViewController.presentedViewController == self
    || self.navigationController.presentingViewController.presentedViewController == self.navigationController
    || [self.tabBarController.presentingViewController isKindOfClass:[UITabBarController class]];
    
    if (isPresented)
    {
        [self dismissViewControllerAnimated:YES completion:nil];
    }
    else
    {
        [self.navigationController popViewControllerAnimated:YES];
    }
}

- (void)setToolbarVisible:(BOOL)visible
{
    self.toolbarBottomConstraint.constant = (visible) ? 0 : WebViewControllertoolbarHeight;
    
    [UIView animateWithDuration:0.4f delay:0.0f usingSpringWithDamping:0.75f initialSpringVelocity:0.0f options:UIViewAnimationOptionCurveEaseInOut animations:^{
        [self.view layoutIfNeeded];
    } completion:nil];
}

@end
