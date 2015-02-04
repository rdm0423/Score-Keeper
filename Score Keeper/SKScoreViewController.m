//
//  SKScoreViewController.m
//  Score Keeper
//
//  Created by Ross McIlwaine on 2/3/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "SKScoreViewController.h"

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
    [self.view addSubview:scrollView];

    for (int i = 0; i < 4; i++) {
        [self addScoreView:i];
        
    }
}



- (void)addScoreView:(int)index
{

    CGFloat width = self.view.frame.size.width;
    CGFloat height = self.view.frame.size.height/4;
    CGFloat widthOfColumn = self.view.frame.size.width / 3 + margin;
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, height * index, width, height)];
    [view setBackgroundColor:[UIColor blueColor]];
    
    UITextField *name = [[UITextField alloc] initWithFrame: CGRectMake(margin, 64, 50, 50)];
    name.tag = -1000;
    name.delegate = self;
    name.placeholder = @"name";
    name.backgroundColor = [UIColor lightGrayColor];
  
    
    UILabel *score = [[UILabel alloc] initWithFrame: CGRectMake(widthOfColumn, 64, 50, 50)];
    [score setBackgroundColor:[UIColor greenColor]];
    score.textAlignment = NSTextAlignmentCenter;
    [self.scoreLabels addObject:score];
    [score setText:@"0"];
    
    
    UIStepper *stepper = [[UIStepper alloc] initWithFrame:CGRectMake((widthOfColumn * 2) - 25, 70, 80, 80)];
    stepper.maximumValue = 1000;
    stepper.minimumValue = -1000;
    stepper.tag = index;
    
    [stepper addTarget:self action:@selector(stepperChanges:) forControlEvents:UIControlEventValueChanged];
    
    
    [self.view addSubview:view];
    [view addSubview:stepper];
    [view addSubview:score];
    [view addSubview:name];

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
