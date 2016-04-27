# RRArt-Swift-Test
rare-test
本版本只是一个测试版本，作为学术交流
├── Pods：需要安装[CocoaPods](http://code4app.com/article/cocoapods-install-usage)类库管理工具
│   ├── 更新pods命令：执行pod install(Podfile.lock不会被修改), 不要执行pod update(Podfile.lock会被修改)
│   └
├── RRArt - iOS 架构说明
│   │
│   ├── UIViewController：视图、控制器，对应app中的各个模块
│   │   ├── Base            ── 所有基类
│   │   ├── RootControllers ── 基类及根视图
│   │   │   ├── MainTabBarController    ── 
│   │   │   ├── XXX                     ── (其他)
│   │   └   └
│   │   ├── XXX ── (其他)
│   │   └
│   ├── Views：Cell、CCell、Tip等自定义视图
│   │   ├── Cell        ── 自定义UITableViewCell
│   │   ├── CCell       ── 自定义UICollectionViewCell
│   │   ├── ZCTipView   ── 用于提示信息（用于整个App）
│   │   ├── XXX         ── (其他)
│   │   └
│   ├── UIModels：数据模型（所有的数据模型都在这里，Model类全部以"C"开头）
│   ├── Utils：一些常用控件，Category、Manager等
│   │   ├── Common      ──
│   │   ├── Manager     ── NetworkManager等
│   │   ├── OC_Category ── 所有扩展类都在这里
│   │   ├── OC_Runtime  ──
│   │   └
│   ├── Vendor：所有第三方类库，一般都有改动。（不需要修改的，可以用CocoaPods管理）
│   │   ├── ActionSheetPicker
│   │   ├── iCarousel
│   │   ├── JDStatusBarNotification
│   │   ├── MJPhotoBrowser
│   │   ├── NJKWebViewProgress
│   │   ├── NSDate+Helper
│   │   ├── QBImagePicker
│   │   ├── RDVTabBarController
│   │   ├── SDWebImage
│   │   ├── SVPullToRefresh
│   │   ├── SVWebViewController
│   │   ├── SWTableViewCell
│   │   ├── TTTAttributedLabel
│   │   ├── YLGIFImage
│   └   └
│── Images：所有图片均放在这里，文件夹已模块区分。图片命名规则：功能模块_icon(大图用image，小图用icon)_图片功能，如：login_icon_password@2x.png
│── Resources：plist、json等资源文件
├

.
├── <<编码规范>>
│   │
│   ├── 1、新建类时：在头文件顶部注释部分添加一行，描述类的功能（参考LoginViewController.h）
│   ├── 2、函数声明："+"或“-”号和左括号之间空格隔开
│   ├── 3、函数声明：右括号与参数用空格隔开（如：- (void)func(NSString *)title {}）
│   ├── 4、"="、“==”、if、for等语句必须以空格隔开（如：UIView *view = [[UIView alloc] init];）
│   ├──    if () {
│   │
│   │      } else {
│   │
│   │      }
│   ├── 5、每个函数中的代码要按逻辑用空行区分，不要把所有的代码都堆在一起
│   ├── 6、类中函数要按功能分类：#pragma 写两行，如：
│   │       #pragma mark -
│   │       #pragma mark - Custom M
│   ├── 7、自定义控件：一个View含有几个或多个子View、或此View具有特殊功能或效果，需要自定义View
│   ├── 8、属性声明：@property (nonatomic, strong) UIButton *loginButton; //注意空格
│   ├── 9、声明类或方法时，注意空格的使用，参数过多时可换行保持对齐，调用方法时也是如此，参数都写在一行或换行冒号对齐，
│   ├── 10、类名首字母大写，方法首字母小写，方法中的参数首字母小写，同时尽量让方法的命名读起来像一句话，能够传达出方法的意思，同时取值方法前不要加前缀“get”
│   ├──
│   ├──
├
│
├── RRArt - Pods第三方库说明
│   │
│   ├──AFNetworking:第三方http网络请求
│   ├──APParallaxHeader:可以实现多种不同表头效果，例：下拉拉伸表头
│   ├──ARChromeActivity:
│   ├──AliyunOSSiOS: 阿里oss，存储图片
│   ├──BlocksKit：bolck方法集合
│   ├──Bolts：Bolts 是一个 Parse 和 Facebook 在内部使用的底层库, 方便移动开发
│   ├──CocoaAsyncSocket：异步socoket
│   ├──FMDB：sqlit数据库
│   ├──FontAwesome+iOS：文字
│   ├──MJExtension：模型转化，各种拓展
│   ├──Masonry：自动布局
│   ├──NYXImagesKit
│   ├──PPiAwesomeButton：图文button
│   ├──ReactiveCocoa：信息流
│   ├──TPKeyboardAvoiding：键盘
│   ├──TTTAttributedLabel：
│   ├──TUSafariActivity：
│   ├──UIImage+BlurredFrame：模糊UIImage
│   ├──YTKKeyValueStore：轻量级管理数据库
│   ├──iVersion：版本升级
│   ├──UITableView+FDTemplateLayoutCell：UItableView自适应高度，配合着masonry使用
│   ├──
│   ├──
│   ├──
│   ├──