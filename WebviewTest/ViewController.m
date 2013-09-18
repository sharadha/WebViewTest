//
//  ViewController.m
//  WebviewTest
//
//  Created by Juan Gonzalez on 7/5/13.
//  Copyright (c) 2013 Juan Gonzalez. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@end

@implementation ViewController

@synthesize but, webview;

#pragma -mark

/** 
 *  \brief viewDidLoad executed when the view has loaded
 *  
 *  The webview is setup by assigning a delegate and request to load.
 *  The test button's action is setup to the selector testJavascript:
 *
 *  \param none
 *
 *  \sa testJavascript:(id)sender
 *  \sa webViewDidFinishLoad:(UIWebView *)webView
 *  \sa webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
 */
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [webview setDelegate:self];
    NSString *htmlFile = [[NSBundle mainBundle] pathForResource:@"index" ofType:@"html"];
    NSString* htmlString = [NSString stringWithContentsOfFile:htmlFile encoding:NSUTF8StringEncoding error:nil];
    [webview loadHTMLString:htmlString baseURL:nil];
    
    [but addTarget:self action:@selector(testJavascript:) forControlEvents:UIControlEventTouchUpInside];
}

/**
 *  \brief default didReceiveMemoryWarning
 *
 *  Nothing implemented
 *
 */
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma -mark custom instance methods

/**
 *  \brief Call triggered by the test button
 *
 *  Calls the javascript function sayHello() inside the loaded content
 *
 *  \param sender The sender of the call
 *
 */
-(void)testJavascript:(id)sender
{
    NSString *javascriptString;
    javascriptString = @"sayHello()";
    [webview stringByEvaluatingJavaScriptFromString:javascriptString];
}

#pragma -mark WebViewDelegate methods

/**
 *  \brief Webview delegate method called when content on the WebView has finished loading
 *
 *  Calls the javascript function setHostApp('iOS') to tell the loaded content it is loaded inside an iOS Webview
 *
 *  \param webView The WebView that has finished loading the request
 *
 */
- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    NSString *param = @"iOS";
    NSString *javascriptString = [NSString stringWithFormat:@"setHostApp(\"%@\")",param];
    NSLog(@"calling %@",javascriptString);
    [webview stringByEvaluatingJavaScriptFromString:javascriptString];
}

/**
 *  \brief Webview delegate method called before loading a request
 *
 *  Used to catch an attempt to load a custom scheme 'app://test' to communicate from Javascript to Objective C.
    Launches a UIAlertView to confirm communication from Javascript to Objective C
 *
 *  \param webView The WebView that has finished loading the request
 *  \param request The request being loaded
 *  \param navigationType Constant indicating the user’s action
 *
 *  \return false when the custom scheme is detected, true otherwise.
 */
- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    NSLog(@"load request %@",[request URL]);
    if([[[request URL] absoluteString] isEqualToString:@"app://test"])
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"WEEE"
                                                        message:@"this was called from JS"
                                                       delegate:nil
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
        [alert show];
        NSLog(@"called from JS");
        return false;
    }
    return true;
}
@end
