//
//  ViewController.h
//  WebviewTest
//
//  Created by Juan Gonzalez on 7/5/13.
//  Copyright (c) 2013 Juan Gonzalez. All rights reserved.
//

/**
 * \class Controller used to load test content on a WebView and do 2 way communication via Javascript
 */

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UIWebViewDelegate>
/**
 * A button to trigger a javascript test call on the content loaded in the WebView
 */
@property (nonatomic, weak) IBOutlet UIButton *but;
/**
 * The WebView that will load the test content 
 */
@property (nonatomic, weak) IBOutlet UIWebView *webview;
@end
