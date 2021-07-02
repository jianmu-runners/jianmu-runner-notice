name: 企业微信发送通知
description: 对接企业微信群机器人，用于发送通知
owner: jianmu
source: https://gitee.com/jianmu-runners/jianmu-runner-charbot-qywx
docs: https://gitee.com/jianmu-runners/jianmu-runner-charbot-qywx
ref: charbot_qywx_send
version: v1.0
type: DOCKER
inputParameters:
  - name: 企业微信机器人webhook地址
    ref: bot_webhook_url
    type: SECRET
    value: ((charbot.webhook))
  - name: 消息类型
    ref: msgtype
    type: STRING
    value: text
  - name: text消息内容
    ref: text_content
    type: STRING
    value: this is a text.
  - name: 提醒列表，userid，若填写，将会@指定用户，@all表示提醒所有人
    ref: mentioned_list
    type: STRING
    value: []
  - name: 提醒列表，手机号，若填写，将会@手机号对应的用户，@all表示提醒所有人
    ref: mentioned_list
    type: STRING
    value: []
spec:
  image: 'jianmudev/jianmu-runner-charbot-qywx:v1.0'
