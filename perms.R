# install.packages("jiebaR")
library(jiebaR)

fileName <- "training.txt"

SC <- readChar(fileName, file.info(fileName)$size)

# 分词
cc = worker()

analysis <- as.data.frame(table(cc[SC]))

# 重新排序
analysis <- analysis[order(-analysis$Freq),]

# 简单改变一下文件的命名、格式
names(analysis) <- c("word","freq")
analysis$word <- as.character(analysis$word)

# 定义词牌 ，李白的《清平乐·画堂晨起》作为范例
#cipai <- "画堂晨起，来报雪花坠。高卷帘栊看佳瑞，皓色远迷庭砌。盛气光引炉烟，素草寒生玉佩。应是天仙狂醉，乱把白云揉碎。"
cipai <- "画堂晨起，来报雪花坠。高卷帘栊 看 佳瑞，皓色远 迷 庭砌。盛气光引 炉烟，素草寒生玉佩。应是天仙狂醉，乱把白云揉碎。"

# 对词牌进行分词后，再分析一下各部分的词性
tagger <- worker("tag")
cipai_2 <- tagger <= cipai

example <- subset(analysis, freq >1 & nchar(word) <3 & freq < 300)

# 提取词性文件
cixing <- attributes(cipai_2)$names

# 将素材库进行词性分类
example_2 <- tagger <= example$word

# 写诗算法
# 从范本词牌的第一个词开始，随机在素材库中选取词性相同，字数相等的单词，填入提前设置好的空白字符串中。
# 举个例子，原诗的第一个词是『画堂』，是个二字的名词。那么，我就在素材库中随机选择一个二字的名词，填入这个空间中
write_perms <- function(m){
  set.seed(m)
  empty <- ""
  for (i in 1:length(cipai_2)){
    temp_file <- example_2[attributes(example_2)$name == cixing[i]]
    temp_file <- temp_file[nchar(temp_file) == nchar(cipai_2[i])]
    empty <- paste0(empty, sample(temp_file,1))
  }

  result <- paste0(substr(empty, 1,4), ",", substr(empty,5,9),"。",
                   substr(empty, 10,16), ",", substr(empty, 17,22),"。",
                   substr(empty, 23,28), ",", substr(empty, 29,34),"。",
                   substr(empty, 35,40), ",", substr(empty, 41,46),"。")

}

# 输出诗词1-10首
lapply(1:10,write_perms)
