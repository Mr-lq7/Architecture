# Architecture

**体系结构实验**

指导书网址：https://hitsz-lab.gitee.io/computer-arch/lab1/part1/

**实验二PartA，实现一个直接相连的Cache**

根据所给的soc电路，在原有单周期cpu的基础上，实现三级流水。
取指（IF）+ 寄存器 译码（ID）+寄存器 执行（EX）,主要操作是增加寄存器

**实验二PartB，利用缓存机制优化矩阵加法运算**

在PartA的基础上，利用多路选择器对寄存器进行同步清零操作。（插入气泡）
