# Trojan-Go 一键部署

该项目用于一键部署 Trojan-Go 到 Vultr，并使用 Cloudflare 自动配置域名解析，Let's Encrypt 自动生成证书。

## 环境准备

- [Terraform](https://www.terraform.io/downloads.html)

## 使用说明

1. 创建 SSH 私钥+公钥（对应配置项 `ssh_private_key`），在 [Vultr](https://my.vultr.com/) 上添加公钥，获取到公钥的ID（对应配置项 `ssh_key_id`）
2. 在 Vultr 中创建 [API Token](https://my.vultr.com/settings/#settingsapi) （对应配置项 `vultr_token`）
3. 在 [Cloudflare](https://www.cloudflare.com) 中获取域名的 ZoneID（对应配置项 `cloudflare_zone_id`）
4. 在 Cloudflare 中创建 [API Token](https://dash.cloudflare.com/profile/api-tokens)，权限分配 `Zone/DNS/Edit` （对应配置项 `cloudflare_api_token`）

## 配置参数

- `vultr_token`： Vultr API Token
- `cloudflare_api_token`：Cloudflare API Token
- `cloudflare_zone_id`：Cloudflare Zone ID
- `ssh_key_id`：SSH 公钥 ID
- `ssh_private_key`：SSH 私钥路径
- `domain`：域名
- `password`：Trojan-Go 密码
- `region`：服务器部署区域
- `plan`：服务器规格


## 示例

在 新加坡 创建一个实例

```bash
export VULTR_ACCESS_TOKEN=Vultr API Token
export CLOUDFLARE_API_TOKEN=Cloudflare API Token
export CLOUDFLARE_ZONE_ID=Cloudflare Zone ID

terraform apply -var vultr_token=$VULTR_ACCESS_TOKEN \
    -var cloudflare_api_token=$CLOUDFLARE_API_TOKEN \
    -var cloudflare_zone_id=$CLOUDFLARE_ZONE_ID \
    -var domain=hello-sgp.example.com \
    -var password=fre4-0edv-7cQ \
    -var region=sgp \
    -var ssh_private_key=~/.ssh/id_rsa
```

> 注意：一定要修改 domain 和 password！

客户端配置示例

Surge：

```
Vultr = trojan, hello-sgp.example.com, 443, password=fre4-0edv-7cQ, skip-cert-verify=true, sni=hello-sgp.example.com
```

Clash：

```json
{
    "name": "Vultr",
    "password": "fre4-0edv-7cQ",
    "port": 443,
    "server": "hello-sgp.example.com",
    "skip-cert-verify": true,
    "sni": "hello-sgp.example.com",
    "type": "trojan"
}
```