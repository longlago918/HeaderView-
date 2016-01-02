//
//  Pull2Plus.m
//  下拉放大
//
//  Created by 生龙 on 15/12/28.
//  Copyright © 2015年 龙. All rights reserved.
//

#import "Pull2Plus.h"
#define ObserverKeyPath @"contentOffset"
@interface Pull2Plus ()

@property (nonatomic,strong)UITableView *tableView;
@property (nonatomic,strong)UIImageView *headView;

@end

@implementation Pull2Plus


-(instancetype)initWith:(UITableView *)tableView andHeaderView:(UIImageView *)headView{
    if (self = [super init]) {
        
        self.tableView = tableView;

        self.headView = headView;
        self.headView.contentMode = UIViewContentModeScaleAspectFill;
        self.headView.frame = CGRectMake(0, -10, [UIScreen mainScreen].bounds.size.width, 150);
        headView.layer.masksToBounds = true;
        [self.tableView insertSubview:headView atIndex:0];
        
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, 150)];
        view.backgroundColor = [UIColor clearColor];
        self.tableView.tableHeaderView = view;
        
        [self.tableView addObserver:self forKeyPath:ObserverKeyPath options:NSKeyValueObservingOptionOld|NSKeyValueObservingOptionNew context:nil];
    }
    return self;
}


-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context{

    if ([keyPath isEqualToString:ObserverKeyPath]) {
        CGPoint old = [change[@"new"] CGPointValue];
        CGPoint new = [change[@"old"] CGPointValue];
        if (self.tableView.contentOffset.y > 0) {
            return;
        }
        int subOffset = old.y - new.y;
        self.headView.frame = CGRectInset(self.headView.frame, 0, subOffset);
    }

}



-(void)dealloc{

    [self.tableView removeObserver:self forKeyPath:ObserverKeyPath];
    NSLog(@"%s",__FUNCTION__);
}




@end
