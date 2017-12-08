//
//  ViewController.m
//  test
//
//  Created by mac on 17/07/05.
//  Copyright © 2017年 mac. All rights reserved.
//
#define random(r, g, b, a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)/255.0]
#define randomColor random(arc4random_uniform(256), arc4random_uniform(256), arc4random_uniform(256), arc4random_uniform(256))
#define time_duration .3f
#import "ViewController.h"
#import "CalculatorManager.h"
#import "UITableView+LF.h"
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource,UIScrollViewDelegate>
{
    
    int jilukaishi;
    int jilugeshu ;
    BOOL scrollview;
}
@property (strong, nonatomic) IBOutlet UITableView *tableview;
@property (nonatomic, assign) id (^test)(NSString *);
@property (nonatomic, strong) NSMutableArray <UITableViewCell*>*cellArray;
@property (nonatomic, strong) NSMutableArray *cellRectArr;
@property (nonatomic, strong) NSMutableArray *btnArray;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    scrollview = YES;
    self.tableview.boolProperty = YES;
    // Do any additional setup after loading the view, typically from a nib.
    _cellArray = [NSMutableArray array];
    _cellRectArr =[NSMutableArray array];
    jilukaishi = 0;
    jilugeshu = 0;
    CalculatorManager *manager = [[CalculatorManager alloc] init];
    
    manager.add(2).add(3);
    
    NSLog(@"%d", manager.result);
    
    NSData *(^requestNetwork)(NSString *) = ^NSData *(NSString *path){
        NSURL *url = [NSURL URLWithString:path];
        NSData *data = [NSData dataWithContentsOfURL:url];
        return data;
    };
    
//    NSData *data = requestNetwork(@"http://fengzhihen.com/MVP/food.json");
//    NSLog(@"%@",data);
    

   
    UILabel *(^lfLab)(UIViewController*) = ^UILabel *(UIViewController*vc){
        UILabel *lab = [[UILabel alloc]initWithFrame:CGRectMake(0, 100, 100, 100)];
        lab.text = @"123";
        [vc.view addSubview:lab];
        return lab;
    };
    UILabel *adv =lfLab(self);
    
    _btnArray=[[NSMutableArray alloc] init];
    
    [self createBtn:@[@"1",@"2",@"3",@"4",@"5"]];
    
  
}
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    scrollview = NO;
    self.tableview.boolProperty = NO;
    
}




- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{

    scrollview = YES;
    self.tableview.boolProperty = YES;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 5;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    
    CGRect cellRect = cell.frame;
    [_cellRectArr addObject:NSStringFromCGRect(cellRect)];
    //    cell.frame = CGRectMake(cellRect.origin.x, cellRect.origin.y+300, cellRect.size.width, cellRect.size.height);
    [_cellArray addObject:cell];
    cell.contentView.hidden = YES;
//    cell.alpha = 0;
//    int R = (arc4random() % 256) ;
//    int G = (arc4random() % 256) ;
//    int B = (arc4random() % 256) ;
//    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
//    [button setBackgroundColor:[UIColor colorWithRed:R/255.0 green:G/255.0 blue:B/255.0 alpha:1]];
//    [cell.contentView addSubview:button];
//    button.frame = CGRectMake(200, 0, 100, 40);
//    cell.frame = CGRectMake(0, 619, self.view.bounds.size.width, 0);
//    
//    [button setTitle:[NSString stringWithFormat:@"%ld",indexPath.row] forState:UIControlStateNormal];
//    
//    cell.frame = CGRectMake(0, 619, self.view.bounds.size.width, 44);
        NSLog(@"cellforrow");
    return cell;
    
}
//-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
//    
//    CATransform3D rotation;
//
//    rotation = CATransform3DMakeTranslation(0, 200, 0);
//
//    
//    cell.layer.shadowColor = [[UIColor blackColor]CGColor];
//    cell.layer.shadowOffset = CGSizeMake(10, 10);
//    cell.alpha = 0;
//    cell.layer.transform = rotation;
//    cell.layer.anchorPoint = CGPointMake(0, 0.5);
//    
//    
//    [UIView beginAnimations:@"rotation" context:NULL];
//    [UIView setAnimationDuration:1.8];
//    cell.layer.transform = CATransform3DIdentity;
//    cell.alpha = 1;
//    cell.layer.shadowOffset = CGSizeMake(0, 0);
//    [UIView commitAnimations];
//}
-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{

    


    cell.textLabel.text = [NSString stringWithFormat:@"%u",arc4random_uniform(256)];
    cell.textLabel.backgroundColor = [UIColor redColor];
    
    if (!self.tableview.boolProperty) {
        cell.contentView.hidden = NO;
        return;
    }
    
    
//    if (!scrollview) {
//        cell.contentView.hidden = NO;
//        return;
//    }
    
    int i =(int) indexPath.row;
//    CGPoint startPoint = CGPointMake(self.view.bounds.size.width/2, _cellArray.count*44);
//
//    CGPoint endPoint =CGPointMake(self.view.bounds.size.width/2, 22+(44*i));
    CABasicAnimation *scaleAnimation1 = [CABasicAnimation animationWithKeyPath:@"opacity"];
    scaleAnimation1.duration=time_duration;
    scaleAnimation1.fromValue = @(0);
    scaleAnimation1.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    scaleAnimation1.beginTime = CACurrentMediaTime() + (time_duration*i);

    scaleAnimation1.toValue = @(1);
    [cell.layer addAnimation:scaleAnimation1 forKey:nil];
//    CGPoint startPoint = CGPointMake(self.view.bounds.size.width/2, 619);
//    CGPoint endPoint =CGPointMake(self.view.bounds.size.width/2, 619-(44*(_btnArray.count-i)+22));
    
     CGPoint startPoint = CGPointMake(self.view.bounds.size.width/2, (44*(1+i)+22));
     CGPoint endPoint =CGPointMake(self.view.bounds.size.width/2, (44*i+22));
    
    //position animation
    CABasicAnimation *positionAnimation = [CABasicAnimation animationWithKeyPath:@"position"];
    positionAnimation.duration=time_duration;
    positionAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    positionAnimation.fromValue = [NSValue valueWithCGPoint:startPoint];
    positionAnimation.toValue = [NSValue valueWithCGPoint:endPoint];
//    positionAnimation.beginTime = CACurrentMediaTime() + (time_duration/(float)_cellArray.count * (float)i);
    positionAnimation.beginTime = CACurrentMediaTime()+time_duration*i ;
    positionAnimation.fillMode = kCAFillModeForwards;
    positionAnimation.removedOnCompletion = NO;
    
    [cell.layer addAnimation:positionAnimation forKey:@"positionAnimation"];
    
    cell.layer.position=endPoint;
    
    //scale animation
    CABasicAnimation *scaleAnimation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    scaleAnimation.duration=time_duration;
    scaleAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    scaleAnimation.fromValue = @(1);
    scaleAnimation.toValue = @(1);
//    scaleAnimation.beginTime = CACurrentMediaTime() + (time_duration/(float)_cellArray.count * (float)i);
    scaleAnimation.beginTime = CACurrentMediaTime()+i*time_duration ;
    scaleAnimation.fillMode = kCAFillModeForwards;
    scaleAnimation.removedOnCompletion = NO;
    
    [cell.layer addAnimation:scaleAnimation forKey:@"transformscale"];
    //        btn.transform = CGAffineTransformMakeScale(1.0f, 1.0f);
    NSLog(@"%@",NSStringFromCGRect(cell.frame));
    [self performSelector:@selector(showcell:) withObject:cell afterDelay:time_duration*i];
  

    
}
-(void)showcell:(UITableViewCell*)obj{
    
     obj.contentView.hidden = NO;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 44.0f;
}



