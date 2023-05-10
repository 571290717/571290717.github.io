# Vuepress 深入

# Front Matter

任何包含 YAML front matter 的 Markdown 文件都将由 [gray-matter (opens new window)](https://github.com/jonschlinkert/gray-matter)处理。front matter 必须是 markdown 文件中的第一部分，并且必须采用在三点划线之间书写的有效的 YAML。 这是一个基本的例子：

```markdown
---
title: Blogging with VuePress
lang: zh-CN
---

# {{ $frontmatter.title }}

My blog post is written in {{ $frontmatter.lang }}.
```

在这些三条虚线之间，你可以设置预定义变量（参见[下面](https://vuepress.vuejs.org/zh/guide/frontmatter.html#预定义变量)），甚至可以创建自己的自定义变量。 然后，您可以使用 `$frontmatter` 在页面的其余部分、以及所有的自定义和主题组件访问这些变量。

提示

在 VuePress 中，Front matter 是 **可选的**。

## [#](https://vuepress.vuejs.org/zh/guide/frontmatter.html#其他格式的-front-matter)其他格式的 Front Matter

除了 YAML 之外，VuePress 也支持 JSON 或者 [TOML (opens new window)](https://github.com/toml-lang/toml)格式的 front matter。

JSON front matter 需要以花括号开头和结尾：

```text
---
{
  "title": "Blogging Like a Hacker",
  "lang": "en-US"
}
---
```

TOML front matter 需要显式地标注为 TOML：

```text
---toml
title = "Blogging Like a Hacker"
lang = "en-US"
---
```

## [#](https://vuepress.vuejs.org/zh/guide/frontmatter.html#预定义变量)预定义变量

### [#](https://vuepress.vuejs.org/zh/guide/frontmatter.html#title)title

- 类型: `string`
- 默认值: `h1_title || siteConfig.title`

当前页面的标题。

### [#](https://vuepress.vuejs.org/zh/guide/frontmatter.html#lang)lang

- 类型: `string`
- 默认值: `en-US`

当前页面的语言。

### [#](https://vuepress.vuejs.org/zh/guide/frontmatter.html#description)description

- 类型: `string`
- 默认值: `siteConfig.description`

当前页面的描述。

### [#](https://vuepress.vuejs.org/zh/guide/frontmatter.html#layout)layout

- 类型: `string`
- 默认值: `Layout`

设置当前页面的布局组件。

### [#](https://vuepress.vuejs.org/zh/guide/frontmatter.html#permalink)permalink

- 类型: `string`
- 默认值: `siteConfig.permalink`

参考: [Permalinks](https://vuepress.vuejs.org/zh/guide/permalinks.html).

### [#](https://vuepress.vuejs.org/zh/guide/frontmatter.html#metatitle)metaTitle

- 类型: `string`
- 默认值: ``${page.title} | ${siteConfig.title}``

重写默认的 meta title。

### [#](https://vuepress.vuejs.org/zh/guide/frontmatter.html#meta)meta

- 类型: `array`
- 默认值: `undefined`

指定额外的要注入的 meta 标签：

```yaml
---
meta:
  - name: description
    content: hello
  - name: keywords
    content: super duper SEO
---
```

## [#](https://vuepress.vuejs.org/zh/guide/frontmatter.html#默认主题的预定义变量)默认主题的预定义变量

### [#](https://vuepress.vuejs.org/zh/guide/frontmatter.html#navbar)navbar

- 类型: `boolean`
- 默认值: `undefined`

参考: [默认主题配置 > 禁用导航栏](https://vuepress.vuejs.org/zh/theme/default-theme-config.html#禁用导航栏)。

### [#](https://vuepress.vuejs.org/zh/guide/frontmatter.html#sidebar)sidebar

- 类型: `boolean|'auto'`
- 默认值: `undefined`

参考: [默认主题配置 > 侧边栏](https://vuepress.vuejs.org/zh/theme/default-theme-config.html#侧边栏)。

### [#](https://vuepress.vuejs.org/zh/guide/frontmatter.html#prev)prev

- 类型: `boolean|string`
- 默认值: `undefined`

参考: [默认主题配置 > 上 / 下一篇链接](https://vuepress.vuejs.org/zh/theme/default-theme-config.html#上-下一篇链接)。

### [#](https://vuepress.vuejs.org/zh/guide/frontmatter.html#next)next

- 类型: `boolean|string`
- 默认值: `undefined`

参考: [默认主题配置 > 上 / 下一篇链接](https://vuepress.vuejs.org/zh/theme/default-theme-config.html#上-下一篇链接)。

### [#](https://vuepress.vuejs.org/zh/guide/frontmatter.html#search)search

- 类型: `boolean`
- 默认值: `undefined`

参考: [默认主题配置 > 内置搜索](https://vuepress.vuejs.org/zh/theme/default-theme-config.html#内置搜索)。

### [#](https://vuepress.vuejs.org/zh/guide/frontmatter.html#tags)tags

- 类型: `array`
- 默认值: `undefined`

参考: [默认主题配置 > 内置搜索](https://vuepress.vuejs.org/zh/theme/default-theme-config.html#内置搜索)。





# 永久链接

## [#](https://vuepress.vuejs.org/zh/guide/permalinks.html#背景)背景

在 1.x.x 版本之前，VuePress 会检索文档源目录下的所有 markdown 文件并按照文件的层次结构去定义页面链接。 比如你有以下的文件结构：

```text
├── package.json
└── source
    ├── _post
    │   └── intro-vuepress.md
    ├── index.md
    └── tags.md
```

那么你就会获得以下的可用页面：

```text
/source/
/source/tags.html
/source/_post/intro-vuepress.html
```

然而对于 blog 来说，我们希望文章的链接更加灵活，而不是局限于目录结构。VuePress 把这个功能称为永久链接 (permalinks) ，并从 `1.0.0` 版本开始支持。

如果使用永久链接，那么实际的页面链接会像这样：

```text
/source/
/source/tags/
/source/2018/4/1/intro-vuepress.html
```

看起来我们已经看过了 blog 的阴暗面。那么让我们继续看下去。

## [#](https://vuepress.vuejs.org/zh/guide/permalinks.html#永久链接-2)永久链接

一个永久链接是一个旨在未来很多年里维持不变的 URL，由此产生一个发生链接失效（link rot[1 (opens new window)](https://en.wikipedia.org/wiki/Link_rot)）的可能性较小的超链接。VuePress 支持一种灵活的方式去生成固定链接，这种方式允许你使用各种模板变量。

默认的永久链接是`/:regular`。

### [#](https://vuepress.vuejs.org/zh/guide/permalinks.html#配置永久链接)配置永久链接

你可以使用全局配置来向所有页面应用永久链接：

```js
// .vuepress/config.js
module.exports = {
  permalink: "/:year/:month/:day/:slug"
};
```

另外，你也可以只为单独一个页面去设置永久链接。这种方式比全局配置拥有更高的优先级。

📝 **hello.md**:

```markdown
---
title: Hello World
permalink: /hello-world
---

Hello!
```

### [#](https://vuepress.vuejs.org/zh/guide/permalinks.html#模板变量)模板变量

| 变量     | 介绍                                                         |
| -------- | ------------------------------------------------------------ |
| :year    | 文章发布的年份 (4数字)                                       |
| :month   | 文章发布的月份 (2数字)                                       |
| :i_month | 文章发布的月份 (前面不带0)                                   |
| :day     | 文章发布的日份 (2数字)                                       |
| :i_day   | 文章发布的日份 (前面不带0)                                   |
| :slug    | 蛞蝓化文件路径 (不带扩展名)                                  |
| :regular | VuePress默认的生成永久链接的方式，具体实现看 [这里](https://github.com/vuejs/vuepress/blob/master/packages/%40vuepress/shared-utils/src/fileToPath.ts) |



# Markdown 插槽

VuePress 实现了一套针对 Markdown 的内容分发 API。通过这个特性，你可以将你的文档分割成多个片段，以便于在布局组件中灵活组合。

## [#](https://vuepress.vuejs.org/zh/guide/markdown-slot.html#为什么需要-markdown-插槽)为什么需要 Markdown 插槽

首先，我们回顾一下布局组件和 Markdown 文件之间的关系：

Markdown File 1Markdown File 2Layout ComponentMarkdown File 3ProviderConsumer

Markdown 文件是元数据（页面内容、配置等）的提供者，而布局组件负责消费他们。我们可以通过 frontmatter 来定义一些普通数据类型的元数据，但对于 Markdown / HTML 这种涉及到编译前后差异的复杂元数据，frontmatter 却无能能力。

Markdown 插槽便解决了这一类问题。

## [#](https://vuepress.vuejs.org/zh/guide/markdown-slot.html#具名插槽)具名插槽

你可以通过下述的语法来定义一个具名 Markdown 插槽：

```md
::: slot name

:::
```

在布局组件中利用 `Content` 组件来使用该插槽：

```vue
<Content slot-key="name"/>
```

提示

这里我们使用的是 `slot-key` 而不是 `slot`，这是因为在 Vue 中，`slot` 是一个保留的 `prop` 名。

## [#](https://vuepress.vuejs.org/zh/guide/markdown-slot.html#插槽的默认内容)插槽的默认内容

默认情况下，一个 Markdown 文件中的普通内容将会成为 Markdown 插槽的默认内容，你可以直接使用 `Content` 组件来访问它：

```vue
<Content/>
```

## [#](https://vuepress.vuejs.org/zh/guide/markdown-slot.html#例子)例子

假设你的布局组件如下：

```vue
<template>
  <div class="container">
    <header>
      <Content slot-key="header"/>
    </header>
    <main>
      <Content/>
    </main>
    <footer>
      <Content slot-key="footer"/>
    </footer>
  </div>
</template>
```

如果一个页面的 `markdown` 的内容是这样：

```md
::: slot header
# Here might be a page title
:::

- A Paragraph
- Another Paragraph

::: slot footer
Here's some contact info
:::
```

那么这一页最终被渲染出的 HTML 将会是：

```html
<div class="container">
  <header>
    <div class="content header">
      <h1>Here might be a page title</h1>
    </div>
  </header>
  <main>
    <div class="content default">
      <ul>
        <li>A Paragraph</li>
        <li>Another Paragraph</li>
      </ul>
    </div>
  </main>
  <footer>
    <div class="content footer">
      <p>Here's some contact info</p>
    </div>
  </footer>
</div>
```

请注意：

1. 和 Vue 本身提供的 slot 机制不太相同，每个 Content 分发的内容都会被一个 div 所包裹，其 class 是 content 和 slot 的名字。
2. 请确保所定义的 slot 的唯一性。



# 全局计算属性

在 VuePress 中，内置了一些核心的[计算属性 (opens new window)](https://cn.vuejs.org/v2/guide/computed.html#计算属性)，以供[默认主题](https://vuepress.vuejs.org/zh/theme/default-theme-config.html) 或自定义主题使用。

## [#](https://vuepress.vuejs.org/zh/guide/global-computed.html#site)$site

这是你现在看到的这个网站的 `$site` 的值：

```json
{
  "title": "VuePress",
  "description": "Vue 驱动的静态网站生成器",
  "base": "/",
  "pages": [
    {
      "lastUpdated": 1524027677000,
      "path": "/",
      "title": "VuePress",
      "frontmatter": {}
    },
    ...
  ]
}
```

## [#](https://vuepress.vuejs.org/zh/guide/global-computed.html#page)$page

这是你现在看到的这个页面的 `$page` 的值：

```json
{
  "title": "Global Computed",
  "frontmatter": {
    "sidebar": "auto"
  },
  "regularPath": "/zh/miscellaneous/global-computed.html",
  "key": "v-bc9a3e3f9692d",
  "path": "/zh/miscellaneous/global-computed.html",
  "headers": [
    {
      "level": 2,
      "title": "$site",
      "slug": "site"
    },
    {
      "level": 2,
      "title": "$page",
      "slug": "page"
    },
    ...
  ]
}
```

## [#](https://vuepress.vuejs.org/zh/guide/global-computed.html#frontmatter)$frontmatter

[$page](https://vuepress.vuejs.org/zh/guide/global-computed.html#page).frontmatter 的引用。

## [#](https://vuepress.vuejs.org/zh/guide/global-computed.html#lang)$lang

当前页面的语言，默认值为 `en-US`。

**参考:**

- [多语言支持](https://vuepress.vuejs.org/zh/guide/i18n.html)

## [#](https://vuepress.vuejs.org/zh/guide/global-computed.html#localepath)$localePath

当前页面的 locale 路径前缀，默认值为 `/`，当前页面为 `/zh/`。

**参考:**

- [多语言支持](https://vuepress.vuejs.org/zh/guide/i18n.html)

## [#](https://vuepress.vuejs.org/zh/guide/global-computed.html#title)$title

用于当前页面的 `<title>` 标签的值。

## [#](https://vuepress.vuejs.org/zh/guide/global-computed.html#description)$description

用于当前页面的 `<meta name="description" content="...">` 的 `content` 值。

## [#](https://vuepress.vuejs.org/zh/guide/global-computed.html#themeconfig)$themeConfig

即 `siteConfig.themeConfig`。









