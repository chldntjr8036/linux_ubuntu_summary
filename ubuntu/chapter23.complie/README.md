# 23장 프로그램 컴파일

***

## 왜 소프트웨어를 컴파일 해야 하나?

* **가용성** : 배포판 저장소에 있는 다수의 사용자 프로그램이 많지만, 어떤 배포판은 사용자가 원하는 모든 프로그램을 가지고
있지 않을 수도 있다. 이런 경우 소스로부터 컴파일해 프로그램을 만든다.
* **적시성** : 어떤 배포판은 최신의 버전들을 가지고 있지 않은 경우도 많다. 이 경우에 컴파일은 필수적이다.

***

## 컴파일링이란? 

* 소스코드를 컴퓨터 프로세서의 언어로 번역하는 절차다.

* 컴퓨터 프로세서(또는 CPU)는 기계어로 프로그램들을 실행한다. 이 명령들은 이진법으로 표현되며 사람이 읽기에는 불편하다.
이를 해결하기 위해 **어셈블리어**가 나왔다. 숫자코드를 대신하기 위해 CPY(copy), MOVE(move)와 같은 연상기호를 사용했다.
어셈블리어로 짜인 프로그램들은 **어셈블러**라는 프로그램에 의해 기계어로 처리된다.

* 이 다음으로 나타난 건 고급 프로그래밍 언어다(C와 C++등). 고급 프로그래밍 언어로 작성된 프로그램은 **컴파일러**라고 하는 
프로그램에 의해 처리되어 기계어로 변환된다.

***

## C 프로그램 컴파일 하기

### 1. 먼저 C 컴파일러의 설치여부를 알아보자.
```
cws@cws-ubuntu:~$ which gcc
/usr/bin/gcc
```
(설치되지 않았다면 sudo apt-get install gcc로 설치 가능.)

### 2. 소스 코드 구하기

* 이 예제에선 diction이라는 GNU 프로젝트로부터 프로그램을 컴파일한다.

* 홈 경로에 src폴더를 생성하고 이동한다.
```
$ mkdir src
cd src
```
* ftp 명령어를 이용해 ftp.gnu.org에 접속한다.
```
ftp> cws@cws-ubuntu:~$ ftp ftp.gnu.org
Connected to ftp.gnu.org.
220 GNU FTP server ready.
Name (ftp.gnu.org:cws): anonymous
230-NOTICE (Updated October 13 2017):
230-
230-Because of security concerns with plaintext protocols, we still
230-intend to disable the FTP protocol for downloads on this server
230-(downloads would still be available over HTTP and HTTPS), but we
230-will not be doing it on November 1, 2017, as previously announced
230-here. We will be sharing our reasons and offering a chance to
230-comment on this issue soon; watch this space for details.
230-
230-If you maintain scripts used to access ftp.gnu.org over FTP,
230-we strongly encourage you to change them to use HTTPS instead.
230-
230----
230-
230-Due to U.S. Export Regulations, all cryptographic software on this
230-site is subject to the following legal notice:
230-
230-    This site includes publicly available encryption source code
230-    which, together with object code resulting from the compiling of
230-    publicly available source code, may be exported from the United
230-    States under License Exception "TSU" pursuant to 15 C.F.R. Section
230-    740.13(e).
230-
230-This legal notice applies to cryptographic software only. Please see
230-the Bureau of Industry and Security (www.bxa.doc.gov) for more
230-information about current U.S. regulations.
230 Login successful.
Remote system type is UNIX.
Using binary mode to transfer files.
```
브라우저에서 http://ftp.gnu.org/gnu/ 들어가보면 디렉토리 구조를 한눈에 볼 수 있다.


* gnu/diction 경로로 이동하고 diction의 최신 압축 버전을 다운 받는다.
```
ftp> cd gnu/diction
250 Directory successfully changed.
ftp> ls
200 PORT command successful. Consider using PASV.
150 Here comes the directory listing.
-rw-r--r--    1 3003     65534       68940 Aug 28  1998 diction-0.7.tar.gz
-rw-r--r--    1 3003     65534       90957 Mar 04  2002 diction-1.02.tar.gz
-rw-r--r--    1 3003     65534      141062 Sep 17  2007 diction-1.11.tar.gz
-rw-r--r--    1 3003     65534         189 Sep 17  2007 diction-1.11.tar.gz.sig
226 Directory send OK.
ftp> get diction-1.11.tar.gz
( 다운로드 메시지 중략)
ftp> bye
```

* tar파일의 다운로드가 끝나면 압축을 푼다
```
cws@cws-ubuntu:~/src$ tar xzf diction-1.11.tar.gz
cws@cws-ubuntu:~/src$ ls
diction-1.11  diction-1.11.tar.gz
```
(압축을 풀면 GNU 프로젝트에 속한 프로그램들은 README, INSTALL등과 같은 문서파일들을 제공한다.)
***

## 프로그램 빌드하기

* 대부분의 프로그램들은 다음 두 명령어로 빌드된다.
    1. ./configure
    2. make
    
* configure 프로그램은 소스 트리와 함께 제공된 쉘 스크립트이며 빌드 환경을 분석하는 역할을 한다. 대부분의 소스코드는
이식 가능하게 설계된다. 즉 유닉스형 시스템 중 하나 이상의 시스템에서 빌드할 수 있도록 설계된다는 것이다. 또한 configure는
필수적인 외부 툴과 컴포넌트가 설치되어 있는지를 검사한다.

* configure는 쉘이 일반적으로 예상하는 프로그램들의 위치에 있지 않기 때문에, 반드시 ./와 함께 명령어를 사용해야 한다.
이것은 해당 프로그램이 현재 작업 디렉토리에 있다는 것을 나타낸다.
```
cws@cws-ubuntu:~/src/diction-1.11$ ./configure
```


* configure는 소스 디렉토리에 몇 가지 새파일을 생성했다. 가장 중요한 것은 **Makefile**이다. 
***
### Makefile
* Makefile은 make프로그램이 정확히 어떻게 프로그램을 빌드하는지를 알려주는 설정 파일이다. 이 파일이 없다면 make명령은
실행될 수 없다.

```
# 메이크 파일 내에 타겟 파일과 의존 파일들
#{{{ dependencies
diction.o:      diction.c config.h getopt.h misc.h sentence.h
getopt.o:       getopt.c getopt.h getopt_int.h
getopt1.o:      getopt1.c getopt.h getopt_int.h
misc.o: misc.c config.h misc.h
sentence.o:     sentence.c config.h misc.h sentence.h
style.o:        style.c config.h getopt.h misc.h sentence.h
#}}}
```
***

* make 명령을 이용해 빌드.
```
cws@cws-ubuntu:~/src/diction-1.11$ make
```

* make로 빌드 후에 타겟 파일을 지워도 다시 make명령을 실행하면 다시 빌드된다.

***

## 프로그램 설치하기
* 잘 패키징된 소스 코드는 install이라 부르는 특별한 make 타겟을 가지고 있다. 이 타겟은 시스템 디렉토리에 최종 사용 제품을
설치한다.
```
cws@cws-ubuntu:~/src/diction-1.11$ sudo make install
```







