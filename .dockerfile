FROM node:20-alpine

# 设置工作目录
WORKDIR /app

# 仅复制依赖相关文件
COPY package*.json ./

# 安装依赖并清理 npm 缓存
RUN npm install && \
    npm cache clean --force

# 复制源代码
COPY . .

# 构建项目
RUN npm run build

EXPOSE 3000

# 指定启动命令
CMD ["npm", "run", "serve"]