FROM python:3.7.10-slim-buster
WORKDIR /app
COPY ./ ./
RUN pip3 install flask
ENTRYPOINT [ "python3","app.py" ]
# for windows
# docker build -t weather_demo_server .
# for raspberry pi:
# docker buildx build -t weather_demo_server:arm . --platform linux/arm --load