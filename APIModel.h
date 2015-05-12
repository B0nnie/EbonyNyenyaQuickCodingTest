//
//  APIModel.h
//  EbonyNyenyaQuickCodingTest
//
//  Created by Ebony Nyenya on 4/5/15.
//  Copyright (c) 2015 Ebony Nyenya. All rights reserved.
//

#import <Foundation/Foundation.h>

//declaring protocol to send JSON response results to TableViewController class
@protocol APIRequestDelegate <NSObject>

- (void)didFinishFetchingData:(NSMutableArray *)results;

@end

@interface APIModel : NSObject

//preparing another class to be set as this model class's delegate
@property (nonatomic, weak) id <APIRequestDelegate> delegate;

//global method the delegate class will need to implement as part of the protocol
-(void) fetchDataFromUrl: (NSString *) urlString;

@end
