# win10配置games101作业8的VS环境

## 配置VS2019环境

1. 创建一个空的C++工程，我这里创建的工程名字为`Games101Work8`。

2. 把作业8里面给的两个文件夹`CGL`和`src`拷贝到项目中。

   <img src="https://zjd-notepic.oss-cn-shanghai.aliyuncs.com/notepic/image-20240114192636613.png" alt="image-20240114192636613" style="zoom:67%;" />

3. 进入CGL文件夹，并创建一个`build`文件夹。

   <img src="https://zjd-notepic.oss-cn-shanghai.aliyuncs.com/notepic/image-20240114192807988.png" alt="image-20240114192807988" style="zoom:67%;" />

4. 打开cmd，将路径切换刚刚创建到`build`文件夹下。输入命令 `cmake ..`（需要自行安装配置好cmake，并且在执行的过程中中可能会提示没有找到`FREETYPE_LIBRARY`和`FREETYPE_INCLUDE_DIRS`），执行成功后会在`build`文件夹下生成一个可编译的工程。我这里是生成的VS2019的工程。

<img src="https://zjd-notepic.oss-cn-shanghai.aliyuncs.com/notepic/image-20240114193121126.png" alt="image-20240114193121126" style="zoom:67%;" />

5. 如果出现没有找到`FREETYPE_LIBRARY`和`FREETYPE_INCLUDE_DIRS`的情况，就需要自己安装`Freetype`库。可以从[这里](https://sourceforge.net/projects/freetype/files/freetype2/)下载压缩包，我下载的版本是2.13.2，压缩包为`ft2132.zip`。下载解压后，进入`freetype-2.13.2\builds\windows\vc2010`目录下，打开`freetype.sln`工程，进行编译。编译完成后的`lib`和`dll`在`freetype-2.13.2\objs\x64\Debug`目录下。

<img src="https://zjd-notepic.oss-cn-shanghai.aliyuncs.com/notepic/image-20240114194119444.png" alt="image-20240114194119444" style="zoom:67%;" />

<img src="https://zjd-notepic.oss-cn-shanghai.aliyuncs.com/notepic/image-20240114194509376.png" alt="image-20240114194509376" style="zoom:67%;" />

6. 打开作业8工程的CGL文件夹下的`CMakeLists.txt`，添加如下两行代码，`FREETYPE_LIBRARY`路径是刚刚生成的`freetype.lib`文件的路径，`FREETYPE_INCLUDE_DIRS`则是`Freetype`头文件所在的路径。

```
// 修改路径为自己的freetype路径
set(FREETYPE_LIBRARY "D:/APP/CPPOpenSouceLib/freetype-2.13.2/objs/x64/Debug")
set(FREETYPE_INCLUDE_DIRS "D:/APP/CPPOpenSouceLib/freetype-2.13.2/include")
```

<img src="https://zjd-notepic.oss-cn-shanghai.aliyuncs.com/notepic/image-20240114195038634.png" alt="image-20240114195038634" style="zoom:80%;" />

7. 回到`CGL\build`路径下，将刚刚生成失败的时候产生的文件全部删除掉，重新执行 `cmake ..`。此时应该会正常生成一个VS工程。

<img src="https://zjd-notepic.oss-cn-shanghai.aliyuncs.com/notepic/image-20240114204901491.png" alt="image-20240114204901491" style="zoom: 67%;" />

<img src="https://zjd-notepic.oss-cn-shanghai.aliyuncs.com/notepic/image-20240114204928770.png" alt="image-20240114204928770" style="zoom:67%;" />

8. 打开在`CGL\build`文件夹中生成`CGL.sln`。将 `osdfont.c`文件后缀修改为`osdfont.h`，若不修改会在编译的时候出现C1060：编译器堆内存不足的报错（我试过把虚拟内存增大，但还是会占满所有内存）。修改之后同时需要把`osdtext.h`文件中的`extern "C" char osdfont_base64[];`代码注释掉，并加上`#include "osdfont.h"`。

   <img src="https://zjd-notepic.oss-cn-shanghai.aliyuncs.com/notepic/image-20240114205510776.png" alt="image-20240114205510776" style="zoom:50%;" />

9. 右键`CGL`工程点击`属性`，然后 `配置属性` -> `C/C++` -> `预处理器` -> `预处理器定义` ，添加`_USE_MATH_DEFINES`和`GLEW_STATIC`，最后点击菜单栏 `生成` -> `生成解决方案`。这样就把CGL编译好了。
   - `_USE_MATH_DEFINES`：需要使用到了M_PI等定义，只有定义了该宏才可用。
   - `GLEW_STATIC`：编译glew需要打开该宏，否则当使用CGL.lib的时候，引用glew库会出现LNK2019:无法解析的外部符号。

<img src="https://zjd-notepic.oss-cn-shanghai.aliyuncs.com/notepic/image-20240114205732783.png" alt="image-20240114205732783" style="zoom: 67%;" />

<img src="https://zjd-notepic.oss-cn-shanghai.aliyuncs.com/notepic/image-20240114210556318.png" alt="image-20240114210556318" style="zoom:67%;" />

10. 打开作业8的工程，然后将作业`src`目录的代码包括在项目中。

<img src="https://zjd-notepic.oss-cn-shanghai.aliyuncs.com/notepic/image-20240114212153985.png" alt="image-20240114212153985" style="zoom:67%;" />

11. `#include <unistd.h>`报错的问题可参考这篇博客：[vs19下无法找到unistd.h头文件](https://blog.csdn.net/m0_54244623/article/details/120810288)

12. `getopt`未定义问题可参考这篇博客[getopt未定义问题](https://blog.csdn.net/halluca/article/details/104898522)。

13. 由于用了`M_PI`、`PI_OVER_2`等，所以在这个工程同样也需要右键`Games101Work8`工程点击`属性`，然后 `配置属性` -> `C/C++` -> `预处理器` -> `预处理器定义` ，添加`_USE_MATH_DEFINES`。

<img src="https://zjd-notepic.oss-cn-shanghai.aliyuncs.com/notepic/image-20240114220504624.png" alt="image-20240114220504624" style="zoom:67%;" />

14. 接下来配置`VC++目录`下的 `包含目录`和`库目录`。

<img src="https://zjd-notepic.oss-cn-shanghai.aliyuncs.com/notepic/image-20240114220618951.png" alt="image-20240114220618951" style="zoom:67%;" />

15. 首先编辑包含目录，需要添加`freetype`目录下面的`include`文件夹，以及CGL目录下面的`include`文件夹。

<img src="https://zjd-notepic.oss-cn-shanghai.aliyuncs.com/notepic/image-20240114220716575.png" alt="image-20240114220716575" style="zoom:75%;" />

16. 然后编辑库目录，这里需要配置各个`.lib`文件所在的文件夹，分别需要添加`freetype.lib`、`glfw3.lib`、`CGL.lib`、`glew.lib`所在的目录。这里的路径看起来比较乱，需要仔细查看各个路径。

<img src="https://zjd-notepic.oss-cn-shanghai.aliyuncs.com/notepic/image-20240114220905629.png" alt="image-20240114220905629" style="zoom:75%;" />

17. 配置各个lib的名字，编辑 `链接器` -> `输入` -> `附加依赖项`，分别添加下面几个lib库（opengl32.lib为自带的，其他几个你都可以在上一步配置库目录的文件夹中能找到）。

```
freetype.lib
glew.lib
CGL.lib
glfw3.lib
opengl32.lib
```

<img src="https://zjd-notepic.oss-cn-shanghai.aliyuncs.com/notepic/image-20240114221224599.png" alt="image-20240114221224599" style="zoom:67%;" />

<img src="https://zjd-notepic.oss-cn-shanghai.aliyuncs.com/notepic/image-20240114221407956.png" alt="image-20240114221407956" style="zoom:67%;" />

18. 编辑 `配置属性` -> `调试`  -> `环境`，添加freetype的freetype.dll所在的路径，在上面的步骤中有提到过他的位置，他与freetype.lib在同一级目录下。注意一定要写成`path=你的路径`，不要有多余的空格。

```
path=D:\APP\CPPOpenSouceLib\freetype-2.13.2\objs\x64\Debug
```

<img src="https://zjd-notepic.oss-cn-shanghai.aliyuncs.com/notepic/image-20240114221811821.png" alt="image-20240114221811821" style="zoom:67%;" />

<img src="https://zjd-notepic.oss-cn-shanghai.aliyuncs.com/notepic/image-20240114222347479.png" alt="image-20240114222347479" style="zoom:67%;" />

20. 到这里就完成所有的配置了，点击生成解决方案并运行，没有任何报错运行出来就成功了。接下来就可以愉快的编写代码了。

<img src="https://zjd-notepic.oss-cn-shanghai.aliyuncs.com/notepic/image-20240114222700359.png" alt="image-20240114222700359" style="zoom:67%;" />

## VS2022一键自动配置（未验证）

我在配置环境的过程中看到一个VS2022的自动一键配置环境的仓库，但是由于我没有VS2022所以就懒得去折腾这个了，如果有VS2022可以看一下该仓库（不确定能否正确运行出来）。

GitHub仓库地址：[一键配置 GAMES101 作业框架及运行环境（含答案）](https://github.com/Hinageshi01/GAMES101-Premake)

# 参考

[关于opengl相关库GLFW与GLEW的问题](https://m.newsmth.net/article/Graphics/59406)

[无法链接glew的解决办法](https://blog.csdn.net/xiaoxiaoyusheng2012/article/details/50409472)

[基于 Visual Studio 2019的 OpenGL的安装和环境配置](https://blog.csdn.net/m0_51765016/article/details/119847923)

[getopt未定义问题](https://blog.csdn.net/halluca/article/details/104898522)

