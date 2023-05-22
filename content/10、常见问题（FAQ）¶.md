Title:# 10、常见问题（FAQ）[¶](https://www.osgeo.cn/pelican/faq.html#frequently-asked-questions-faq)

以下是一些关于Pelican的常见问题。

## 沟通问题、问题或建议的最佳方式是什么？[¶](https://www.osgeo.cn/pelican/faq.html#what-s-the-best-way-to-communicate-a-problem-question-or-suggestion)

请阅读我们的 [feedback guidelines](https://www.osgeo.cn/pelican/contribute.html) .



## 我能帮忙吗？[¶](https://www.osgeo.cn/pelican/faq.html#how-can-i-help)

有几种方法可以帮助你。首先，您可以通过IRC（首选）或 [issue tracker](https://github.com/getpelican/pelican/issues) . 如果提交问题报告，请首先检查现有问题列表（包括打开和关闭），以避免提交重复的问题。

如果你想捐款，请用叉子 [the git repository](https://github.com/getpelican/pelican/) ，创建新的功能分支，进行更改，并发出请求。有人会尽快检查您的更改。请参考 [How to Contribute](https://www.osgeo.cn/pelican/contribute.html) 有关详细信息，请参阅。

您还可以通过创建主题和改进文档来作出贡献。

## Pelican设置文件是必需的吗？[¶](https://www.osgeo.cn/pelican/faq.html#is-the-pelican-settings-file-mandatory)

配置文件是可选的，只是配置Pelican的一种简单方法。对于基本操作，可以在通过命令行调用Pelican时指定选项。看到了吗 `pelican --help` 更多信息。

## 对设置文件的更改无效[¶](https://www.osgeo.cn/pelican/faq.html#changes-to-the-settings-file-take-no-effect)

当尝试使用不同的设置（尤其是元数据设置）时，缓存可能会干扰，并且更改可能不可见。在这种情况下，请确保通过禁用缓存 `LOAD_CONTENT_CACHE = False` 或者使用 `--ignore-cache` 命令行开关。

## 我在创造我自己的主题。如何使用Pygments来突出显示语法？[¶](https://www.osgeo.cn/pelican/faq.html#i-m-creating-my-own-theme-how-do-i-use-pygments-for-syntax-highlighting)

Pygments向生成的内容添加一些类。主题使用这些类来设置通过CSS突出显示代码语法的样式。具体来说，您可以通过 `.highlight pre` 在主题的CSS文件中初始化。例如，要查看如何使用各种样式来呈现Django代码，请使用 [Pygments project demo site](https://pygments.org/demo/) .

可以使用以下示例命令从Pygments内置样式（在本例中为“monokai”）生成一个起始CSS文件，然后将生成的CSS文件复制到新主题中：

```
pygmentize -S monokai -f html -a .highlight > pygment.css
cp pygment.css path/to/theme/static/css/
```

别忘了把你的 `pygment.css` 从你的主CSS文件。

## 如何创建自己的主题？[¶](https://www.osgeo.cn/pelican/faq.html#how-do-i-create-my-own-theme)

请参考 [主题](https://www.osgeo.cn/pelican/themes.html#theming-pelican) .

## 我想用降价，但我有个错误。[¶](https://www.osgeo.cn/pelican/faq.html#i-want-to-use-markdown-but-i-got-an-error)

如果您尝试在不首先安装降价库的情况下生成降价内容，可能会看到一条消息 `No valid files found in content` . 对于Pelican来说，Markdown不是一个硬的依赖项，所以如果您有Markdown格式的内容，那么您需要显式地安装Markdown库。您可以通过键入以下命令来完成此操作 `sudo` 如果权限要求：

```
python -m pip install markdown
```

## 我可以在模板中使用任意元数据吗？[¶](https://www.osgeo.cn/pelican/faq.html#can-i-use-arbitrary-metadata-in-my-templates)

对。例如，要在降价公告中包含修改日期，可以在文章顶部包含以下内容：

```
Modified: 2012-08-08
```

对于reStructuredText，此元数据当然应该以冒号作为前缀：

```
:Modified: 2012-08-08
```

然后可以在诸如 `article.html` 通过：

```
{% if article.modified %}
Last modified: {{ article.modified }}
{% endif %}
```

如果您想在文章上下文之外的模板中包含元数据（例如。， `base.html` ） `if` 语句应改为：

```
{% if article and article.modified %}
```

## 如何在每页基础上分配自定义模板？[¶](https://www.osgeo.cn/pelican/faq.html#how-do-i-assign-custom-templates-on-a-per-page-basis)

这很简单，只需在想要拥有自己模板的任何页面或文章中添加一行额外的元数据。例如，以下是对reST格式的内容的处理方式：

```
:template: template_name
```

对于降价格式的内容：

```
Template: template_name
```

然后确保你的主题包含相关的模板文件（例如。 `template_name.html` ）

## 如何覆盖生成的特定页面或文章的URL？[¶](https://www.osgeo.cn/pelican/faq.html#how-can-i-override-the-generated-url-of-a-specific-page-or-article)

包括 `url` 和 `save_as` 要覆盖生成的URL的任何页面或文章中的元数据。以下是reST格式的示例页面：

```
Override url/save_as page
#########################

:url: override/url/
:save_as: override/url/index.html
```

使用此元数据，页面将被写入 `override/url/index.html` Pelican会用网址 `override/url/` 链接到此页面。

## 如何使用静态页面作为主页？[¶](https://www.osgeo.cn/pelican/faq.html#how-can-i-use-a-static-page-as-my-home-page)

可以用上面提到的一个静态页面来替代你的主页。下面的降价示例可以存储在 `content/pages/home.md` ：

```
Title: Welcome to My Site
URL:
save_as: index.html

Thank you for visiting. Welcome!
```

如果仍然需要原始博客索引，则可以通过设置将其保存在其他位置 `INDEX_SAVE_AS = 'blog_index.html'` 对于 `'index'` 直接模板。

## 如果我想禁用feed生成怎么办？[¶](https://www.osgeo.cn/pelican/faq.html#what-if-i-want-to-disable-feed-generation)

要禁用提要生成，所有提要设置都应设置为 `None` . 除了三个订阅源设置外，其他所有设置都已默认为 `None` ，因此，如果要禁用所有源生成，只需指定以下设置：

```
FEED_ALL_ATOM = None
CATEGORY_FEED_ATOM = None
TRANSLATION_FEED_ATOM = None
AUTHOR_FEED_ATOM = None
AUTHOR_FEED_RSS = None
```

单词 `None` 不能用引号括起来。请注意 `None` 和 `''` 不是一回事。

## 我收到了一条关于没有正确设置SITEURL而生成的提要的警告[¶](https://www.osgeo.cn/pelican/faq.html#i-m-getting-a-warning-about-feeds-generated-without-siteurl-being-set-properly)

RSS and Atom feeds require all URL links to be absolute <https://validator.w3.org/feed/docs/rss2.html#comments> _. 为了在Pelican中正确生成链接，您需要设置 `SITEURL` 到站点的完整路径。

显示此警告时仍会生成提要，但其中的链接可能格式不正确，因此提要可能无法验证。

## 我可以强制Atom提要只显示摘要而不显示文章内容吗？[¶](https://www.osgeo.cn/pelican/faq.html#can-i-force-atom-feeds-to-show-only-summaries-instead-of-article-content)

绝大多数使用提要阅读器的用户不需要打开单独的浏览器窗口来阅读文章，而是更喜欢在提要阅读器本身内阅读内容。主要出于这个原因，鹈鹕不支持将Atom提要限制为只包含摘要。与Atom提要不同，RSS提要规范不包括单独的 `content` 字段，因此默认情况下，鹈鹕发布只包含摘要的RSS提要(但也可以选择设置为发布完整内容的RSS提要)。因此，默认提要生成行为为用户提供了一个选择：订阅Atom提要以获取完整内容，或者订阅RSS提要以获取摘要。

## Pelican只适合写博客吗？[¶](https://www.osgeo.cn/pelican/faq.html#is-pelican-only-suitable-for-blogs)

不。Pelican可以很容易地配置为创建和维护任何类型的静态站点。这可能需要对你的主题和Pelican配置进行一些定制。例如，如果您正在为您的产品构建一个发布站点，并且站点上不需要标记，则可以从主题中删除相关的HTML代码。也可以通过以下方式禁用标记相关页的生成：

```
TAGS_SAVE_AS = ''
TAG_SAVE_AS = ''
```

## 为什么Pelican总是写入所有HTML文件，即使启用了内容缓存？[¶](https://www.osgeo.cn/pelican/faq.html#why-does-pelican-always-write-all-html-files-even-with-content-caching-enabled)

为了在编写HTML输出之前可靠地确定HTML输出是否不同，生成环境的很大一部分（包括模板上下文、导入的插件等）都必须保存和比较，至少以哈希的形式（这需要对不易损坏的类型进行特殊处理），因为所有可能的插件组合、分页等都可能以不同的方式改变。这将需要更多的处理时间、内存和存储空间。每次只需简单地编写文件就可以更快、更可靠。

但是，这意味着文件的修改时间每次都会更改，因此 `rsync` 即使内容没有改变，基于上传的内容也会转移。一个简单的解决方案是 `rsync` 使用 `--checksum` 选项，这将使它以比Pelican快得多的方式比较文件校验和。

当只有几个特定的输出文件感兴趣时(例如，当使用某些特定的页面或主题模板时)， `WRITE_SELECTED` 选项可能会有所帮助，请参见 [仅写入选定内容](https://www.osgeo.cn/pelican/settings.html#writing-only-selected-content) 。

## 如何只处理所有文章的子集？[¶](https://www.osgeo.cn/pelican/faq.html#how-to-process-only-a-subset-of-all-articles)

通常只处理10篇文章以进行调试是很有用的。这可以通过在中显式指定这些项目的文件名来实现 `ARTICLE_PATHS` . 可以使用类似于 `cd content; find -name '*.md' | head -n 10` .

## 自从我升级Pelican后，我的标签云丢失/损坏[¶](https://www.osgeo.cn/pelican/faq.html#my-tag-cloud-is-missing-broken-since-i-upgraded-pelican)

在一项正在进行的简化鹈鹕的努力中，Tag云的生成已经移出了鹈鹕的核心，并转移到了一个单独的 [plugin](https://github.com/pelican-plugins/tag-cloud) 。请参阅 [插件](https://www.osgeo.cn/pelican/plugins.html#plugins) 有关鹈鹕插件系统的详细信息，请参阅文档。

## 自从我升级了Pelican我的页面不再呈现[¶](https://www.osgeo.cn/pelican/faq.html#since-i-upgraded-pelican-my-pages-are-no-longer-rendered)

主题可以使用小写形式的页面 `pages` 和大写 `PAGES` . 使它与 [模板和变量](https://www.osgeo.cn/pelican/themes.html#templates-variables) 第节， `PAGES` 已删除。这可以通过更新主题来快速解决 `pages` 而不是 `PAGES` . 只需替换：

```
{% for pg in PAGES %}
```

比如：

```
{% for pg in pages %}
```

## 如何阻止Pelican尝试将静态文件解析为内容？[¶](https://www.osgeo.cn/pelican/faq.html#how-can-i-stop-pelican-from-trying-to-parse-my-static-files-as-content)

Pelican的文章和页面生成器在静态生成器之前运行。这意味着如果使用类似于默认配置的设置，其中静态源目录在 `*_PATHS` 设置，所有具有有效内容文件结尾的文件 (`.html` ， `.rst` ， `.md` ，…）在被视为静态文件之前将被视为文章或页面。

要避开此问题，请使用适当的 `*_EXCLUDES` 通过设置或禁用有问题的读卡器 `READERS` 如果你不需要的话。

## 为什么是 [任意降价语法] 不支持？[¶](https://www.osgeo.cn/pelican/faq.html#why-is-arbitrary-markdown-syntax-not-supported)

Pelican不直接处理降价处理，而是将该任务委托给 [Python-Markdown](https://github.com/Python-Markdown/markdown) 项目，其核心有目的地遵循原始的降价语法规则，而不是随后传播的无数降价“风格”。上面说， [Python-Markdown](https://github.com/Python-Markdown/markdown) 是相当模块化的，并且您正在寻找的语法可能由许多可用的语法之一提供 [Markdown Extensions](https://python-markdown.github.io/extensions/) . 或者，有些人已经创建了支持降价变体的Pelican插件，所以如果您想在编写内容时使用特定的变体，那么这可能是您的最佳选择。

[ Previous](https://www.osgeo.cn/pelican/importer.html)[Next ](https://www.osgeo.cn/pelican/tips.html)