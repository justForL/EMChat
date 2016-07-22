//
//  LJListViewController.m
//  Chat
//
//  Created by James on 16/7/4.
//  Copyright © 2016年 Apple. All rights reserved.
//

#import "LJListViewController.h"
#import "EaseUI.h"

@interface LJListViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSArray *userList;

@end

@implementation LJListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupUI];
    
    
}
- (void)setupUI{
    EMError *error = nil;
    NSArray *userlist = [[EMClient sharedClient].contactManager getContactsFromServerWithError:&error];
    if (!error) {
        self.userList = userlist;
        NSLog(@"%@",userlist);
        [self.tableView reloadData];
    }
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.userList.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *ID = @"cellID";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
            }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.textLabel.text = self.userList[indexPath.row];

    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    EaseMessageViewController *chatController = [[EaseMessageViewController alloc] initWithConversationChatter:self.userList[indexPath.row] conversationType:EMConversationTypeChat];
    [self.navigationController pushViewController:chatController animated:YES];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
}
@end
