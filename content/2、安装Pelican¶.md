Title: 22222
Date: 2010-12-03 10:20
Category: Review




# 2、安装Pelican[¶](https://www.osgeo.cn/pelican/install.html#installing-pelican)

Pelican目前在3.6+上运行得最好；不支持Python的早期版本。

你可以通过几种不同的方法安装鹈鹕。最简单的是via [Pip](https://pip.pypa.io/):



```
python -m pip install pelican
```

或者，如果您打算使用降价：

```
python -m pip install "pelican[markdown]"
```

（请记住，有些操作系统将要求您在上面的命令前面加上 `sudo` 以便在系统范围内安装鹈鹕。）

虽然以上是最简单的方法，但推荐的方法是为Pelicanvia创建一个虚拟环境 [virtualenv](https://virtualenv.pypa.io/en/latest/) 在安装Pelican之前。假设你有 [virtualenv](https://virtualenv.pypa.io/en/latest/) 安装后，您可以打开一个新的终端会话并为Pelican创建一个新的虚拟环境：

```
virtualenv ~/virtualenvs/pelican
cd ~/virtualenvs/pelican
source bin/activate
```

创建并激活虚拟环境后，Pelican可以通过 `python -m pip install pelican` 如上所述。或者，如果您有项目源代码，您可以使用distutils方法安装Pelican:：

```
cd path-to-Pelican-source
python setup.py install
```

如果您已经安装了Git，并且希望安装Pelican的最新bleeding-edge版本，而不是稳定版本，请使用以下命令：

```
python -m pip install -e "git+https://github.com/getpelican/pelican.git#egg=pelican"
```

一旦Pelican安装，你可以运行 `pelican --help` 查看基本使用选项。有关详细信息，请参阅 [Publish](https://www.osgeo.cn/pelican/publish.html) 部分。

## 可选程序包[¶](https://www.osgeo.cn/pelican/install.html#optional-packages)

如果你打算用 [Markdown](https://pypi.org/project/Markdown/) 作为一种标记格式，您可以安装Pelican和Markdown支持：

```
python -m pip install "pelican[markdown]"
```

可以在设置文件中启用打印增强功能，但首先必须 [Typogrify](https://pypi.org/project/typogrify/) 必须安装库：

```
python -m pip install typogrify
```

## 依赖关系[¶](https://www.osgeo.cn/pelican/install.html#dependencies)

安装Pelican时，应自动安装以下依赖的Python包，而无需您执行任何操作：

- feedgenerator <https://pypi.org/project/feedgenerator/> _，以生成Atom源
- jinja2 <https://pypi.org/project/Jinja2/> _，用于模板支持
- pygments <https://pypi.org/project/Pygments/> _，用于突出显示语法
- docutils <https://pypi.org/project/docutils/> _，以支持将RestructedText作为输入格式
- pytz <https://pypi.org/project/pytz/> _，用于时区定义
- blinker <https://pypi.org/project/blinker/> _，一个对象到对象和广播信令系统
- unidecode <https://pypi.org/project/Unidecode/> _，用于Unicode文本实用程序的ASCII音译
- MarkupSafe <https://pypi.org/project/MarkupSafe/> _，用于标记安全字符串实现
- python-dateutil <https://pypi.org/project/python-dateutil/> _，以读取日期元数据

## 升级[¶](https://www.osgeo.cn/pelican/install.html#upgrading)

如果你安装了一个稳定的鹈鹕释放 [Pip](https://pip.pypa.io/) 如果希望升级到最新的稳定版本，可以通过添加 `--upgrade` ：：

```
python -m pip install --upgrade pelican
```

如果通过distutils或bleeding-edge方法安装Pelican，只需执行相同的步骤即可安装最新版本。

## 启动你的网站[¶](https://www.osgeo.cn/pelican/install.html#kickstart-your-site)

一旦安装了Pelican，你就可以创建一个骷髅了 `pelican-quickstart` 命令，从询问有关站点的一些问题开始：

```
pelican-quickstart
```

如果在激活的虚拟环境中运行， `pelican-quickstart` 将在内部查找关联的项目路径 `$VIRTUAL_ENV/.project` . 如果该文件存在并且包含有效的目录路径，新的Pelican项目将保存在该位置。否则，默认为当前工作目录。要在初始调用时设置新的项目路径，请使用： `pelican-quickstart --path /your/desired/directory`

一旦你回答完所有的问题，你的项目将包括以下层次结构（除了 *页* -如以下括号所示-如果您计划创建非时间顺序的内容，您可以选择添加自己）：

```
yourproject/
├── content
│   └── (pages)
├── output
├── tasks.py
├── Makefile
├── pelicanconf.py       # Main settings file
└── publishconf.py       # Settings to use when ready to publish
```

下一步是开始向 *内容* 为您创建的文件夹。