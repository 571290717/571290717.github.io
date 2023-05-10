# API

# 命令行接口

## [#](https://vuepress.vuejs.org/zh/api/cli.html#基本用法)基本用法

```bash
vuepress <command> targetDir [options]
```

## [#](https://vuepress.vuejs.org/zh/api/cli.html#build)build

在指定的目录生成一个静态站点。

### [#](https://vuepress.vuejs.org/zh/api/cli.html#p-port-port)-p, --port `<port>`

查看 [port](https://vuepress.vuejs.org/zh/config/#port)。

### [#](https://vuepress.vuejs.org/zh/api/cli.html#t-temp-temp)-t, --temp `<temp>`

查看 [temp](https://vuepress.vuejs.org/zh/config/#temp)。

### [#](https://vuepress.vuejs.org/zh/api/cli.html#c-cache-cache)-c, --cache `[cache]`

### [#](https://vuepress.vuejs.org/zh/api/cli.html#no-cache)--no-cache

查看 [cache](https://vuepress.vuejs.org/zh/config/#cache)。

### [#](https://vuepress.vuejs.org/zh/api/cli.html#dest-dest)--dest `<dest>`

查看 [dest](https://vuepress.vuejs.org/zh/config/#dest)。

### [#](https://vuepress.vuejs.org/zh/api/cli.html#debug)--debug

以调试模式启动开发服务器。

### [#](https://vuepress.vuejs.org/zh/api/cli.html#silent)--silent

以安静模式启动开发服务器。

### [#](https://vuepress.vuejs.org/zh/api/cli.html#max-concurrency)--max-concurrency

设置渲染文档的最大并发量，当渲染大量文档，可能造成内存溢出时使用

## [#](https://vuepress.vuejs.org/zh/api/cli.html#dev)dev

启动一个开发服务器。来自 `vuepress build` 的所有选项都可用。除此以外，还有几个专门针对 dev 的选项：

### [#](https://vuepress.vuejs.org/zh/api/cli.html#host-host)--host `<host>`

查看 [host](https://vuepress.vuejs.org/zh/config/#host)。

### [#](https://vuepress.vuejs.org/zh/api/cli.html#open)--open

当服务端准备就绪时自动打开浏览器。

### [#](https://vuepress.vuejs.org/zh/api/cli.html#no-clear-screen)--no-clear-screen

当 dev server 就绪时不清除屏幕。请注意 dev server 不会在调试模式下清除屏幕。

## [#](https://vuepress.vuejs.org/zh/api/cli.html#eject)eject

将默认主题复制到 `.vuepress/theme` 目录，以供自定义。

## [#](https://vuepress.vuejs.org/zh/api/cli.html#更多指令)更多指令

你可以使用 [extendCli](https://vuepress.vuejs.org/zh/plugin/option-api.html#extendcli) 来创建自定义命令。

# Node.js API

## [#](https://vuepress.vuejs.org/zh/api/node.html#使用)使用

```js
const { createApp, dev, build, eject } = require('vuepress')
```

## [#](https://vuepress.vuejs.org/zh/api/node.html#方法)方法

### [#](https://vuepress.vuejs.org/zh/api/node.html#createapp-options-promise-app)createApp([options]): Promise<App>

创建一个 VuePress 应用实例。

#### [#](https://vuepress.vuejs.org/zh/api/node.html#app-prototype-process-promise-void-never)App.prototype.process: () => Promise<void> | never

用于准备当前站点上下文的异步方法。其中包含加载页面和插件、应用插件等。

#### [#](https://vuepress.vuejs.org/zh/api/node.html#app-prototype-dev-promise-app-never)App.prototype.dev: () => Promise<App> | never

使用当前应用程序上下文启动一个 devProcess.

#### [#](https://vuepress.vuejs.org/zh/api/node.html#app-prototype-build-promise-app-never)App.prototype.build: () => Promise<App> | never

使用当前应用程序上下文启动一个 buildProcess.

### [#](https://vuepress.vuejs.org/zh/api/node.html#dev-options-promise-app)dev([options]): Promise<App>

启动一个 Dev Server，实际上它是由 `createapp` 实现的：

```js
async function dev (options) {
  const app = createApp(options)
  await app.process()
  return app.dev()
}
```

### [#](https://vuepress.vuejs.org/zh/api/node.html#build-options-promise-app)build([options]): Promise<App>

将源文件构建为静态站点, 实际上它是由 `createapp` 实现的：

```js
async function build (options) {
  const app = createApp(options)
  await app.process()
  return app.build()
}
```

### [#](https://vuepress.vuejs.org/zh/api/node.html#eject-targetdir-promise-void)eject(targetDir): Promise<void>

将默认主题复制到 `{targetDir}/.vuepress/theme`中进行自定义。

## [#](https://vuepress.vuejs.org/zh/api/node.html#options)Options

### [#](https://vuepress.vuejs.org/zh/api/node.html#sourcedir)sourceDir

- 类型: `string`
- 默认值: `true`

指定 VuePress 站点的源目录。

### [#](https://vuepress.vuejs.org/zh/api/node.html#theme)theme

- 类型: `string`
- 默认值: `false`

参见 [theme](https://vuepress.vuejs.org/zh/config/#theme)。

### [#](https://vuepress.vuejs.org/zh/api/node.html#plugins)plugins

- 类型: `array`
- 默认值: `false`

参见 [plugins](https://vuepress.vuejs.org/zh/config/#plugins)。

### [#](https://vuepress.vuejs.org/zh/api/node.html#temp)temp

- 类型: `string`
- 默认值: `false`

参见 [temp](https://vuepress.vuejs.org/zh/config/#temp)。

### [#](https://vuepress.vuejs.org/zh/api/node.html#dest)dest

- 类型: `string`
- 默认值: `false`

参见 [dest](https://vuepress.vuejs.org/zh/config/#dest)。

### [#](https://vuepress.vuejs.org/zh/api/node.html#siteconfig)siteConfig

- 类型: `object`
- 默认值: `{}`

当你想编写测试且不想依赖于实际的配置文件时，它将非常有用。想要查看所有的配置选项，请移步 [siteConfig](https://vuepress.vuejs.org/zh/config/)。



