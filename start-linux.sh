#!/bin/sh
set -eu
cd "$(dirname "$0")"
for tool in ffmpeg ffprobe; do
  command -v "$tool" >/dev/null 2>&1 || { echo "缺少依赖：$tool" >&2; exit 1; }
done
[ ! -x dist/linux-unpacked/hongguo-drama ] || exec ./dist/linux-unpacked/hongguo-drama "$@"
for tool in node npm; do
  command -v "$tool" >/dev/null 2>&1 || { echo "缺少依赖：$tool" >&2; exit 1; }
done
[ -d node_modules ] || { echo "请先执行 npm ci" >&2; exit 1; }
[ -f dist-react/index.html ] || npm run build:react
exec npm start -- "$@"
