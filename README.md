# jianmu-runner-notice

#### 介绍
用于对接企业微信机器人

#### 参数说明
可参考[企业微信-群机器人配置说明](https://work.weixin.qq.com/api/doc/90000/90136/91770)

##### 全局参数
```
# 机器人webhook地址
JIANMU_BOT_WEBHOOK_URL

# 消息类型(text/markdown/image/news)
JIANMU_MSGTYPE
```

##### 根据msgtype不同设置不同的参数

text
```
# 文本内容，必填，最长不超过2048个字节，必须是utf8编码
JIANMU_TEXT_CONTENT

# userid的列表，提醒群中的指定成员(@某个成员)，@all表示提醒所有人，如果开发者获取不到userid，可以使用mentioned_mobile_list
JIANMU_MENTIONED_LIST
# 手机号列表，提醒手机号对应的群成员(@某个成员)，@all表示提醒所有人
JIANMU_MENTIONED_MOBILE_LIST
```

markdown
```
# markdown内容，必填，最长不超过4096个字节，必须是utf8编码
JIANMU_MARKDOWN_CONTENT
```

image
```
# 图片内容的base64编码，必填，图片（base64编码前）最大不能超过2M，支持JPG,PNG格式
JIANMU_IMAGE_BASE64

# 图片内容（base64编码前）的md5值，必填
JIANMU_IMAGE_MD5
```

news
```
# 标题，必填,不超过128个字节，超过会自动截断
JIANMU_NEWS_TITLE

# 描述，不超过512个字节，超过会自动截断
JIANMU_NEWS_DESCRIPTION

# 点击后跳转的链接，必填
JIANMU_NEWS_URL

# 图文消息的图片链接，支持JPG、PNG格式，较好的效果为大图 1068*455，小图150*150。
JIANMU_NEWS_PICURL
```

#### 构建docker镜像
```
# 创建docker镜像
docker build -t jianmudev/jianmu-runner-qywx-notice:${version} .

# 上传docker镜像
docker push jianmudev/jianmu-runner-qywx-notice:${version}
```

#### 用法
企业微信发送通知(以text类型为例):
```
docker run --rm \
  -e JIANMU_BOT_WEBHOOK_URL=xxx \
  -e JIANMU_MSGTYPE=xxx \
  -e JIANMU_TEXT_CONTENT=xxx \
  -e JIANMU_MENTIONED_MOBILE_LIST='["xxx"]' \
  jianmudev/jianmu-runner-notice:${version}
```


