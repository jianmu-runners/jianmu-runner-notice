workflow:
  name: 发布企业微信机器人任务
  ref: publish_qywx_chatbot_publish
  description: 发布企业微信机器人发通知的任务到hub
  Start:
    type: start
    targets:
      - Clone
  Clone:
    type: git:v1.0
    sources:
      - Start
    targets:
      - Publish
    param:
      workspace: jianmu-runner-chatbot-qywx
      remote_url: https://gitee.com/jianmu-runners/jianmu-runner-chatbot-qywx.git
      commit_branch: master
  Publish:
    type: hub_publish:v1.0
    sources:
      - Clone
    targets:
      - End
    param:
      registry_url: https://hub.jianmu.dev
      task_dsl_file:  jianmu-runner-chatbot-qywx/task.dsl
      hub_appkey: ((jianmuhub.appkey))
  End:
    type: end
    sources:
      - Publish
