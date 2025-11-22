## Learn
这是考试题，简洁回答，可举例，禁止比喻

我还没学并行理论，你的每行证明后面请附加一个符号解释 & 整行翻译，强互模拟之类的专有名词也要通俗或简洁解释（别比喻）

keep the answer simple. Don't answer a pile of trivial/irrelavent things 

## Coding
- Prioritize code correctness and clarity. Speed and efficiency are secondary priorities unless otherwise specified.
- Do not write organizational or comments that summarize the code. Comments should only be written in order to explain "why" the code is written in some way in the case there is a reason that is tricky / non-obvious.
- The code you added should be as simple as possible.

## python 通用编码标准
- 使用`typing`库把所有函数的输入变量类型和输出类型都显式声明。
- 所有的代码注释都使用英语。
- 尽量删除无用的debug用的注释代码（比如`print`等）。
- 使用`from loguru import logger` 来进行各种信息的输出和log。

### 文件规范
- 独立的工具脚本放入`scripts`目录下。
- 测试脚本放入`tests`目录下，如非必要，不用写非常复杂的独立测试脚本。
- 共享的工具函数库放入`utils`目录下。

## 坏毛病
- Deepseek:
- 不要阅读过多文件.
- 不要写过多文件，不要写重复功能的文件，由我执行命令行测试.
- 一个文件内仅改动需要改动的部分，不要重写整个文件.
- 如果没有要求你，你就不要创建 example 和 docs 之类的说明目录.
- Claude:
- 不要改动其他功能的代码，仅改动我要求添加/改动的功能.

