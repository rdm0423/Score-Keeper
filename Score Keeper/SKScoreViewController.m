//
//  SKScoreViewController.m
//  Score Keeper
//
//  Created by Ross McIlwaine on 2/3/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "SKScoreViewController.h"

static CGFloat margin = 50;

@interface SKScoreViewController ()

@property (nonatomic, strong) UIView *scrollView;

@end

@implementation SKScoreViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame: CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    scrollView.contentSize = CGSizeMake(self.view.frame.size.width, self.view.frame.size.height + 10);
    UILabel *scoreKepper = [[UILabel alloc] initWithFrame:self.view.frame];
    scoreKepper.text = @"Score Keeper";
    [self.view addSubview:scrollView];
    [self.view addSubview:scoreKepper];
    
    [self addScoreView];
}

- (instancetype)scrollView
{
    [self addScoreView];
    return 0;
}

- (void)addScoreView
{

    CGFloat width = self.view.frame.size.width;
    CGFloat height = self.view.frame.size.height / 4;
    CGFloat widthOfColumn = self.view.frame.size.width / 3 - margin;
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 64, width, height)];
    
    UITextField *name = [[UITextField alloc] initWithFrame: CGRectMake(widthOfColumn, 64, 50, 50)];
    name.text = @"name";
    [view addSubview:name];
    
    UILabel *score = [[UILabel alloc] initWithFrame: CGRectMake(widthOfColumn + widthOfColumn , 64, 50, 50)];
    score.text = @"Score";
    [view addSubview:score];
    
    UIStepper *button = [[UIStepper alloc] initWithFrame: CGRectMake(widthOfColumn * 3, 64, 50, 50)];
    button.maximumValue = 1000;
    button.minimumValue = -1000;
    [view addSubview:button];
    
    [self.view addSubview:view];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
