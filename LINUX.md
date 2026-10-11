# Ubuntu 24.04 x86_64 适配

依赖：Node.js >=22.12、npm、系统 FFmpeg/ffprobe。

安装依赖：`npm ci`。启动：`./start-linux.sh`。
构建目录版：`npm run build:linux:dir`。
构建 deb：`npm run build:linux`，产物位于 dist/。

deb 声明系统 FFmpeg 依赖，目录版也需要系统 FFmpeg；不内置 macOS 媒体二进制。
保留 Electron 沙箱，不默认使用 --no-sandbox。
来源服务可用性取决于上游接口，未改变锁定分集的处理规则。

## 当前环境验证

Ubuntu 24.04.5 x86_64，Node.js 22.22.2。界面构建、媒体处理 5 项回归、合并规划检查、系统 FFmpeg 真实混合编码合并/兼容合并/同编码合并已通过。Linux 桌面应用已进行 12 秒启动检查，未关闭沙箱。

上游 check-macos.cjs 的 5 项工具路径检查通过；2 项 macOS 窗口测试因模拟对象缺少 webContents.on 失败。未验证线上来源搜索及实际剧集下载。

此机器 npm 全局代理失效时，可使用 `npm ci --proxy=null --https-proxy=null --no-audit --no-fund`；未改动全局 npm 配置。
