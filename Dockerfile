# 使用轻量 Python 运行环境
FROM python:3.10-slim

# 避免 Python 缓存文件
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# 设置工作目录
WORKDIR /app

# 先复制依赖文件
COPY requirements.txt /app/

# 安装依赖（加上常用科学计算库）
RUN pip install --no-cache-dir -r requirements.txt     && pip install --no-cache-dir uvicorn fastapi pandas numpy matplotlib scikit-learn

# 复制全部源码
COPY . /app

# 暴露 API 端口
EXPOSE 8000

# 启动命令
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]
