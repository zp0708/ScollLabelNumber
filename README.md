# ScollLabelNumber
###### 导入文件
<pre><code>
  SliderLabelContainer.h
  SliderLabelContainer.m
  StarView.h
  StarView.m
</code></pre>

###### 使用方法

<pre><code>
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.startView = [[StarView alloc]initWithFrame:CGRectMake(0, 0, 150, 150)];
    self.startView.center = CGPointMake(self.view.center.x, self.view.center.y);
    [self.startView.imgView setImage:[UIImage imageNamed:@"1122"]];

    [self.view addSubview:_startView];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSInteger num = arc4random_uniform(99);
    [self.startView startLoadNumber:num];
}
</code></pre>

![](https://github.com/NewUnsigned/ScollLabelNumber/ScollLabelNumber/2015-07-17 16_55_21.gif)
