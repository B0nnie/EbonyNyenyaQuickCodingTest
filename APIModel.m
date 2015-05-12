//
//  APIModel.m
//  EbonyNyenyaQuickCodingTest
//
//  Created by Ebony Nyenya on 4/5/15.
//  Copyright (c) 2015 Ebony Nyenya. All rights reserved.
//


#import "APIModel.h"

@implementation APIModel
@synthesize delegate;

// fetch data from url, and send results to delegate
-(void) fetchDataFromUrl: (NSString *) urlString {
    
    //turn a string into a URL and sends a request to the URL (what I'd write)
    //1) request: request from a URL string
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL
                                                          URLWithString: urlString]];
    
    
    NSError *error = nil;
    
    //2)JSON response: retreive JSON data with the request
    NSData *JSONResponse = [NSURLConnection sendSynchronousRequest:request
                                             returningResponse:nil error:&error];
    
    if (error != nil) {
        
        //let me know if there is an error contacting the URL
        NSLog(@"%@", error.localizedDescription);
    }
    
    
    //serialize the JSON results into an array and send to delegate class
    else {
        NSError *jsonParsingError = nil;
        
        //3) transform the JSON data into an array
        NSMutableArray *results = [NSJSONSerialization JSONObjectWithData:JSONResponse
                                                                  options:0 error:&jsonParsingError];
        
        //let me know if there is an error getting the JSON data
        if (jsonParsingError != nil) {
            
            NSLog(@"%@", jsonParsingError.localizedDescription);
        }
        
        //send the JSON results to the delegate class and do this asynchronously
        else {
            
            if (delegate != nil) {
                
                dispatch_async(dispatch_get_main_queue(),
                               ^{
                                   //4) send the array of data we retrieved to the delegate class
                                   [delegate didFinishFetchingData:results];
                               });
                
            }
            
        }
        
        
    }
    
}


@end
