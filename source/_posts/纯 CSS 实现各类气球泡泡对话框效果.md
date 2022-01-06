> 本文由 [简悦 SimpRead](http://ksria.com/simpread/) 转码， 原文地址 [www.zhangxinxu.com](https://www.zhangxinxu.com/wordpress/2010/03/%E7%BA%AFcss%E5%AE%9E%E7%8E%B0%E5%90%84%E7%B1%BB%E6%B0%94%E7%90%83%E6%B3%A1%E6%B3%A1%E5%AF%B9%E8%AF%9D%E6%A1%86%E6%95%88%E6%9E%9C/)

> 本文的知识点较多，内容也较多，展现了 CSS 惊人的力量，如果使用纯粹的 CSS 实现视觉良好，体验上佳的 web 界面。

by [zhangxinxu](http://www.zhangxinxu.com/) from [http://www.zhangxinxu.com](http://www.zhangxinxu.com/)  
本文地址：[http://www.zhangxinxu.com/wordpress/?p=651](http://www.zhangxinxu.com/wordpress/?p=651)

### 一、关于纯 CSS 实现气泡对话框

首先，来张大图：  
[![](http://image.zhangxinxu.com/image/blog/201003/2010-03-12_222928.png)](http://image.zhangxinxu.com/image/blog/201003/2010-03-12_222928.png)

上边这张黄黄的，大大的，圆圆的，有个小尾巴，文字内容有些 YY 的图片，就是使用纯 CSS 实现的气泡对话框效果，一点图片都没有哦。看到这里，你是不是跟我一样，有些惊叹 CSS 的潜力呢。关于这张图片，暂时先放到一边，下面我要讲一些与主旨相关的比较重要的，同时又很实用的一些技术。

我们首先看下面这一张图片（截自人人网）：  
[![](http://image.zhangxinxu.com/image/blog/201003/2010-03-12_224559.png)](http://image.zhangxinxu.com/image/blog/201003/2010-03-12_224559.png)

可能颜色有点淡，在左上角有个 90 度的尖角，于是整个形成了一个气泡对话框。现在考考你，如果你来实现这个效果，你会怎么做？//zxx: 假设你已经思考了一会儿｡◕‿◕｡ 我想，如果您没有看本文标题，可能就想到的是做个 90 度等腰三角形小图片；就算您知道可以用 CSS 实现上面的效果，但是您知道是什么方法吗？当然，是绝对兼容的方法（从已经在美国办了隆重葬礼的 IE6 到很多人喜欢的 Firefox 和 Safari）。您有主意吗？

好，我们先来看看人人网是怎么实现的，我们用小 bug（//zxx: 指 firebug，我喜欢亲切的称之为 “小 bug”）看一看，原来也是使用的图片，600*6 像素的图片，见下图：  
[![](http://image.zhangxinxu.com/image/blog/201003/2010-03-12_230212.png)](http://image.zhangxinxu.com/image/blog/201003/2010-03-12_230212.png)

查看此图片点此链接：[http://xnimg.cn/imgpro/box/box_arrow.png](http://xnimg.cn/imgpro/box/box_arrow.png "点击查看原图")

这可是活生生的多了一次图片请求啊，而且是个独立的小图片，关键是在访问量惊人的首页上。优秀与平庸的差异在哪里呢？前者追求极致，后者追随大流。

这里的图片完全没有必要，使用 CSS 可以实现近乎一样的效果，并且方法不止一种，我目前知道的有两种方法可以实现上面人人网的气泡对话框效果。我将这两个方法自己定义为 “边框法” 与“字符法”。

本文地址： http://www.zhangxinxu.com/wordpress/?p=651

### 二、“字符法” 与 “边框法”

**1. 字符法**  
关于 “字符法”，其实在我的 “[告别图片—使用字符实现兼容性的圆角尖角效果 beta 版](http://www.zhangxinxu.com/wordpress/?p=332 "打开告别图片—使用字符实现兼容性的圆角尖角效果beta版一文 张鑫旭-鑫空间-鑫生活")” 一文中已经比较详尽的提及过。

这里再简单讲述下，世界上的语言多种多样，字符的种类也是千差万别，形状也是千奇百怪，所以，有些字符就可以当作图形来使用，以模拟一些 web 表现效果。例如，上面的人人网对话框尖角就可以使用棱形字符 (◆) 来实现，看到这个形状上面的 90 度的尖角了吗，我们可以让其溢出 div 显示，不就有了尖角效果了吗！定位可以使用 margin 负值或是 absolute 绝对定位。

在我的网站上就应用了这个方法，您可以在网站的 “[提问与交流](http://www.zhangxinxu.com/php/question.php)” 页面看到类似下图所示的内容：  
[![](http://image.zhangxinxu.com/image/blog/201003/2010-03-13_000543.png)](http://image.zhangxinxu.com/image/blog/201003/2010-03-13_000543.png)

具体使用，您可以狠狠地点击这里：[“字符法” 实现气泡对话框 demo](http://www.zhangxinxu.com/study/201003/pure-css-speech-bubbles.html)  
里面显示了 CSS 与 HTML 代码。

**2. 边框法**  
关于 “边框法”，这说起来话就长了。不急，慢慢来。  
我们首先来看下面一段样式代码：

```
.test{width:10px; height:10px; border:10px solid; border-color:#ff3300 #0000ff #339966 #00ff00;}

```

当某个 div 应用了上面这个样式后，结果会如何？见下图（截自 Firefox3.5，IE 浏览器有细节上的差异）：  
[![](http://image.zhangxinxu.com/image/blog/201003/2010-03-13_001825.png)](http://image.zhangxinxu.com/image/blog/201003/2010-03-13_001825.png)

仔细观察边框色的交界处，四个角落有 4 个 45° 的斜边，将整个边框分成了四个等腰梯形。

现在，设想一下，如果我们现在只保留一个一个上边框，其余边框均 transparent 透明（或与背景色同色），那么是不是就只显示一个上面红色的边框了，我们测试下，与上面类似的代码，只是修改下其余三个边框的颜色。

```
.test{width:10px; height:10px; border:10px solid; border-color:#ff3300 #ffffff #ffffff #ffffff;}

```

结果如下图（截自 Firefox3.5）：  
[![](http://image.zhangxinxu.com/image/blog/201003/2010-03-13_002528.png)](http://image.zhangxinxu.com/image/blog/201003/2010-03-13_002528.png)

可见显示结果正如我们预想的。现在，再次开动脑筋，试想下，如果上面样式中的宽度和高度都是 0，也就是`width:10px; height:10px;`变成了`width:0; height:0;`。对了，那么显示的将不会是个等腰梯形了，而是个等腰直角三角形。做个简单测试就知道答案了，如下的代码：

```
.test{width:0; height:0; border:10px solid; border-color:#ff3300 #ffffff #ffffff #ffffff;}

```

结果如下（依旧截图自 Firefox3.5）：  
[![](http://image.zhangxinxu.com/image/blog/201003/2010-03-13_003545.png)](http://image.zhangxinxu.com/image/blog/201003/2010-03-13_003545.png)

此时，我们惊奇的发现，使用 border 属性居然产生了一个等腰直角三角形，而这个等腰直角三角形用做气泡对话框的尖角再合适不过了。所以，上面的人人网对话框的尖角就可以用 border 实现了，只要让下边框有颜色，其他透明（或与外背景同色）就好了。

关于 “边框法” 实现的效果，您可以狠狠地点击这里：[“边框法” 实现气泡对话框 demo](http://www.zhangxinxu.com/study/201003/pure-css-speech-bubbles.html)，或参见下图。  
[![](http://image.zhangxinxu.com/image/blog/201003/2010-03-13_004216.png)](http://image.zhangxinxu.com/image/blog/201003/2010-03-13_004216.png)

还没完，我们现在再开动我们智慧的大脑，设想下，如果各个边框的宽度不一致，又会产生怎样的结果呢？我们把测试代码再修改一下，让其边框宽度不一致，如下：

```
.test{width:0; height:0; border-width:20px 10px; border-style:solid; border-color:#ff3300 #ffffff #ffffff #ffffff;}

```

得到的结果如下图：  
[![](http://image.zhangxinxu.com/image/blog/201003/2010-03-13_005156.png)](http://image.zhangxinxu.com/image/blog/201003/2010-03-13_005156.png)

可以发现，尖角被拉高了，也就是相邻边框宽度的比例会影响单个边框形状的高与低的比例，这不难理解。

现在，我们再开动一下我们的脑筋，如果我们让相邻两个边框显示颜色会怎么样呢？测试一下吧，如下代码：

```
.test{width:0; height:0; border-width:20px 10px; border-style:solid; border-color:#ff3300 #ff3300 #ffffff #ffffff;}

```

结果如下图：  
[![](http://image.zhangxinxu.com/image/blog/201003/2010-03-13_005753.png)](http://image.zhangxinxu.com/image/blog/201003/2010-03-13_005753.png)

这不就不多说什么了，大伙儿都看到，上个相邻边框尖角实现的气泡对话框效果吧。  
[![](http://image.zhangxinxu.com/image/blog/201003/2010-03-13_010328.png)](http://image.zhangxinxu.com/image/blog/201003/2010-03-13_010328.png)

本文地址： http://www.zhangxinxu.com/wordpress/?p=651

### 三、“边框法” 的高级应用

说是高级应用，准确讲应该是 “复杂应用”。就是说用两个标签（或无标签 – 使用: before 与: after 伪类）形成的两个不同的边框进行组合显示实现的一些效果。

看下面两个图，本单元就是要实现下面两种效果：  
[![](http://image.zhangxinxu.com/image/blog/201003/2010-03-13_014809.png)](http://image.zhangxinxu.com/image/blog/201003/2010-03-13_014809.png)  
[![](http://image.zhangxinxu.com/image/blog/201003/2010-03-13_020758.png)](http://image.zhangxinxu.com/image/blog/201003/2010-03-13_020758.png)

**1、效果 (1)**  
CSS 代码如下：

```
.test{width:300px; padding:30px 20px; margin-left:60px; background:#beceeb; position:relative;}
.test span{width:0; height:0; font-size:0; overflow:hidden; position:absolute;}
.test span.bot{
    border-width:20px; 
    border-style:solid; 
    border-color:#ffffff #beceeb #beceeb #ffffff; 
    left:-40px; 
    top:40px;
}
.test span.top{
    border-width:10px 20px; 
    border-style:dashed solid solid dashed; 
    border-color:transparent #ffffff #ffffff transparent; 
    left:-40px; 
    top:60px;
}
                

```

HTML 代码如下：

```
<div>
    <span></span>
    <span></span>
    CSS “边框法”实现气泡对话框效果一
</div>

```

您可以狠狠地点击这里：[效果 (1)demo](http://www.zhangxinxu.com/study/201003/css-border-popup-effect-demo1.html)

**2、效果 (2)**  
CSS 代码如下：

```
.test{width:300px; padding:30px 20px; border:5px solid #beceeb; position:relative;}
.test span{width:0; height:0; font-size:0; overflow:hidden; position:absolute;}
.test span.bot{
    border-width:20px; 
    border-style:solid dashed dashed; 
    border-color:#beceeb transparent transparent; 
    left:80px; 
    bottom:-40px;
}
.test span.top{
    border-width:20px; 
    border-style:solid dashed dashed; 
    border-color:#ffffff transparent transparent; 
    left:80px; 
    bottom:-33px;
}                

```

HTML 代码如下：

```
<div>
    <span></span>
    <span></span>
    CSS “边框法”实现气泡对话框效果二
</div>

```

您可以狠狠地点击这里：[效果 (2)demo](http://www.zhangxinxu.com/study/201003/css-border-popup-effect-demo2.html)

**3、效果原理简述**  
原理的关键字就是 “覆盖”，另外一个边框形成的尖角覆盖之前的一个，只要控制好覆盖的位置，然后就形成了实际上的不规则尖角或是尖角边框。您还可以发挥您的创造力，实现更多其它的效果。

本文地址： http://www.zhangxinxu.com/wordpress/?p=651

### 四、关于 “边框法” 的一些说明

关于 “边框法”，有一些知识必须要提一下。

**1. IE6 的奇偶 bug**  
如果定位外框高度或是宽度为奇数，则 IE6 下，绝对定位元素的低定位和右定位会有 1 像素的误差。所以，尽量保证外框的高度或宽度为偶数值。

**2. IE6 的空 div 莫名高度 bug**  
IE6 下，空 div 会有莫名的高度，也就是说 height:0; 不顶用，此时形成的尖角的实际占高于其他浏览器是有差异的。可使用 font-size:0; + overflow:hidden; 修复此问题。

**3. IE6 不支持实线边框透明 transparent 属性**  
IE6 不支持实线边框透明 transparent 属性，当某边框设置为 transparent 属性，且有宽度的话，那么透明会以默认的黑色显示的。解决方法有两个，一是将需要隐藏的颜色设置为背景色，这样与透明效果一样，此法有局限性，在复杂 “边框法” 应用下是行不通的；二是可以使用 dashed 代替 solid，可以实现 IE6 下边框 transparent 透明。为什么能够实现透明？您可以参考默尘的这篇文章 [Dotted&Dashed 终极分析及 IE6 透明边框](http://blog.silentash.com/2009/12/ie6-border-transparent/ "Permanent Link to Dotted&Dashed终极分析及IE6透明边框")，我说点题外话，其对原因的解释似乎说的通，但是，是不是如此，我是相当怀疑的，我尚未有时间验证，这个可以标记一下。

本文地址： http://www.zhangxinxu.com/wordpress/?p=651

### 五、利用 CSS3 实现气泡样式的对话框

之前我们所说的一切，是全兼容现在所有主流浏览器的。而这里的方法，只支持对 CSS3 支持良好的浏览器，例如 Firefox3.5+，chrome 以及 Safari。本文一开头的那张黄黄的大图就是使用的 CSS3 实现的圆形以及圆弧状的拐角尾巴。

效果的核心就是 CSS3 的圆角属性：[border-radius](http://www.zhangxinxu.com/css3/css3-border-radius.php)，例如开始的大尾巴图片，就是使用 border-radius 实现的三个圆组成的，大圆形成主体内容，两个小一点的圆相互遮盖，形成圆弧小尾巴，但这个不具体讲，现在，以一个相对简单点的例子做示例。

CSS 代码如下：

```
.test{
    width:300px;
    padding:80px 20px;
    margin-left:100px;
    background:#beceeb;
    -webkit-border-top-left-radius:220px 120px;
    -webkit-border-top-right-radius:220px 120px;
    -webkit-border-bottom-right-radius:220px 120px;
    -webkit-border-bottom-left-radius:220px 120px;
    -moz-border-radius:220px / 120px;
    border-radius:220px / 120px;
    position:relative;
}
.test span{width:0; height:0; font-size:0; background:#beceeb; overflow:hidden; position:absolute;}
.test span.bot{
    width:30px;
    height:30px;
    -moz-border-radius:30px;
    -webkit-border-radius:30px;
    border-radius:30px;
    left:10px;
    bottom:-20px;
}
.test span.top{
    width:15px;
    height:15px;
    -moz-border-radius:15px;
    -webkit-border-radius:15px;
    border-radius:15px;
    left:0px;
    bottom:-40px;
}

```

HTML 代码如下：

```
<div>
    <span></span>
    <span></span>
    CSS3 border-radius实现气泡对话框效果 
</div>

```

最后的效果如下图：  
[![](http://image.zhangxinxu.com/image/blog/201003/2010-03-13_030217.png)](http://image.zhangxinxu.com/image/blog/201003/2010-03-13_030217.png)

您可以狠狠地点击这里：[效果 (3)demo](http://www.zhangxinxu.com/study/201003/css-border-popup-effect-demo3.html)

### 六、结语

还是那句话，资历有限，错误难免，欢迎大力指正。

（本篇完）![](https://image.zhangxinxu.com/image/emtion/emoji/1f44d.svg) 是不是学到了很多？可以分享到微信！  
![](https://image.zhangxinxu.com/image/emtion/emoji/1f44a.svg) 有话要说？点击[这里](#comment "点击定位到评论")。