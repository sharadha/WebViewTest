//
//  AppDelegate.h
//  WebviewTest
//
//  Created by Juan Gonzalez on 7/5/13.
//  Copyright (c) 2013 Juan Gonzalez. All rights reserved.
//

/*! \mainpage WebViewTest documentation
 *
 * \section intro_sec Sample Project : WebViewTest
 *
 * The WebViewTest project is an example of how to create 2 way communication with content loaded inside a WebView using Javascript
    
    The included index.html file can communicate back via javascript with a host iOS or Android app. For this example only the iOS callback is relevant.
 *
 * \subsection objc_to_java Objective C to Javascript
 *
 *  Objective C to Javascript communication is achieved with the WebView method [webview stringByEvaluatingJavaScriptFromString:string] refer to Apple's documentation for further details.
    
    In this example we use this communications in the ViewController class on the methods testJavascript:(id)sender and webViewDidFinishLoad:(UIWebView *)webView.
    
    The javascript calls used for Objective C to Javascript in the html are:
 
    - setHostApp("iOS")
 
    Sets an internal variable (hostApp) that specifies if the host app is iOS or Android to later perform Javascript to Objective C communication
 
 *
 * \subsection java_to_objc Javascript to Objective C
 *
 *  Javascript to Objective C communication is achieved via the WebViewDelegate method webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType refer to Apple's documentation for further details.
 
    The Javascript call that communicates back to Objective C is
 
    - sayHello()
 
    This function will communicate with the host app. It supports communication to iOS and to Android
 
    Once the content is loaded on the WebView, we make a call to setHostApp("iOS") to specify iOS as the host app. After that, the javascript call sayHello() will use the internal variable hostApp to use the appropiate communication method.
    
    For iOS it will be to attempt to launch a custom scheme 'app://test' that we can detect in the (UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType WebView delegate method
 */

#import <UIKit/UIKit.h>

@class ViewController;

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) ViewController *viewController;

@end
