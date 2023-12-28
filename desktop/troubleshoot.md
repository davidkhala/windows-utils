- [删除神秘的defaultuser0](https://superuser.com/questions/1152792/what-is-defaultuser0-and-is-it-safe-to-delete#:~:text=1%20Start%20your%20computer%20using%20your%20Windows%2010,computer%20%3E%20delete%20the%20Defaultuser0%20account.%20More%20)
  1. 以管理员身份运行cmd
  2. `net user defaultuser0 /DELETE`
  3. 删除C:\Users\defaultuser0\ 文件夹
- 由于同一位置中存在不能定向的文件夹
  - 原因：文件夹正在被OneDrive同步
  - 解决：OneDrive 设置->管理备份->解除
