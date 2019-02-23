# 프로젝트 시작하기
***

```
#!/bin/bash

# Program to output a system infomation page

TITLE="System Information Report for $HOSTNAME"
CURRENT_TIME=$(date +"%x %r %Z")
TIME_STAMP="Generated $CURRENT_TIME,by $USER"
cat << _EOF_
echo "<html>

        <head>
                <TITLE>$TITLE</TITLE>
        </head>
         <body>
                <h1>$TITLE</h1>
                <p>$TIME_STAMP</p>
         </body>
</html>"
_EOF_
```

## 변수와 상수
* 변수를 어떻게 생성할까? 쉘이 변수를 만나면 자동으로 변수를 생성한다. 보통 프로그래밍 언어에서는 변수를 사용하기 전에 미리 선언하고
정의해야 한다는 점에 구별된다. 그래서 오타에 주의. 값이 없는 변수는 빈 값을 리턴하기 때문.(아마도 null이 아 빈 문자열인듯 하다.)

* 일반적으로 상수를 정의할 땐 대문자, 변수는 소문자로

* 정의한 변수를 **$변수명**으로 참조할 수 있다.

* 쉘은 변수에 할당되는 값의 데이터의 형식을 전혀 고려하지 않고 모두 **문자열**로 인식한다.

* 변수가 확장될 떄, 중괄호가 사용되기도 한다. 다음과 같이 변수명을 다른 문자열에 삽입해서 넣을 때, 유용하다. 
괄호는 안되고, 또 중괄호를 쓰지 않으면 filename1 이라는 변수명을 찾는다. filename1이 빈 값을 가지기 때문에 누락이라는 에러 발생.
```
cws@cws-ubuntu:~$ filename="a"
cws@cws-ubuntu:~$ touch $filename
cws@cws-ubuntu:~$ mv $filename ${filename}1 
cws@cws-ubuntu:~$ ls
IdeaProjects       glassfish3     sys_info_page.html  다운로드  음악
a1 <--             jwp-workspace  vmware              문서      템플릿
bin                playground     w3_html             바탕화면
eclipse            snap           webserver           비디오
eclipse-workspace  src            공개                사진
```

