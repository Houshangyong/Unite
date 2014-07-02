////
////  Header.h
////  HSYApplicationFramework
////
////  Created by 123 on 14-5-26.
////  Copyright (c) 2014年 侯尚勇. All rights reserved.
////
//
//#ifndef HSYApplicationFramework_Header_h
//#define HSYApplicationFramework_Header_h
//@interface LocationViewController : UIViewController<UITableViewDataSource, UITableViewDelegate>
//{
//    IBOutlet UIImageView *speakerImage;
//    
//}
//@property(nonatomic,strong)UITableView *tableView;
//
//@property (nonatomic, strong) NSMutableDictionary *cities;
//@property (nonatomic, strong) NSMutableArray *locationCity;
//
//@property (nonatomic, strong) NSMutableArray *keys; //城市首字母
//@property (nonatomic, strong) NSMutableArray *arrayCitys;   //城市数据
//@property (nonatomic, strong) NSMutableArray *arrayHotCity;
//@property (nonatomic, strong) UITableView *testTableView;
//@end
//
//
//#endif
////
////  LocationViewController.m
////  YiRenYiChe
////
////  Created by 123 on 14-3-4.
////  Copyright (c) 2014年 123. All rights reserved.
////
//
//#import "LocationViewController.h"
//
//@interface LocationViewController ()
//{
//    AppDelegate *app;
//    
//}
//
//@end
//
//@implementation LocationViewController
//
//- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
//{
//    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
//    if (self) {
//        // Custom initialization
//        self.title = @"定位";
//        self.arrayHotCity = [NSMutableArray arrayWithObjects:@"广州市",@"北京市",@"天津市",@"西安市",@"重庆市",@"沈阳市",@"青岛市",@"济南市",@"深圳市",@"长沙市",@"无锡市", nil];
//        self.keys = [NSMutableArray array];
//        self.arrayCitys = [NSMutableArray array];
//        self.locationCity = [NSMutableArray array];
//        BDHBarbuttonItem *left =
//        [BDHBarbuttonItem barItemWithImage:[UIImage imageNamed:@"back_1"]
//                             selectedImage:[UIImage imageNamed:@"back_1"]
//                                    target:self
//                                    action:@selector(back)
//                                  Position:0];
//        self.navigationItem.leftBarButtonItem = left;
//        
//        UILabel *customLab = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 30)];
//        [customLab setTextColor:[UIColor whiteColor]];
//        [customLab setText:@"定 位"];
//        customLab.backgroundColor = [UIColor clearColor];
//        customLab.textAlignment = NSTextAlignmentCenter;
//        
//        customLab.font = [UIFont boldSystemFontOfSize:20];
//        self.navigationItem.titleView = customLab;
//        
//        
//    }
//    return self;
//}
//- (void)back
//{
//    Back;
//}
//#pragma mark - tableView
//-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
//{
//    return 20.0;
//}
//
//-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
//{
//    UIView *bgView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 20)];
//    bgView.backgroundColor = [UIColor clearColor];
//    
//    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 320, 20)];
//    //[UIColor colorWithWhite:0.825 alpha:1.000]
//    titleLabel.backgroundColor = RGBCOLOR(r, g, b);
//    titleLabel.textColor = [UIColor whiteColor];
//    titleLabel.font = [UIFont systemFontOfSize:12];
//    
//    NSString *key = [_keys objectAtIndex:section];
//    if ([key rangeOfString:@"热"].location != NSNotFound) {
//        titleLabel.text = @"热门城市";
//    }
//    else if ([key rangeOfString:@"当"].location != NSNotFound)
//    {
//        titleLabel.text = @"当前城市";
//    }
//    else
//        titleLabel.text = key;
//    
//    [bgView addSubview:titleLabel];
//    
//    return bgView;
//}
//
//- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView
//{
//    return _keys;
//}
//
//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
//{
//    // Return the number of sections.
//    return [_keys count];
//}
//
//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
//{
//    // Return the number of rows in the section.
//    NSString *key = [_keys objectAtIndex:section];
//    NSArray *citySection = [_cities objectForKey:key];
//    return [citySection count];
//}
//
//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    static NSString *CellIdentifier = @"Cell";
//    
//    NSString *key = [_keys objectAtIndex:indexPath.section];
//    
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
//    if (cell == nil) {
//        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] ;
//        cell.backgroundColor = [UIColor clearColor];
//        cell.contentView.backgroundColor = [UIColor clearColor];
//        
//        cell.textLabel.font = [UIFont systemFontOfSize:18];
//    }
//    cell.textLabel.text = [[_cities objectForKey:key] objectAtIndex:indexPath.row];
//    
//    if ([key isEqualToString:@"当"]) {
//        cell.textLabel.textColor = [UIColor redColor];
//        
//    }else{
//        [cell.textLabel setTextColor:[UIColor colorWithWhite:0.213 alpha:1.000]];
//        
//    }
//    
//    return cell;
//}
//-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    [tableView deselectRowAtIndexPath:indexPath animated:YES];
//    NSString *key = [_keys objectAtIndex:indexPath.section];
//    
//    app.indexCity = [[_cities objectForKey:key] objectAtIndex:indexPath.row];
//    Back;
//}
//
////////////////////////////////////////////////////////////////////////////
//#pragma mark - View Stuff
//
//- (void)viewDidLoad
//{
//    [super viewDidLoad];
//	// Do any additional setup after loading the view.
//    //适配ios7
//    if( (UIDeviceSystemVersion>=7.0))
//    {
//        self.edgesForExtendedLayout=UIRectEdgeNone;
//        self.navigationController.navigationBar.translucent = NO;
//        self.navigationController.navigationBar.barTintColor = RGBCOLOR(r,g,b);
//        
//    }
//    self.navigationController.navigationBar.tintColor = RGBCOLOR(r,g,b);
//    
//    //
//    [speakerImage setImageToBlur:[UIImage imageNamed:@"bg"]
//                      blurRadius:kLBBlurredImageDefaultBlurRadius
//                 completionBlock:^(NSError *error){
//                     NSLog(@"The blurred image has been setted");
//                 }];
//    AppDelegate *_app = (AppDelegate *)[UIApplication sharedApplication].delegate;
//    if ([_app.city isEqualToString:nil]) {
//        [_locationCity addObject: @"正在获取"];
//    }
//    else{
//        [_locationCity addObject: _app.city];
//        
//    }
//    [self getCityData];
//    
//    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
//    _tableView.autoresizingMask = (UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight);
//    _tableView.backgroundColor = [UIColor whiteColor];
//    _tableView.delegate = self;
//    _tableView.dataSource = self;
//    [self.view addSubview:_tableView];
//    //索引背景透明
//    if ([_tableView respondsToSelector:@selector(setSectionIndexColor:)]) {
//        _tableView.sectionIndexBackgroundColor = [UIColor clearColor];
//        _tableView.sectionIndexTrackingBackgroundColor = [UIColor clearColor];
//    }
//    app = (AppDelegate *)[UIApplication sharedApplication].delegate;
//}
//#pragma mark - 获取城市数据
//-(void)getCityData
//{
//    NSString *path=[[NSBundle mainBundle] pathForResource:@"citydict"
//                                                   ofType:@"plist"];
//    self.cities = [NSMutableDictionary dictionaryWithContentsOfFile:path];
//    
//    [self.keys addObjectsFromArray:[[self.cities allKeys] sortedArrayUsingSelector:@selector(compare:)]];
//    //添加当前城市
//    NSString *strDan = @"当";
//    [self.keys insertObject:strDan atIndex:0];
//    [self.cities setObject:_locationCity forKey:strDan];
//    //添加热门城市
//    NSString *strHot = @"热";
//    [self.keys insertObject:strHot atIndex:1];
//    [self.cities setObject:_arrayHotCity forKey:strHot];
//    
//}
//
//-(void)viewDidAppear:(BOOL)animated
//{
//    [super viewDidAppear:animated];
//    
//}
//
//
//- (void)didReceiveMemoryWarning
//{
//    [super didReceiveMemoryWarning];
//    // Dispose of any resources that can be recreated.
//}
//
//@end
