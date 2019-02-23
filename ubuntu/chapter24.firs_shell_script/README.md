# 24장 첫 번째 쉘 스크립트
***

## 쉘 스크립트란?
* 명령어들이 나열되어 있는 파일. 쉘은 이 파일을 읽어서 마치 커맨드라인에 직접 명령어를 실행하는 것처럼 수행한다.
***
## 쉘 스크립트 작성 방법

* 쉘 스크립트를 만들고 성공적으로 실행하기 위한 세 가지 작업

1. **스크립트 작성하기** : 쉘 스크립트는 일반적인 텍스트 파일이다. 따라서 텍스트 편집기가 필요. ex) vim, gedit
2. **스크립트를 실행파일로 설정하기** : 시스템은 여러 이유들로 텍스트 파일들을 프로그램으로 처리하지 않는다. 따라서 스크립트 파일에
실행권한을 주어야 한다.
3. **쉘이 접근할 수 있는 장소에 저장** : 쉘은 경로명이 명시되어 있지 않아도 실행 가능한 파일들이 존재하는 특정 디렉토리를
자동으로 검색한다. 편의를 위해 이 디렉토리에 작업한 스크립트를 저장.
***

### 스크립트 파일 포맷
```
#!/bin/bash

# first script

echo 'Hello World!.'
```
라는 스크립트가 있다고 하자.

* \# : 뒤에 문자열은 주석이 된다.
* \#! : 이 문자열은 shebang이라고 하는 특별한 조합이다. 이는 뒤따라오는 스크립트를 실행하기 위한 인터프리터의 이름을 시스템에 알려준다.
모든 쉘 스크립트의 첫 줄에는 shebang이 반드시 포함되어야 한다. 

***
### 실행 퍼미션

* 다음으로 해야 할 일은 스크립트에 실행권한을 설정하는 것이다. chmod로 쉽게 설정 가능하다.
```
cws@cws-ubuntu:~$ ls -l hello 
-rw-r--r-- 1 cws cws 50  2월 21 11:47 hello
cws@cws-ubuntu:~$ chmod 755 hello 
cws@cws-ubuntu:~$ ls -l hello 
-rwxr-xr-x 1 cws cws 50  2월 21 11:47 hello
```
755로 설정해서 모든 사용자가 실행할 수 있도록 했다. 

***

### 스크립트 파일 저장 위치

퍼미션 설정을 하고 나면 스크립트를 시작할 수 있다.
```
cws@cws-ubuntu:~$ ./hello 
Hello World!.
```
스크립트를 실행하기 위해 스크립트명 앞에 정확한 경로명을 입력해 줘야 한다. 
**경로명에 상관없이 실행하기 싶다면 PATH변수에 포함되어 있는 경로에 스크립트를 위치시키거나 현재 경로를 PATH에 추가하면 된다.**

* PATH에 ~/bin 추가하기 
 1. mkdir명령어를 이용해 home에 bin폴더를 생성
 2. 홈에 위치한 .bashrc파일 마지막에 다음을 추가한다
 ```
 export PATH=~/bin:"$PATH"
 ```
 3. 터미널 재시작
 4. 실행해보면 경로에 상관없이 hello만으로 스크립트 실행 가능.
 ```
 cws@cws-ubuntu:~$ hello
 Hello World!.
 ```
 
* ~/bin 디렉토리는 개인적인 용도로 사용하려는 스크립트를 저장하기 적합하다. 
* 시스템의 모든 사용자가 접근 가능한 스크립트를 작성하는 경우에는 /usr/local/bin에 저장한다. 
* 시스템 관리자용 스크립트는 /usr/local/sbin 디렉토리에 저장.
* 대부분의 경우, 스크립트든 컴파일된 프로그램이든 시스템에서 사용되는 소프트웨어는 /bin, /usr/bin 디렉토리가 아닌
 /usr/local 디렉토리에 반드시 저장되어야 한다.