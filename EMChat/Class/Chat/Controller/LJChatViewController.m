//
//  LJChatViewController.m
//  Chat
//
//  Created by James on 16/7/4.
//  Copyright © 2016年 Apple. All rights reserved.
//

#import "LJChatViewController.h"
#import "EaseUI.h"
@interface LJChatViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSArray *chatListArray;

@end

@implementation LJChatViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupUI];
}
- (void)setupUI{
    
}
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    if ( [[EMClient sharedClient].chatManager getAllConversations].count > 0) {
        self.chatListArray =  [[EMClient sharedClient].chatManager getAllConversations];
    }else {
        self.chatListArray = [[EMClient sharedClient].chatManager loadAllConversationsFromDB];
    }
    self.hidesBottomBarWhenPushed = NO;
    [self.tableView reloadData];
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.chatListArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    EMConversation * conversation = self.chatListArray[indexPath.row];
    
    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"id"];
    cell.textLabel.text = conversation.conversationId;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    EaseMessageViewController *chatController = [[EaseMessageViewController alloc] initWithConversationChatter:[self.chatListArray[indexPath.row] conversationId] conversationType:EMConversationTypeChat];
    [self.navigationController pushViewController:chatController animated:YES];
}
- (NSArray *)chatListArray {
    if (_chatListArray == nil) {
        _chatListArray = [NSArray array];
    }
    return _chatListArray;
}
@end
