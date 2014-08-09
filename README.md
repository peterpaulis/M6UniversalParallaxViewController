M6UniversalParallaxViewController
=================================

<b>Easy to setup, lightweight and fully customizable component</b>

Autolayout base, Setup in Interface builder

<a href="http://en.bloggif.com/" title="Photo Editing"><img src="http://data.bloggif.com/distant/user/store/e/e/a/3/e45e4874acb3588f31d187074d893aee.gif" alt="Mounting created Bloggif" width="250" height="448" /></a>

#Usage

####Subclass your VC
<pre>
@interface FancyViewController : M6UniversalParallaxViewController
</pre>

####Connect the outlets
<pre>
@property (nonatomic, weak) IBOutlet UIView * parallaxContainerView;
@property (nonatomic, weak) IBOutlet UIScrollView * scrollView;
@property (nonatomic, weak) IBOutlet UIView * parallaxView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *parallaxContainerViewHeightLayoutConstraint;
</pre>
