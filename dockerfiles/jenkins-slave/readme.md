### Expect 设置变量和读取环境变量
#### Expect 中设置变量跟 Bash 稍有不同

Bash
``` Bash
name=wxnacy
echo $name  # wxnacy
```
Expect
``` Expect
set name wxnacy
puts $name  # wxnacy
```
Bash
``` Bash
echo $HOME      # /Users/wxnacy
```
Expect
``` Expect
puts $env(HOME) # /Users/wxnacy
```
