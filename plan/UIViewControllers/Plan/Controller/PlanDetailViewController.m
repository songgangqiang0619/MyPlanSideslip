//
//  PlanDetailViewController.m
//  plan
//
//  Created by Fengzy on 17/1/15.
//  Copyright © 2017年 Fengzy. All rights reserved.
//

#import "PlanEditViewController.h"
#import "PlanDetailViewController.h"

@interface PlanDetailViewController ()

@property (assign, nonatomic) NSUInteger yOffset;

@end

@implementation PlanDetailViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = STRViewTitle26;
    self.view.backgroundColor = color_F2F3F5;
    
    __weak typeof(self) weakSelf = self;
    [self customRightButtonWithImage:[UIImage imageNamed:png_Btn_Edit] action:^(UIButton *sender)
     {
         PlanEditViewController *controller = [[PlanEditViewController alloc] init];
         controller.plan = weakSelf.plan;
         [self.navigationController pushViewController:controller animated:YES];
     }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self loadCustomView];
}

- (void)loadCustomView
{
    self.yOffset = kEdgeInset;
    CGFloat iconSize = 30;
    CGFloat switchWidth = 20;
    {
        CGFloat tipsWidth = 95;
        UILabel *labelBeginTimeTips = [[UILabel alloc] initWithFrame:CGRectMake(kEdgeInset, self.yOffset, tipsWidth, iconSize)];
        labelBeginTimeTips.textColor = color_999999;
        labelBeginTimeTips.font = font_Normal_18;
        labelBeginTimeTips.text = STRViewTips21;
        [self.view addSubview:labelBeginTimeTips];
        
        UILabel *labelBeginTime = [[UILabel alloc] initWithFrame:CGRectMake(kEdgeInset + tipsWidth, self.yOffset, WIDTH_FULL_SCREEN - kEdgeInset * 2 - tipsWidth, iconSize)];
        labelBeginTime.textColor = color_999999;
        labelBeginTime.font = font_Normal_18;
        labelBeginTime.text = [CommonFunction getBeginDateStringForShow:self.plan.beginDate];
        [self.view addSubview:labelBeginTime];

        self.yOffset += iconSize + kEdgeInset;
    }
    if ([self.plan.isnotify isEqualToString:@"1"])
    {//提醒
        UIImageView *alarm = [[UIImageView alloc] initWithFrame:CGRectMake(kEdgeInset, self.yOffset, iconSize, iconSize)];
        alarm.image = [UIImage imageNamed:png_Icon_Alarm];
        [self.view addSubview:alarm];
        
        UILabel *labelTime = [[UILabel alloc] initWithFrame:CGRectMake(kEdgeInset + iconSize, self.yOffset, WIDTH_FULL_SCREEN - kEdgeInset * 3 - iconSize - switchWidth, iconSize)];
        labelTime.textColor = color_999999;
        labelTime.font = font_Normal_18;
        labelTime.text = [CommonFunction getNotifyTimeStringForShow:self.plan.notifytime];
        [self.view addSubview:labelTime];
        
        self.yOffset += iconSize + kEdgeInset;
    }
    if ([self.plan.isRepeat isEqualToString:@"1"])
    {//重复
        UIImageView *imgViewRepeat = [[UIImageView alloc] initWithFrame:CGRectMake(kEdgeInset, self.yOffset + 2, iconSize, iconSize -4)];
        imgViewRepeat.image = [UIImage imageNamed:png_Icon_EverydayNotify];
        [self.view addSubview:imgViewRepeat];
        
        UILabel *labelTips = [[UILabel alloc] initWithFrame:CGRectMake(kEdgeInset + iconSize, self.yOffset, WIDTH_FULL_SCREEN - kEdgeInset * 3 - iconSize - switchWidth, iconSize)];
        labelTips.textColor = color_999999;
        labelTips.font = font_Normal_18;
        labelTips.text = STRCommonTip50;
        [self.view addSubview:labelTips];
        
        self.yOffset += iconSize + kEdgeInset;
    }
    
    if (self.plan.remark.length)
    {
        CGFloat txtViewHeight = (HEIGHT_FULL_VIEW - kEdgeInset * 4 - self.yOffset - iconSize) / 2;
        UITextView *txtViewDetail = [[UITextView alloc] initWithFrame:CGRectMake(kEdgeInset, self.yOffset, WIDTH_FULL_SCREEN - kEdgeInset * 2, txtViewHeight)];
        txtViewDetail.backgroundColor = [UIColor whiteColor];
        txtViewDetail.layer.cornerRadius = 5;
        txtViewDetail.font = font_Normal_18;
        txtViewDetail.textColor = color_Black;
        txtViewDetail.text = self.plan.content;
        txtViewDetail.editable = NO;
        [self.view addSubview:txtViewDetail];
        
        self.yOffset += txtViewHeight + kEdgeInset;
        
        UILabel *labelTips = [[UILabel alloc] initWithFrame:CGRectMake(kEdgeInset, self.yOffset, WIDTH_FULL_SCREEN - kEdgeInset * 2, iconSize)];
        labelTips.textColor = color_999999;
        labelTips.font = font_Normal_18;
        labelTips.text = STRCommonTip51;
        [self.view addSubview:labelTips];
        
        self.yOffset += iconSize + kEdgeInset;
        
        UITextView *txtViewRemark = [[UITextView alloc] initWithFrame:CGRectMake(kEdgeInset, self.yOffset, WIDTH_FULL_SCREEN - kEdgeInset * 2, txtViewHeight)];
        txtViewRemark.backgroundColor = [UIColor whiteColor];
        txtViewRemark.layer.cornerRadius = 5;
        txtViewRemark.font = font_Normal_18;
        txtViewRemark.textColor = color_0BA32A;
        txtViewRemark.text = self.plan.remark;
        txtViewRemark.editable = NO;
        [self.view addSubview:txtViewRemark];
    }
    else
    {
        CGFloat txtViewHeight = HEIGHT_FULL_VIEW - kEdgeInset - self.yOffset;
        UITextView *txtViewDetail = [[UITextView alloc] initWithFrame:CGRectMake(kEdgeInset, self.yOffset, WIDTH_FULL_SCREEN - kEdgeInset * 2, txtViewHeight)];
        txtViewDetail.backgroundColor = [UIColor whiteColor];
        txtViewDetail.layer.cornerRadius = 5;
        txtViewDetail.font = font_Normal_18;
        txtViewDetail.textColor = color_Black;
        txtViewDetail.text = self.plan.content;
        txtViewDetail.editable = NO;
        [self.view addSubview:txtViewDetail];
    }
}

@end