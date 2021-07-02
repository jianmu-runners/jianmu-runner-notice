workflow:
  name: 发布企业微信机器人任务
  ref: publish_qywx_charbot_publish
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
      workspace: jianmu-runner-charbot-qywx
      remote_url: https://gitee.com/jianmu_dev/jianmu-runner-charbot-qywx.git
      commit_branch: master
  Publish:
    type: hub_publish:v1.0
    sources:
      - Clone
    targets:
      - End
    param:
      registry_url: https://hub.jianmu.dev
      task_dsl_file:  jianmu-runner-charbot-qywx/task.dsl
      hub_appkey: ((jianmuhub.appkey))
  End:
    type: end
    sources:
      - Publish
