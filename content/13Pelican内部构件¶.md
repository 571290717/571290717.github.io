Title:# 13、Pelican内部构件[¶](https://www.osgeo.cn/pelican/internals.html#pelican-internals)

本节描述Pelican如何在内部工作。正如您将看到的，它非常简单，但是一点文档并不有害。:)

你也可以在 [Pelican的一些历史](https://www.osgeo.cn/pelican/report.html) 原作者写的一份报告的节选，其中包含一些软件设计信息。



## 总体结构[¶](https://www.osgeo.cn/pelican/internals.html#overall-structure)

Pelican所做的是获取一个文件列表并将它们处理成某种输出。通常，输入文件是RestructedText和Markdown文件，输出是blog，但是输入和输出都可以是您想要的任何内容。

逻辑分为不同的类和概念：

- **作家** 负责编写文件：.html文件、RSS提要等。由于这些操作是常用的，所以对象只创建一次，然后传递给生成器。
- **读者** 用于读取各种格式（目前为HTML、Markdown和RestructedText，但系统是可扩展的）。给定一个文件，它们返回元数据（作者、标记、类别等）和内容（HTML格式）。
- **生成器** 生成不同的输出。例如，Pelican `ArticlesGenerator` 和 `PageGenerator` . 给定一个配置，他们可以做任何他们想做的事。大多数时候，它是从输入生成文件的。
- Pelican也使用模板，所以很容易编写自己的主题。语法是 [Jinja2](https://palletsprojects.com/p/jinja/) 而且很容易学习，所以不要犹豫，跳进去，建立你自己的主题。

## 如何实现一个新的阅读器？[¶](https://www.osgeo.cn/pelican/internals.html#how-to-implement-a-new-reader)

你想给Pelican添加一种很棒的标记语言吗？好吧，你唯一要做的就是用 `read` 方法返回HTML内容和一些元数据。

看看降价阅读器：

```
from pelican.readers import BaseReader
from pelican.utils import pelican_open
from markdown import Markdown

class MarkdownReader(BaseReader):
    enabled = True

    def read(self, source_path):
        """Parse content and metadata of markdown files"""

        with pelican_open(source_path) as text:
            md_extensions = {'markdown.extensions.meta': {},
                             'markdown.extensions.codehilite': {}}
            md = Markdown(extensions=md_extensions.keys(),
                          extension_configs=md_extensions)
            content = md.convert(text)

        metadata = {}
        for name, value in md.Meta.items():
            name = name.lower()
            meta = self.process_metadata(name, value[0])
            metadata[name] = meta
        return content, metadata
```

很简单，不是吗？

如果您的新阅读器需要额外的Python依赖项，那么您应该将它们 `import` a中的语句 `try...except` 阻止。然后在reader的类中，设置 `enabled` 类属性来标记导入成功或失败。这使得用户可以继续使用他们喜欢的标记方法，而无需为他们不使用的格式安装模块。

## 如何实现一个新的生成器？[¶](https://www.osgeo.cn/pelican/internals.html#how-to-implement-a-new-generator)

生成器有两种重要的方法。您不必同时创建这两个；只调用现有的。

- `generate_context` ，这是第一个，对于所有的生成器。做你该做的事情，如果需要的话更新全局上下文。此上下文在所有生成器之间共享，并将传递给模板。例如 `PageGenerator` `generate_context` 方法查找所有页，将它们转换为对象，并用它们填充上下文。小心 *not* 在这个阶段使用此上下文输出任何内容，因为它可能会因其他生成器的影响而更改。
- `generate_output` 然后调用。猜猜它是做什么用的？哦，产生输出。：）在这里，您可能需要查看上下文并调用 `writer` 作为此函数的第一个参数传递的。在 `PageGenerator` 例如，此方法将查看全局上下文中记录的所有页面，并在磁盘上输出一个文件（使用writer方法 `write_file` )对于遇到的每个页面。

[ Previous](https://www.osgeo.cn/pelican/contribute.html)[Next ](https://www.osgeo.cn/pelican/report.html)