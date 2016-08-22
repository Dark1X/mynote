# ssh

## 简介

ssh 的英文全称是 Secure SHell。

ssh 协议族可以用来进行远程控制，在计算机之间传送文件。
而实现此功能的传统方式，
如 telnet（终端仿真协议）、rcp、ftp、rlogin、rsh 都是极为不安全的，
并且会使用明文传送密码。

Openssh 是 ssh(Secure SHell)协议的免费开源实现。


## 验证

在客户端来看，ssh 提供两种级别的安全验证：

* 基于密码的安全验证：知道帐号和密码，就可以登录到远程主机，并且所有传输的数据都会被加密。
* 基于密钥的安全验证:需要依靠密钥，也就是你必须为自己创建一对密钥，并把公有密钥放在需要访问的服务器上。

在客户端，基于密码的安全验证操作很简单，
只需运行 `ssh user@host` 命令，
然后根据提示输入密码就可以了，无需配置。
当远程服务器ssh的端口不是默认 22 的时候，上面命令还需指定端口号，
即 `ssh user@host -p port`。

本文主要介绍客户端基于密钥安全验证的安装和配置。


## 配置


### 创建密钥对

```
ssh-keygen -t rsa -C "your_email@host.com"
```

其中：

* `-t` 参数指明密钥的类型，默认即 rsa ，可以省略，也有其他类型。
* `-C` 设置注释文字，比如你的邮箱。

运行以上命令，一路回车（当然也可以根据提示设置），默认会在 `~/.ssh/` 目录下生成一对密钥文件，
即你的公钥文件 id\_rsa 和私钥文件 id\_rsa.pub，
公钥文件是放在远程ssh服务器上面的，而私钥文件是放在本地客户端的。

你可以生成多个不同的密钥对文件，分别用于登录不同的远程 ssh 服务器，你也可以只用一对密钥文件来登录。


### 复制公钥至远程ssh服务器

默认 ssh 端口为 22：

```
ssh-copy-id -i ~/.ssh/id_rsa.pub user@host
```

用 `-p` 参数指定 ssh 端口：

```
ssh-copy-id -i ~/.ssh/id_rsa.pub -p port user@host
```

运行以上命令后，就可以无需输入密码就可以登录远程 ssh 服务器了，如下：

```
ssh user@host
ssh -p port user@host
```

当你只用一对密钥文件来登录不同的远程 ssh 服务器时，只需把你的公钥文件分别复制到远程 ssh 服务器上就可以了。
但用多对不同的密钥文件登录设置远程登录时，可以用 ssh 的 config 文件配置。


### ssh config 配置文件

ssh 的 config 不仅可以配置多个密钥对，也可以设置快捷命令，登录时不用每次都键入用户名和远程服务器地址。

ssh 的 config 文件为 `~/.ssh/config`，以下是一个范例：

```
Host   h1
    HostName        123.45.67.89
    Port            2020
    User            user1
    IdentityFile    ~/.ssh/id_rsa_file_1

Host   h2
    Hostname        89.67.45.123
    Port            22
    User            user2
    Identityfile    ~/.ssh/id_rsa_file_2
```

当有以上配置后，就可以简单的运行如下命令进行ssh登录了：

登录到123.45.67.89

```
ssh h1
```

登录到89.67.45.123

```
ssh h2
```

同样，基于 ssh 协议的 rsync、scp、git 等命令指定远程服务器时均可以使用此简写形式。
