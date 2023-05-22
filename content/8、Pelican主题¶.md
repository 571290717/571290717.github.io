Title:# 8、Pelican主题[¶](https://www.osgeo.cn/pelican/pelican-themes.html#pelican-themes)

## 描述[¶](https://www.osgeo.cn/pelican/pelican-themes.html#description)

`pelican-themes` 是一个用于管理Pelican主题的命令行工具。看到了吗 [主题](https://www.osgeo.cn/pelican/settings.html#settings-themes) 与主题相关的设置。

### 使用[¶](https://www.osgeo.cn/pelican/pelican-themes.html#usage)

pelican-themes [-h] [-l] [-i theme path [theme path ...]]

[-r theme name [theme name ...] ]

[-s theme path [theme path ...]] [-v] [--version]

### 可选参数：[¶](https://www.osgeo.cn/pelican/pelican-themes.html#optional-arguments)

- -h, --help

  向帮助人员显示出口

- -l, --list

  显示已安装的主题

- -i theme_path, --install theme_path

  要安装的一个或多个主题

- -r theme_name, --remove theme_name

  要删除的一个或多个主题

- -s theme_path, --symlink theme_path

  与“--install”相同，但创建一个符号链接而不是复制主题。对主题开发有用

- -v, --verbose

  冗长输出

- --version

  打印此脚本的版本

## 实例[¶](https://www.osgeo.cn/pelican/pelican-themes.html#examples)

### 列出安装的主题[¶](https://www.osgeo.cn/pelican/pelican-themes.html#listing-the-installed-themes)

用 `pelican-themes` ，您可以使用 `-l` 或 `--list` 选项：

```
$ pelican-themes -l
notmyidea
two-column@
simple
$ pelican-themes --list
notmyidea
two-column@
simple
```

在本例中，我们可以看到有三个可用的主题： `notmyidea` ， `simple` 和 `two-column` .

`two-column` 前缀为 `@` 因为这个主题不是复制到Pelican主题路径，而是直接链接到它（参见 [Creating symbolic links](https://www.osgeo.cn/pelican/pelican-themes.html#creating-symbolic-links) 有关创建符号链接的详细信息）。

请注意，您可以将 `--list` 选项 `-v` 或 `--verbose` 选项获取更详细的输出，如下所示：

```
$ pelican-themes -v -l
/usr/local/lib/python2.6/dist-packages/pelican-2.6.0-py2.6.egg/pelican/themes/notmyidea
/usr/local/lib/python2.6/dist-packages/pelican-2.6.0-py2.6.egg/pelican/themes/two-column (symbolic link to `/home/skami/Dev/Python/pelican-themes/two-column')
/usr/local/lib/python2.6/dist-packages/pelican-2.6.0-py2.6.egg/pelican/themes/simple
```

### 安装主题[¶](https://www.osgeo.cn/pelican/pelican-themes.html#installing-themes)

可以使用安装一个或多个主题 `-i` 或 `--install` 选项。此选项将要安装的主题的路径作为参数，可以与verbose选项组合使用：

```
# pelican-themes --install ~/Dev/Python/pelican-themes/notmyidea-cms --verbose
# pelican-themes --install ~/Dev/Python/pelican-themes/notmyidea-cms\
                           ~/Dev/Python/pelican-themes/martyalchin \
                           --verbose
# pelican-themes -vi ~/Dev/Python/pelican-themes/two-column
```

### 删除主题[¶](https://www.osgeo.cn/pelican/pelican-themes.html#removing-themes)

这个 `pelican-themes` 命令还可以从Pelican主题路径中删除主题。这个 `-r` 或 `--remove` 选项将要删除的主题的名称作为参数，并可以与 `--verbose` 选择权。

```
# pelican-themes --remove two-column
# pelican-themes -r martyachin notmyidea-cmd -v
```

### 创建符号链接[¶](https://www.osgeo.cn/pelican/pelican-themes.html#creating-symbolic-links)

`pelican-themes` 也可以通过创建符号链接来安装主题，而不是将整个主题复制到Pelican主题路径中。

要象征性地链接主题，可以使用 `-s` 或 `--symlink` ，其工作原理与 `--install` 选项：

```
# pelican-themes --symlink ~/Dev/Python/pelican-themes/two-column
```

在这个例子中， `two-column` 主题现在象征性地链接到Pelican主题路径，所以我们可以使用它，但我们也可以修改它，而不必在每次修改后重新安装它。

这对主题开发很有用：

```
$ sudo pelican-themes -s ~/Dev/Python/pelican-themes/two-column
$ pelican ~/Blog/content -o /tmp/out -t two-column
$ firefox /tmp/out/index.html
$ vim ~/Dev/Pelican/pelican-themes/two-column/static/css/main.css
$ pelican ~/Blog/content -o /tmp/out -t two-column
$ cp /tmp/bg.png ~/Dev/Pelican/pelican-themes/two-column/static/img/bg.png
$ pelican ~/Blog/content -o /tmp/out -t two-column
$ vim ~/Dev/Pelican/pelican-themes/two-column/templates/index.html
$ pelican ~/Blog/content -o /tmp/out -t two-column
```

### 同时做几件事[¶](https://www.osgeo.cn/pelican/pelican-themes.html#doing-several-things-at-once)

这个 `--install` ， `--remove` 和 `--symlink` 选项不是互斥的，因此可以在同一命令行中将它们组合起来，一次执行多个操作，如下所示：

```
# pelican-themes --remove notmyidea-cms two-column \
                 --install ~/Dev/Python/pelican-themes/notmyidea-cms-fr \
                 --symlink ~/Dev/Python/pelican-themes/two-column \
                 --verbose
```

在本例中，主题 `notmyidea-cms` 被主题替换 `notmyidea-cms-fr`

[ Previous](https://www.osgeo.cn/pelican/themes.html)[Next ](https://www.osgeo.cn/pelican/importer.html)