//
//  ListViewController.m
//  BookApp
//
//  Created by 堀﨑 寛之 on 2016/05/11.
//  Copyright © 2016年 堀﨑 寛之. All rights reserved.
//

#import "ListViewController.h"
#import "Book.h"

static NSString * const LISTVIEWCELLID = @"ListViewCell";

@interface ListViewController ()
@property (strong, nonatomic) IBOutlet UITableView *myTableView;
@property (strong, nonatomic) NSArray *books;

@end

@implementation ListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    [self tryAPIConnection];
    
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    
    [self.myTableView registerNib:[UINib nibWithNibName:LISTVIEWCELLID bundle:nil] forCellReuseIdentifier:LISTVIEWCELLID];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSArray *)tryAPIConnection//:(NSString *)searchWord
{
    //todo 検索条件
    NSString *baseUrl = @"https://www.googleapis.com/books/v1/volumes?q=";
    NSString *searchWord = self.searchWord;
    NSString *url = [NSString stringWithFormat:@"%@%@+intitle",baseUrl,searchWord];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:url]];
    NSData *json = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    NSArray *array = [NSJSONSerialization JSONObjectWithData:json options:NSJSONReadingAllowFragments error:nil];
    NSArray *items = [[array valueForKeyPath:@"items"] valueForKey:@"volumeInfo"];
    NSMutableArray *mutableBooks = [NSMutableArray array];
//    NSArray *books;
    for (id item in items){
        Book *book = [[Book alloc] init];
        [book castJsonToBookClass:item];
        [mutableBooks addObject: book];
        self.books = [mutableBooks mutableCopy];
    }
    NSLog(@"%@", ((Book *)self.books[0]).title);
    return self.books;
}


#pragma mark - Table view data source



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
 UITableViewCell *cell = [self.myTableView dequeueReusableCellWithIdentifier:LISTVIEWCELLID];
 
 cell.textLabel.text = [NSString stringWithFormat:@"%ld : %@", (long)indexPath.row, ((Book *)self.books[indexPath.row]).title];
 return cell;

}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
