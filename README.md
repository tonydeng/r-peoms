# R Poems

尝试使用R来进行诗词创作

## 机器人作诗的可能性

![robot poems](https://pic2.zhimg.com/v2-30d3349e93dd0f86e273dffdb7a6c4c5_b.png)


基于著名的[无限猴子定理](https://zh.wikipedia.org/zh-hans/無限猴子定理)

> 哪怕是让一只猴子在打字机上随机地按键，只要按键的时间足够长，那么几乎必然能够打出任何特定的文字，甚至是莎士比亚的全套著作。

![Monkey typing](https://upload.wikimedia.org/wikipedia/commons/f/f1/Monkey-typing.jpg)

## 基本步骤

* 在语料库[corpus](https://github.com/rime-aca/corpus)中选择[一个语料库](https://raw.githubusercontent.com/rime-aca/corpus/master/宋詞三百首.txt)

* 加载文件

* 使用[jiebaR](https://www.r-project.org/nosvn/pandoc/jiebaR.html)进行[TF-IDF](https://zh.wikipedia.org/wiki/TF-IDF)（词频分析）


* 明确一个词牌名

> 画堂晨起，来报雪花坠。高卷帘栊看佳瑞，皓色远迷庭砌。盛气光引炉烟，素草寒生玉佩。应是天仙狂醉，乱把白云揉碎。

* 分辨词语的词性，参见[北大计算所词性标注集简表](http://www.cnblogs.com/finallyliuyu/p/3925186.html)

> n 是名词，v是动词， a是形容词
nr 人名 名词代码n和“人(ren)”的声母并在一起
p 介词 取英语介词prepositional的第1个字母
q 量词 取英语quantity的第1个字母
x 非语素字 非语素字只是一个符号，字母x通常用于代表未知数、符号

* 在词频库中，选取了至少出现过两次的一字或两字词语，作为诗词创作的素材库

* 定义诗词算法

PS：
可以使用[opencc](https://github.com/BYVoid/OpenCC) 简繁体转换，转换测试地址：http://opencc.byvoid.com 。R也有相应的包[ropencc](https://github.com/qinwf/ropencc),相关使用可以查看这篇文章：[ROPENCC - OPENCC 繁简转换 R 语言接口](http://cn.qinwenfeng.com/ropencc/)


项目创意和代码来源： [知叶堂](https://zhuanlan.zhihu.com/hallsofleaves)
