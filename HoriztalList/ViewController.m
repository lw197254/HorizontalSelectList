//
//  ViewController.m
//  HoriztalList
//
//  Created by 刘伟 on 2017/8/3.
//  Copyright © 2017年 万圣伟业. All rights reserved.
//

#import "ViewController.h"
#import "CustomButton.h"
#import "HorizontalSelectionList.h"
#import "TableViewCell.h"
#import "CustomCell.h"
@interface ViewController ()<HorizontalSelectionListDelegate,HorizontalSelectionListDataSource,UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet CustomButton *otherButton;
@property (weak, nonatomic) IBOutlet UIButton *oneBUtton;
@property (strong, nonatomic)HorizontalSelectionList*list;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic)NSMutableArray*data;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.list = [[HorizontalSelectionList alloc]init];
    [self.view addSubview:self.list];
    [self.list mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
      
          make.height.mas_equalTo(44);
          make.top.equalTo(self.view).with.offset(64);
    }];
    self.list.delegate = self;
    self.list.dataSource = self;
    self.list.sectionInset = UIEdgeInsetsMake(5, 10, 5, 10);
    self.list.seperateSpace = 50;
    [self.list setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
     [self.list setTitleColor:[UIColor blueColor] forState:UIControlStateHighlighted];
     [self.list setTitleColor:[UIColor blackColor] forState:UIControlStateSelected];
    self.data = [NSMutableArray array];
    NSString*str = @"ab";
    
    for (NSInteger i = 0; i < 10; i++) {
        
        NSString*aaa = [NSString stringWithFormat:@"%@我是第%ld个",str,i];
        [self.data addObject:aaa];
    }
    
    
    [self.list reloadData];
    self.tableView.estimatedRowHeight = 50;
    [self.tableView registerClass:[TableViewCell class] forCellReuseIdentifier:@"TableViewCell"];
    
//    [self.oneBUtton addTarget:self action:@selector(allControl:) forControlEvents:UIControlEventAllEvents];
    [self.oneBUtton addTarget:self action:@selector(TouchDown:) forControlEvents:UIControlEventTouchDown];
//    [self.oneBUtton addTarget:self action:@selector(touchUp:) forControlEvents:UIControlEventTouchUpInside|UIControlEventTouchUpOutside ];
    
//     [self.oneBUtton addTarget:self action:@selector(touchUp:) forControlEvents: ];
    
    // Do any additional setup after loading the view, typically from a nib.
}


//-(NSArray*)sort:(NSArray*)array leftIndex:(NSInteger)leftIndex rightIndex:(NSInteger)rightIndex{
//    if (leftIndex >= rightIndex) {
//        return array;
//    }
//    NSInteger mindle = rightIndex+leftIndex/2+1;
//    
//    
//    for (NSInteger i = leftIndex; i < ; ) {
//        <#statements#>
//    }
//    NSArray*leftArray =
//}
-(NSInteger)numberOfItemsInSelectionList:(HorizontalSelectionList *)selectionList{
    return self.data.count;
}
-(NSString*)selectionList:(HorizontalSelectionList *)selectionList titleForItemWithIndex:(NSInteger)index{
    
    return self.data[index];
}
-(void)selectionList:(HorizontalSelectionList *)selectionList didSelectButtonWithIndex:(NSInteger)index{
//    [self.data removeObjectAtIndex:index];
    [self.list reloadData];
}
//-(__kindof UICollectionViewCell*)selectionList:(HorizontalSelectionList *)selectionList viewForItemWithIndex:(NSInteger)index{
//    CustomCell*cell = [selectionList dequeueReusableCellWithClass:[CustomCell class] forIndex:index isXIB:YES];
//    return cell;
//}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    TableViewCell*cell = [tableView dequeueReusableCellWithIdentifier:@"TableViewCell" forIndexPath:indexPath];
    NSString*title =@"";
    for (NSInteger i = 0; i < indexPath.row; i++) {
        title = [title stringByAppendingString:@"你好呀，我真的不知道怎么回事的呢"];
    }
    cell.Label.text = title;
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
//    for (NSInteger i = 0; i < 10; i++) {
//        NSString* str = self.data[i];
//        NSString*aaa = [NSString stringWithFormat:@"%@%@我是第%ld个",str,str,i];
//        [self.data replaceObjectAtIndex:i withObject:aaa];
//    }
//    [self.list reloadData];
    
    [self.data insertObject:@"wode" atIndex:0];
    
      
//    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"注意" message:@"我的呈现方式变了" preferredStyle:UIAlertControllerStyleAlert];
//    
//    // 2.创建取消按钮并添加到提示框上
//    [alert addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
//        
//        NSLog(@"取消按钮被点击了");
//    }]];
//    [alert addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
//       textField.placeholder = @"aaaa";
//    }];
//    // 3.呈现提示框
//    [self presentViewController:alert animated:YES completion:nil];
}
- (IBAction)TouchDown:(id)sender {
//    self.otherButton.highlighted = YES;
    self.otherButton.highlighted = YES;
    [self.list setSelectedItemIndex:8 animated:YES];
    
}

- (IBAction)touchUp:(id)sender {
    self.otherButton.highlighted = NO;
   // self.otherButton.highlighted = NO;
}
- (IBAction)touchUpOutside:(UIButton *)sender {
     //self.otherButton.highlighted = NO;
}
- (IBAction)DidEndOnExit:(id)sender {
}
-(void)allControl:(UIButton*)button{
//    self.otherButton.highlighted = button.highlighted;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
