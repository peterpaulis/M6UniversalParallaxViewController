M6UniversalParallaxViewController
=================================

<b>Easy to setup, lightweight and fully customizable component</b>

- Supports plain ScrollView or UITableView (or any other UIScrollView subclass)
- Autolayout based
- Setup in Interface builder

<a href="http://en.bloggif.com/" title="Photo Editing"><img src="http://data.bloggif.com/distant/user/store/e/e/a/3/e45e4874acb3588f31d187074d893aee.gif" alt="Mounting created Bloggif" width="250" height="448" /></a>

#Usage

####Subclass your VC
<pre>
@interface MyViewController : M6UniversalParallaxViewController
</pre>

####Connect the outlets
<pre>
@property (nonatomic, weak) IBOutlet UIView * parallaxContainerView;
@property (nonatomic, weak) IBOutlet UIScrollView * scrollView;
@property (nonatomic, weak) IBOutlet UIView * parallaxView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *parallaxContainerViewHeightLayoutConstraint;
</pre>

#Notes

<b>If you want to use UITableView with Sections, set it's class to M6HeaderInsetTableView</b>

#Credits

min:60 - Building your mobile apps - <a href="http://min60.com">http://min60.com</a>

#License

Apache License 2.0: http://www.apache.org/licenses/LICENSE-2.0.txt

