//
//  ViewController.m
//  textApp
//
//  Created by SARA on 9/20/16.
//  Copyright © 2016 provenlogic. All rights reserved.
//

#import "ViewController.h"
#import "ResultsViewController.h"
#import "HotLimeViewController.h"
#import "HttpRequestManager.h"
@interface ViewController () <NSURLSessionTaskDelegate>

@property (strong, nonatomic) IBOutlet UIButton *getBtn;
@property (strong, nonatomic) IBOutlet UIButton *hotBtn;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.getBtn.layer.cornerRadius = 10;
    self.getBtn.layer.borderWidth = 1;
    self.getBtn.layer.borderColor=[UIColor grayColor].CGColor;
    self.getBtn.clipsToBounds = YES;

    self.hotBtn.layer.cornerRadius = 10;
    self.hotBtn.layer.borderWidth = 1;
    self.hotBtn.layer.borderColor=[UIColor grayColor].CGColor;
    self.hotBtn.clipsToBounds = YES;

}
- (IBAction)fetchData:(id)sender {
    [[HttpRequestManager sharedManager] GETRequestWithUrl:@"http://api.androidhive.info/json/movies.json" withHandler:^(BOOL sucess, id response) {
        if (sucess) {
            dispatch_async(dispatch_get_main_queue(), ^{
                ResultsViewController *resultsVCStb = [self.storyboard instantiateViewControllerWithIdentifier:@"resultsController"];
                resultsVCStb.resultsArr = response;
                [self.navigationController pushViewController:resultsVCStb animated:NO];
            });
        }
    }];
}

- (IBAction)hotLimeTapped:(id)sender {
    HotLimeViewController *resultsVCStb = [self.storyboard instantiateViewControllerWithIdentifier:@"hotlineVC"];
    [self.navigationController presentViewController:resultsVCStb animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
