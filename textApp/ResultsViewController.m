//
//  ResultsViewController.m
//  textApp
//
//  Created by SARA on 9/20/16.
//  Copyright © 2016 provenlogic. All rights reserved.
//

#import "ResultsViewController.h"
#import "ResultsTableViewCell.h"
#import <SDWebImage/UIImageView+WebCache.h>

@interface ResultsViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (strong, nonatomic) IBOutlet UITableView *resultsTableView;

@end

@implementation ResultsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSLog(@"resulst Arr %@",self.resultsArr);
    self.resultsTableView.delegate = self;
    self.resultsTableView.dataSource = self;
    
    [self.resultsTableView registerNib:[UINib nibWithNibName:@"ResultsTableViewCell" bundle:nil] forCellReuseIdentifier:@"cellIdentifier"];

    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;{
    return self.resultsArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    ResultsTableViewCell *resultCell = [tableView dequeueReusableCellWithIdentifier:@"cellIdentifier"];
    
    if (resultCell != nil) {
        NSDictionary *item = (NSDictionary *)[self.resultsArr objectAtIndex:indexPath.row];
        
        [resultCell.imageView sd_setImageWithURL:[NSURL URLWithString:[item valueForKey:@"image"]]
                          placeholderImage:[UIImage imageNamed:@"placeholder.png"]
                                 completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
                                     if (image) {
                                         resultCell.imageView.image = image;
                                     }
                                 }];
        resultCell.textLabel.text = [item valueForKey:@"title"];
        
    }
    
    return resultCell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath;{
    return 80;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView;{
    return 1;
}
//- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath;
//{
//    
//}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
