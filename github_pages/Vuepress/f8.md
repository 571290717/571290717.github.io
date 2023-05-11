# 其他-从 VuePress 0.x 迁移

## [#](https://vuepress.vuejs.org/zh/miscellaneous/migration-guide.html#站点配置)站点配置

### ga 替换

GA 已经被分离为一个单独的插件 [@vuepress/plugin-google-analytics](https://vuepress.vuejs.org/zh/plugin/official/plugin-google-analytics.html)。

#### UPGRADE

1. 安装 `@vuepress/plugin-google-analytics`:

```bash
yarn add -D @vuepress/plugin-google-analytics@next
# OR npm install -D @vuepress/plugin-google-analytics@next
```

1. 更新 `vuepress/config.js`:

```diff
module.exports = {
-  ga: 'UA-12345678-9'
+  plugins: [
+    ['@vuepress/google-analytics', {
+      ga: 'UA-12345678-9'
+    }]
+ ]
}
```

### [#](https://vuepress.vuejs.org/zh/miscellaneous/migration-guide.html#markdown-config)markdown.config 重命名

使用 `extendMarkdown`：

#### UPGRADE

更新 `vuepress/config.js`:

```diff
// vuepress/config.js
module.exports = {
-  markdown: {
-    config(md) { /* ... */ }
-  },
+  extendMarkdown(md) { /* ... */ }
}
```

### [#](https://vuepress.vuejs.org/zh/miscellaneous/migration-guide.html#serviceworker)serviceWorker 替换

Service Worker 相关的功能已经被分离为一个单独的插件 [@vuepress/plugin-pwa](https://vuepress.vuejs.org/zh/plugin/official/plugin-pwa.html)。

#### UPGRADE

参考: [@vuepress/plugin-pwa > 从 0.x 迁移](https://vuepress.vuejs.org/zh/plugin/official/plugin-pwa.html#从-0-x-迁移)

## [#](https://vuepress.vuejs.org/zh/miscellaneous/migration-guide.html#默认主题配置)默认主题配置

### [#](https://vuepress.vuejs.org/zh/miscellaneous/migration-guide.html#vuepress-override-styl)`.vuepress/override.styl` 替换

使用 `.vuepress/styles/palette.styl` 代替。

#### UPGRADE

参考: [Config > palette.styl](https://vuepress.vuejs.org/zh/config/#palette-styl)

### [#](https://vuepress.vuejs.org/zh/miscellaneous/migration-guide.html#vuepress-style-styl)`.vuepress/style.styl` 替换

使用 `.vuepress/styles/index.styl` 代替。

#### UPGRADE

参考: [Config > index.styl](https://vuepress.vuejs.org/zh/config/#index-styl)