{% if request.target == "clash" or request.target == "clashr" %}

port: {{ default(local.clash.http_port, "7890") }}
socks-port: {{ default(local.clash.socks_port, "7891") }}
allow-lan: {{ default(local.clash.allow_lan, "true") }}
mode: Rule
log-level: {{ default(local.clash.log_level, "info") }}
external-controller: :9090

dns:
  enable: true # 是否启用dns false
  ipv6: false
  listen: 0.0.0.0:53
  # enhanced-mode: fake-ip # 模式：redir-host或fake-ip 新版本中 redir-host 已经被弃用
  fake-ip-range: 198.18.0.1/16 #
  fake-ip-filter: # fake ip 白名单列表，如果你不知道这个参数的作用，请勿修改
     #- '*.lan'
     #- localhost.ptlogin2.qq.com
  nameserver:
    - 223.5.5.5
    - tls://223.5.5.5:853
    - https://223.5.5.5/dns-query
  fallback:
    - 8.8.8.8
    - 1.1.1.1
    - tls://1.0.0.1:853
    - tls://dns.google:853
    - https://cloudflare-dns.com/dns-query
    - https://dns.google/dns-query
  fallback-filter:
    geoip: true # 默认
    ipcidr: # 在这个网段内的 IP 地址会被考虑为被污染的 IP
      - 240.0.0.0/4
  nameserver-policy:
    '+.hdu.edu.cn': '210.32.32.10'


{% if local.clash.new_field_name == "true" %}
proxies: ~
proxy-groups: ~
rules: ~
{% else %}
Proxy: ~
Proxy Group: ~
Rule: ~
{% endif %}

{% endif %}

{% if request.target == "surge" %}

[General]
loglevel = notify
bypass-system = true
skip-proxy = 127.0.0.1,192.168.0.0/16,10.0.0.0/8,172.16.0.0/12,100.64.0.0/10,localhost,*.local,e.crashlytics.com,captive.apple.com,::ffff:0:0:0:0/1,::ffff:128:0:0:0/1
#DNS设置或根据自己网络情况进行相应设置
bypass-tun = 192.168.0.0/16,10.0.0.0/8,172.16.0.0/12
dns-server = 223.5.5.5, 1.1.1.1, 8.8.8.8

[Script]

{% endif %}
{% if request.target == "loon" %}

[General]
# IPV6 启动与否
ipv6 = false
# udp 类的 dns 服务器，用,隔开多个服务器，system 表示系统 dns
dns-server = 223.5.5.5, 1.1.1.1, 8.8.8.8
# DNS over HTTPS服务器，用,隔开多个服务器
doh-server = https://dns.alidns.com/dns-query, https://dns.google/dns-query, https://dns.google/dns-query
# 是否开启局域网代理访问
allow-wifi-access = false
# 开启局域网访问后的 http 代理端口
wifi-access-http-port = 7222
# 开启局域网访问后的 socks5 代理端口
wifi-access-socks5-port = 7221
# 测速所用的测试链接，如果策略组没有自定义测试链接就会使用这里配置的
proxy-test-url = http://connectivitycheck.gstatic.com
# 节点测速时的超时秒数
test-timeout = 2
# 指定流量使用哪个网络接口进行转发
interface-mode = auto
sni-sniffing = true
# 禁用 stun 是否禁用 stun 协议的 udp 数据，禁用后可以有效解决 webrtc 的 ip 泄露
disable-stun = true
# 策略改变时候打断连接
disconnect-on-policy-change = true
# 一个节点连接失败几次后会进行节点切换，默认 3 次
switch-node-after-failure-times = 3
# 订阅资源解析器链接
resource-parser = https://gitlab.com/lodepuly/vpn_tool/-/raw/main/Resource/Script/Sub-Store/sub-store-parser_for_loon.js
# 自定义 geoip 数据库的 url
geoip-url = https://gitlab.com/Masaiki/GeoIP2-CN/-/raw/release/Country.mmdb
# 配置了该参数，那么所配置的这些IP段、域名将不会转发到Loon，而是由系统处理
skip-proxy = 192.168.0.0/16, 10.0.0.0/8, 172.16.0.0/12, localhost, *.local, captive.apple.com, e.crashlynatics.com
# 配置了该参数，那么所配置的这些IP段、域名就会不交给Loon来处理，系统直接处理
bypass-tun = 10.0.0.0/8, 100.64.0.0/10, 127.0.0.0/8, 169.254.0.0/16, 172.16.0.0/12, 192.0.0.0/24, 192.0.2.0/24, 192.88.99.0/24, 192.168.0.0/16, 198.51.100.0/24, 203.0.113.0/24, 224.0.0.0/4, 239.255.255.250/32, 255.255.255.255/32
# 当切换到某一特定的WiFi下时改变Loon的流量模式，如"loon-wifi5g":DIRECT，表示在loon-wifi5g这个wifi网络下使用直连模式，"cellular":PROXY，表示在蜂窝网络下使用代理模式，"default":RULE，默认使用分流模式
ssid-trigger = "Ccccccc":DIRECT,"cellular":RULE,"default":RULE

