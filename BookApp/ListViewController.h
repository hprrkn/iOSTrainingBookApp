//
//  ListViewController.h
//  BookApp
//
//  Created by 堀﨑 寛之 on 2016/05/11.
//  Copyright © 2016年 堀﨑 寛之. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ListViewController : UITableViewController<UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) NSString *searchWord;
@end
