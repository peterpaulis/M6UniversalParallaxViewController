M6UniversalParallaxViewController v.2.0
=================================

<b>Easy to setup, lightweight and fully customizable component</b>

- Supports UITableView
- Autolayout based
- Setup in Interface builder

#New in version 2.0

- Fixed behaviour of section headers (no subclassing is now required !!!) 
- Added the possiblity to scroll the table over the parallax view
- min height parallax height added
- UIScrollView is not longer supported in favour of UITableView (this was needed to get the section scrolling behaviour right) - if you need a scroll view, consider inserting it as UITableViewCell

- Added

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

<b>If you want to scroll the table by scrolling the parallax view, subclass the lowest view inside parallax view as M6TouchForwardView and set its forwardView outlet to the table view (this way, by scrolling the parallax view, you are also scrolling the table)</b>

#Credits

min:60 - Building your mobile apps - <a href="http://min60.com">http://min60.com</a>

#License

Apache License 2.0: http://www.apache.org/licenses/LICENSE-2.0.txt

