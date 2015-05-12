//
//  TableViewController.m
//  EbonyNyenyaQuickCodingTest
//
//  Created by Ebony Nyenya on 4/5/15.
//  Copyright (c) 2015 Ebony Nyenya. All rights reserved.
//

#import "TableViewController.h"
#import "APIModel.h"


@interface TableViewController ()
//global variable used to store JSON results
@property NSArray *arrayOfBooksDict;

@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //creating an instance of the APIModel class and setting TableViewController class as its delegate
    APIModel *api = [[APIModel alloc] init];
    api.delegate = self;
    
    NSString *myURL = @"http://de-coding-test.s3.amazonaws.com/books.json";
    
    [api fetchDataFromUrl:myURL];
    
    // Registering the tableViewCell to this TableViewController programmatically instead of through storyboard
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

//storing JSON results in global variable and populating tableview with the data
- (void)didFinishFetchingData:(NSMutableArray *)results {
    
    
    self.arrayOfBooksDict = results;
    
    [self.tableView reloadData];
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.arrayOfBooksDict.count;
}

// populating the cell labels and image with the book dictionary info
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    NSDictionary *book = [self.arrayOfBooksDict objectAtIndex:indexPath.row];

    // instantiating the cells
    if (cell == nil) {
        
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    
    
    //instantiating the cells with subtitle if "author" key exists
    if ([book objectForKey:@"author"] != nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell"];
        cell.detailTextLabel.text = [book objectForKey:@"author"];
        
        
    }
    
    
    if ([book objectForKey:@"title"] != nil) {
        cell.textLabel.text = [book objectForKey:@"title"];
    }
    
    
    
    if ([book objectForKey:@"imageURL"] != nil) {
        
        NSURL *url = [NSURL URLWithString:[book objectForKey:@"imageURL"]];
        NSData *data = [NSData dataWithContentsOfURL:url];
        cell.imageView.image = [UIImage imageWithData:data];
    }
    
    
    return cell;
}

@end
