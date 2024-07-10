//
//  ViewController.m
//  UITableViewDemo
//
//  Created by Theo on 2024/7/8.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    NSArray *_dataArray;
    UITableView *tbview;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //初始化数据源数组
    _dataArray = @[@"第1条数据",@"第2条数据",@"第3条数据"];
    //创建一个tableview
    /*
     UITableViewStylePlain,//默认平铺风格
     UITableViewStyleGrouped //分组的风格
     */
    tbview = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height-30) style:UITableViewStyleGrouped];
    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(0,self.view.frame.size.height-30, self.view.frame.size.width, 30)];
    [btn setTitle:@"edit" forState:(UIControlStateNormal)];
    [btn addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
    [btn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [self.view addSubview:btn];
    //设置代理和数据源
    tbview.delegate= self;
    tbview.dataSource = self;
    //设置分割线的位置,不只是分割线，内容部分也会移动
    //tbview.separatorInset = UIEdgeInsetsMake(0, 70, 0, 0);
    //tbview
    [self.view addSubview:tbview];
    
}
-(void)click:(UIButton *)btn
{
//    if(tbview.isEditing){
//        tbview.editing = NO;
//        [btn setTitle:@"edit" forState:(UIControlStateNormal)];
//    }else{
//        tbview.editing = YES;
//        [btn setTitle:@"OK" forState:(UIControlStateNormal)];
//    }
    [tbview beginUpdates];
    [tbview moveRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:1] toIndexPath:[NSIndexPath indexPathForRow:1 inSection:1]];
    [tbview endUpdates];
}
//设置tbview的编辑风格
-(UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.section == 0){
        return UITableViewCellEditingStyleInsert;
    }else{
        return UITableViewCellEditingStyleDelete;
    }
}
//点击功能按钮所触发的方法
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"处理数据ing");
}
//设置分区数
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 10;
}
//设置每个分区的行数
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
        switch (section) {
            case 0:
                return 1;
                break;
            case 1:
                return 2;
                break;
            default:
                return 10;
    }
}
//设置每行的高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    //获取分区
    if(indexPath.section == 0){
        return 60.0;
    }else {
        //获取行
        if(indexPath.row == 0){
            return 60.0;
        }else{
            return 60.0;
        }
    }
    return 44.0;
}
//设置tableview的头视图
//- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
//{
//    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 320, 60)];
//    view.backgroundColor = [UIColor blueColor];
//    return view;
//}
////设置tableview的头视图高度
//- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
//{
//    return 60;
//}
//对tableview中的行进行设置
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *tbviewcell = [tableView dequeueReusableCellWithIdentifier:@"cellId"];
    if(tbviewcell == nil){
        tbviewcell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cellId"];
    }
    UIImageView *img = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 10, 10)];
    img.backgroundColor = [UIColor redColor];
    [tbviewcell.contentView addSubview:img];
    tbviewcell.textLabel.text = [NSString stringWithFormat:@"%d",indexPath.row];
    return tbviewcell;
}

//索引栏相关方法
//设置索引栏标题
- (NSArray<NSString *> *)sectionIndexTitlesForTableView:(UITableView *)tableView
{
    return @[@"A",@"B",@"C",@"D",@"E",@"F",@"G",@"H",@"I",@"J"];
}
//设置tableview分区标题
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return [NSString stringWithFormat:@"%c",section+'A'];
}
//设置tableview索引关联分区
- (NSInteger)tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index{
    return (tableView.numberOfSections-1)-index;
}
@end
