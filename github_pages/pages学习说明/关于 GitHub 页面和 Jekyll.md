# 关于 GitHub 页面和 Jekyll

Jekyll 是一个静态站点生成器，内置 GitHub Pages 支持。

## 关于 Jekyll 

**Jekyll 是一个静态站点生成器**，内置 GitHub Pages 支持和简化的构建过程。 Jekyll 使用 Markdown 和 HTML 文件，并根据您选择的布局创建完整静态网站。 Jekyll 支持 Markdown 和 Lick，这是一种可在网站上加载动态内容的模板语言。 有关详细信息，请参阅 [Jekyll](https://jekyllrb.com/)。

Windows 并未正式支持 Jekyll。 有关详细信息，请参阅 Jekyll 文档中的“[Windows 上的 Jekyll](http://jekyllrb.com/docs/windows/#installation)”。

我们建议将 Jekyll 用于 GitHub Pages。 如果您喜欢，可以使用其他静态站点生成器或者在本地或其他服务器上自定义构建过程。 有关详细信息，请参阅“[关于 GitHub Pages](https://docs.github.com/zh/pages/getting-started-with-github-pages/about-github-pages#static-site-generators)”。

## 在 GitHub Pages 网站中配置 Jekyll 

可以通过编辑 **_config.yml 文件来配置大多数 Jekyll 设置，例如站点的主题和插件**。 有关详细信息，请参阅 Jekyll 文档中的“[配置](https://jekyllrb.com/docs/configuration/)”。

对于 GitHub Pages 站点，有些配置设置不能更改。

```yaml
lsi: false
safe: true
source: [your repo's top level directory]
incremental: false
highlighter: rouge
gist:
  noscript: false
kramdown:
  math_engine: mathjax
  syntax_highlighter: rouge
```

默认情况下，Jekyll 不会构建以下文件或文件夹：

- 位于名为 `/node_modules` 或 `/vendor` 的文件夹中
- 以 `_`、`.` 或 `#` 开头
- 以 `~` 结尾
- 被配置文件中的 `exclude` 设置排除

如果**想要 Jekyll 处理其中任何文件，可以使用配置文件中的 `include` 设置。**

## 前页附属资料 

要为网站上的页面或帖子设置变量和元数据，例如标题和布局， 您可以将 YAML 前页添加到任意 Markdown 或 HTML 文件的顶部。 有关详细信息，请参阅 Jekyll 文档中的“[前页](https://jekyllrb.com/docs/front-matter/)”。

可以添加 `site.github` 到帖子或页面，以将任何存储库引用元数据添加到站点。 有关详细信息，请参阅 Jekyll 元数据文档中的“[使用 `site.github`](https://jekyll.github.io/github-metadata/site.github/)”。

## 主题 

您可以将 Jekyll 主题添加到 GitHub Pages 站点，以自定义站点的外观。 有关详细信息，请参阅 Jekyll 文档中的“[主题](https://jekyllrb.com/docs/themes/)”。

可以在 GitHub 上添加支持的主题到站点。 有关详细信息，请参阅 GitHub Pages 站点中的“[支持的主题](https://pages.github.com/themes/)”，以及“[使用 Jekyll 向 GitHub Pages 站点添加主题](https://docs.github.com/zh/pages/setting-up-a-github-pages-site-with-jekyll/adding-a-theme-to-your-github-pages-site-using-jekyll)”。

要使用 GitHub 上托管的任何其他开放源代码 Jekyll 主题，可以手动添加主题。有关详细信息，请参阅 [GitHub 上托管的主题](https://github.com/topics/jekyll-theme)，“[使用 Jekyll 向 GitHub Pages 站点添加主题](https://docs.github.com/zh/pages/setting-up-a-github-pages-site-with-jekyll/adding-a-theme-to-your-github-pages-site-using-jekyll)”。

您可以通过编辑主题文件来覆盖任何主题的默认值。 有关详细信息，请参阅主题文档和 Jekyll 文档中的“[替代主题的默认值](https://jekyllrb.com/docs/themes/#overriding-theme-defaults)”。

## 插件 

您可以下载或创建 Jekyll 插件，以便为您的网站扩展 Jekyll 的功能。 例如，通过 [jemoji](https://github.com/jekyll/jemoji) 插件，可在站点的任何页面上使用 GitHub 风格的表情符号，就像在 GitHub 上使用一样。 有关详细信息，请参阅 Jekyll 文档中的“[插件](https://jekyllrb.com/docs/plugins/)”。

GitHub Pages 使用默认启用且不能禁用的插件：

- [`jekyll-coffeescript`](https://github.com/jekyll/jekyll-coffeescript)
- [`jekyll-default-layout`](https://github.com/benbalter/jekyll-default-layout)
- [`jekyll-gist`](https://github.com/jekyll/jekyll-gist)
- [`jekyll-github-metadata`](https://github.com/jekyll/github-metadata)
- [`jekyll-optional-front-matter`](https://github.com/benbalter/jekyll-optional-front-matter)
- [`jekyll-paginate`](https://github.com/jekyll/jekyll-paginate)
- [`jekyll-readme-index`](https://github.com/benbalter/jekyll-readme-index)
- [`jekyll-titles-from-headings`](https://github.com/benbalter/jekyll-titles-from-headings)
- [`jekyll-relative-links`](https://github.com/benbalter/jekyll-relative-links)

可以通过将插件的 gem 添加到 _config.yml 文件中的 `plugins` 设置来启用其他插件。 有关详细信息，请参阅 Jekyll 文档中的“[配置](https://jekyllrb.com/docs/configuration/)”。

有关受支持的插件列表，请参阅 GitHub Pages 站点上的“[依赖项版本](https://pages.github.com/versions/)”。 有关特定插件的使用信息，请参阅插件的文档。

提示：可以保持更新 GitHub Pages gem，确保使用所有插件的最新版本。 有关详细信息，请参阅 GitHub Pages 站点上的“[使用 Jekyll 在本地测试 GitHub Pages 站点](https://docs.github.com/zh/pages/setting-up-a-github-pages-site-with-jekyll/testing-your-github-pages-site-locally-with-jekyll#updating-the-github-pages-gem)”和“[依赖项版本](https://pages.github.com/versions/)”。

GitHub Pages 无法使用不支持的插件构建网站。 如果想使用不支持的插件，请在本地生成网站，然后将网站的静态文件推送到 GitHub。

## 语法突出显示

为了使网站更容易读取，代码片段在 GitHub Pages 上突显，就像在 GitHub 上突显一样。 有关如何在 GitHub 上高亮显示语法的详细信息，请参阅“[创建和突显代码块](https://docs.github.com/zh/get-started/writing-on-github/working-with-advanced-formatting/creating-and-highlighting-code-blocks)”。

默认情况下，网站上的代码块将被 Jekyll 突出显示。 Jekyll 使用与 [Pygments](https://github.com/jneen/rouge) 兼容的 [Rouge](http://pygments.org/) 突显工具。 Pygments 已被弃用，在 Jekyll 4 中不受支持。 如果在 _config.yml 文件中指定 Pygments，则 Rouge 将用作后备。 Jekyll 不能使用任何其他语法突显工具，如果你在 _config.yml 文件中指定其他语法突显工具，你将收到页面生成警告。 有关详细信息，请参阅“[关于 GitHub Pages 站点的 Jekyll 构建错误](https://docs.github.com/zh/pages/setting-up-a-github-pages-site-with-jekyll/about-jekyll-build-errors-for-github-pages-sites)”。

如果想使用其他突显工具，如 `highlight.js`，则必须更新项目的 _config.yml 文件来禁用 Jekyll 的语法突出显示。

```yaml
kramdown:
  syntax_highlighter_opts:
    disable : true
```

如果主题不含用于语法突出显示的 CSS，可以生成 GitHub 的语法突出显示 CSS 并将其添加到项目的 `style.css` 文件。

```shell
$ rougify style github > style.css
```

## 本地构建网站

如果从分支进行发布，则将更改合并到站点的发布源时，会自动发布对站点的更改。 如果从自定义 GitHub Actions 工作流进行发布，则触发工作流（通常通过推送到默认分支）时会发布更改。 如果想先预览你的更改，可以在本地而不是 GitHub 上进行更改。 然后在本地测试站点。 有关详细信息，请参阅“[使用 Jekyll 在本地测试 GitHub Pages 站点](https://docs.github.com/zh/pages/setting-up-a-github-pages-site-with-jekyll/testing-your-github-pages-site-locally-with-jekyll)”。