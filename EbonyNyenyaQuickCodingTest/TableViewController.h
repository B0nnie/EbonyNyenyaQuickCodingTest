//
//  TableViewController.h
//  EbonyNyenyaQuickCodingTest
//
//  Created by Ebony Nyenya on 4/5/15.
//  Copyright (c) 2015 Ebony Nyenya. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "APIModel.h"

//designating this class as the delegate for the APIModel protocol
@interface TableViewController : UITableViewController <APIRequestDelegate>
@end
