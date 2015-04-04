//
//  WebViewController.h
//  Picks
//
//  Created by Joe Fabisevich on 7/22/14.
//  Copyright (c) 2014 Snarkbots. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface CYLWebViewController : UIViewController<UIWebViewDelegate>

//If you set the URL while the WebViewController is loaded, it will load the URL
@property (nonatomic) NSURL *URL;

//If you'd like to do something to/with the share button, this is an accessor for it
@property (readonly) UIButton *shareButton;
@property UIToolbar *toolbar;

//This is just an event handler, the browser will still go back when you tap on the back button
@property (nonatomic, copy) void (^tappedBackButton)(void);

//This is just an event handler, the browser will still go forward when you tap on the forward button
@property (nonatomic, copy) void (^tappedForwardButton)(void);

//If you'd like to add in your own custom sharing code, use this property
@property (nonatomic, copy) void (^tappedShareButton)(void);

- (void)commonInit;

@end
