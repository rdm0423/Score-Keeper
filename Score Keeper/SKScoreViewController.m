//
//  SKScoreViewController.m
//  Score Keeper
//
//  Created by Ross McIlwaine on 2/3/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "SKScoreViewController.h"
#import "QuartzCore/QuartzCore.h"   // Added this to allow for score to be rounded as UILabel

static CGFloat margin = 15;
//static CGFloat spacing = 20;

@interface SKScoreViewController () <UITextFieldDelegate>

@property (nonatomic, strong) UIView *scrollView;
@property (nonatomic, strong) NSMutableArray *scoreLabels;

@end

@implementation SKScoreViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.scoreLabels = [[NSMutableArray alloc]init];
    
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame: CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    scrollView.contentSize = CGSizeMake(self.view.frame.size.width, self.view.frame.size.height + 10);
    [self setTitle:@"Score Keeper"];
    //[setTitle setFont:[UIFont boldSystemFontOfSize:[UIFont systemFontSize]]];
    [self.view addSubview:scrollView];

    for (int i = 0; i < 4; i++) {
        [self addScoreView:i];

    }
}



- (void)addScoreView:(int)index
{

    CGFloat width = self.view.frame.size.width;
    CGFloat frameHeight = 55;
    CGFloat height = self.view.frame.size.height / 4;
    CGFloat widthOfColumn = self.view.frame.size.width / 3 + margin;
    CGFloat yScoreRows = 75;            //self.view.frame.size.height
    CGFloat yScoreRowStepper = 85;
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, height * index, width, height)];
    [view setBackgroundColor:[UIColor whiteColor]];
    
    //UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, frameHeight * index, width, height)];
    //[view setBackgroundColor:[UIColor cyanColor]];
    
    UITextField *name = [[UITextField alloc] initWithFrame: CGRectMake(margin, yScoreRows, 75, 50)];
    name.borderStyle = UITextBorderStyleRoundedRect;
    name.tag = -1000;
    name.delegate = self;
    name.placeholder = @"name";
    name.backgroundColor = [UIColor lightGrayColor];
    
  
    
    UILabel *score = [[UILabel alloc] initWithFrame: CGRectMake(widthOfColumn, yScoreRows, 50, 50)];
    [score setBackgroundColor:[UIColor cyanColor]];
    score.textAlignment = NSTextAlignmentCenter;
    score.layer.cornerRadius = 5.0; // supposed to create round edges
    score.layer.masksToBounds = YES; // Allows the rounded edges to happen
    [self.scoreLabels addObject:score];
    [score setText:@"0"];
    
    
    UIStepper *stepper = [[UIStepper alloc] initWithFrame:CGRectMake((widthOfColumn * 2) - 25, yScoreRowStepper, 80, 80)];
    stepper.maximumValue = 1000;
    stepper.minimumValue = -1000;
    stepper.tag = index;
    [stepper addTarget:self action:@selector(stepperChanges:) forControlEvents:UIControlEventValueChanged];
    
    // QUESTION - how can the screen auto adjust up so when keyboard shows you can still see name field where you are entering text????????
    
    UILabel *borderDivide = [[UILabel alloc] initWithFrame:CGRectMake(margin, 130, self.view.frame.size.width, 5)];
    [borderDivide setBackgroundColor:[UIColor grayColor]];
    borderDivide.layer.cornerRadius = 5.0;
    borderDivide.layer.masksToBounds = YES;
    
    [self.view addSubview:view];
    [view addSubview:stepper];
    [view addSubview:score];
    [view addSubview:name];
    [view addSubview:borderDivide];

}


-(void)stepperChanges:(id)sender
{
    UIStepper *stepper = sender;
    NSInteger index = stepper.tag;
    double scoreValue = [stepper value];
    
    UILabel *valueLabel = [self.scoreLabels objectAtIndex:index];
    [valueLabel setText:[NSString stringWithFormat:@"%0.0f", scoreValue]];
    
    NSLog(@"%f", stepper.value);
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
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