[Proxy]

[Remote Proxy]

[Remote Filter]

[Proxy Group]

[Rule]

[Remote Rule]

[Rewrite]

[Host]

[Script]


[MITM]

{% endif %}

{% if request.target == "quan" %}

[SERVER]

[SOURCE]

[BACKUP-SERVER]

[SUSPEND-SSID]

[POLICY]

[DNS]
223.5.5.5
1.1.1.1
8.8.8.8

[REWRITE]

[URL-REJECTION]

[TCP]

[GLOBAL]

[HOST]

[STATE]
STATE,AUTO

[MITM]

{% endif %}

{% if request.target == "quanx" %}

[general]
excluded_routes=192.168.0.0/16, 172.16.0.0/12, 100.64.0.0/10, 10.0.0.0/8
geo_location_checker=http://ip-api.com/json/?lang=zh-CN, https://github.com/KOP-XIAO/QuantumultX/raw/master/Scripts/IP_API.js
network_check_url=http://www.baidu.com/
server_check_url=http://www.gstatic.com/generate_204

[dns]
server=223.5.5.5
server=1.0.0.1
server=8.8.8.8

[policy]

[server_remote]

[filter_remote]

[rewrite_remote]

[server_local]

[filter_local]

[rewrite_local]

[mitm]

{% endif %}

{% if request.target == "mellow" %}

[Endpoint]
DIRECT, builtin, freedom, domainStrategy=UseIP
REJECT, builtin, blackhole
Dns-Out, builtin, dns

[Routing]
domainStrategy = IPIfNonMatch

[Dns]

[DnsServer]
localhost
223.5.5.5
1.1.1.1
8.8.8.8, 53, Remote
8.8.4.4

[DnsRule]
DOMAIN-KEYWORD, geosite:geolocation-!cn, Remote
DOMAIN-SUFFIX, google.com, Remote

[DnsHost]
doubleclick.net = 127.0.0.1

[Log]
loglevel = warning

{% endif %}

{% if request.target == "surfboard" %}

[General]
loglevel = notify
interface = 127.0.0.1
skip-proxy = 127.0.0.1, 192.168.0.0/16, 10.0.0.0/8, 172.16.0.0/12, 100.64.0.0/10, localhost, *.local
ipv6 = false
dns-server = 223.5.5.5, 1.1.1.1, 8.8.8.8
exclude-simple-hostnames = true
enhanced-mode-by-rule = true

{% endif %}

{% if request.target == "sssub" %}

{
  "route": "bypass-lan-china",
  "remote_dns": "dns.google",
  "ipv6": false,
  "metered": false,
  "proxy_apps": {
    "enabled": false,
    "bypass": true,
    "android_list": [
      "com.eg.android.AlipayGphone",
      "com.wudaokou.hippo",
      "com.zhihu.android"
    ]
  },
  "udpdns": false
}

{% endif %}