# 计算机组成原理课程设计——MIPS五级流水处理器

[计算机组成原理课程设计——MIPS五级流水处理器](#计算机组成原理课程设计mips五级流水处理器)
  - [环境依赖](#环境依赖)
  - [目录结构描述](#目录结构描述)
  - [系统框图](#系统框图)

## 环境依赖
Modelsim 10.5b+
Quartus 18.1+
## 目录结构描述

├── Readme.md                   // help  
├── image                       // 图片  
├── initial                     // 存储器、寄存器初始化文件  
│   ├── mem_initia.txt          // rom初始化文件  
│   ├── ram_init.txt            // ram初始化文件  
│   └──  reg_init.txt           // 寄存器初始化文件  
├── RTL                         // RTL文件  
├── prj                         // Quartus工程文件  
└── work                        // Modelsim仿真文件  
## 系统框图

![](/image/CPU.png)