-(void)showBtn{
    for (int  i = 0; i<_cellArray.count; i++) {
        UITableViewCell *btn=_cellArray[i];
        //        btn.transform=CGAffineTransformIdentity;
        
        CGPoint startPoint = CGPointMake(self.view.bounds.size.width/2, _cellArray.count*44);
        //        CGPoint startPoint = CGPointFromString([NSString stringWithFormat:@"%@",[_homeBtn.layer valueForKeyPath:@"position"]]);
        CGPoint endPoint =CGPointMake(self.view.bounds.size.width/2, 22+(44*i));
        //position animation
        CABasicAnimation *positionAnimation = [CABasicAnimation animationWithKeyPath:@"position"];
        positionAnimation.duration=1.3;
        positionAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
        positionAnimation.fromValue = [NSValue valueWithCGPoint:startPoint];
        positionAnimation.toValue = [NSValue valueWithCGPoint:endPoint];
        positionAnimation.beginTime = CACurrentMediaTime() + (1.3/(float)_cellArray.count * (float)i);
        positionAnimation.fillMode = kCAFillModeForwards;
        positionAnimation.removedOnCompletion = NO;
        
        [btn.layer addAnimation:positionAnimation forKey:@"positionAnimation"];
        
        btn.layer.position=endPoint;
        
        //scale animation
        CABasicAnimation *scaleAnimation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
        scaleAnimation.duration=1.3;
        scaleAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
        scaleAnimation.fromValue = @(1);
        scaleAnimation.toValue = @(1);
        scaleAnimation.beginTime = CACurrentMediaTime() + (1.3/(float)_cellArray.count * (float)i);
        scaleAnimation.fillMode = kCAFillModeForwards;
        scaleAnimation.removedOnCompletion = NO;
        
        [btn.layer addAnimation:scaleAnimation forKey:@"transformscale"];
//        btn.transform = CGAffineTransformMakeScale(1.0f, 1.0f);
        NSLog(@"%@",NSStringFromCGRect(btn.frame));
        
         CABasicAnimation *scaleAnimation1 = [CABasicAnimation animationWithKeyPath:@"opacity"];
        scaleAnimation1.duration=1.3;
        scaleAnimation1.fromValue = @(0);
         scaleAnimation1.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
        scaleAnimation1.beginTime = CACurrentMediaTime() + (1.3/(float)_cellArray.count * (float)i);
        scaleAnimation1.toValue = @(1);
        [btn.layer addAnimation:scaleAnimation1 forKey:nil];
        
    }
}
-(void)createBtn:(NSArray *)btnImageName{
    
    for (int i = 0 ; i < btnImageName.count; i++) {
        UIButton *btn=[UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame=CGRectMake(30, 400, 38, 38);
        btn.backgroundColor=[UIColor lightGrayColor];
        btn.layer.cornerRadius=19;
        [btn setTitle:btnImageName[i] forState:UIControlStateNormal];
        btn.tag=i+1;
        [btn addTarget:self action:@selector(clickBtn:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:btn];
        [_btnArray addObject:btn];
    }
    
}
-(void)clickBtn:(id)sender{
    [self.tableview lf_reloadData];
    
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
//    [self showBtn];
}




@end
