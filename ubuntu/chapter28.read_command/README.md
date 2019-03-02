# read Command를 이용해서 입력 받기.
`출처 : https://www.computerhope.com/unix/bash/read.htm`
***


## read에 관해서
* read는 Bash shell에 내장된 커맨드로 표준 입력으로부터 한 줄의 라인을 읽는다.
그리고 구분자를 기준으로 단어를 나누기도 한다. 이 명령어의 출력은 입력으로서 사용될 수 있다.

* read는 보통 개행문자를 라인의 끝으로 인식하지만 -d 옵션을 이용해 바꿀 수 있다.

  
 
## 예제

```
cws@cws-ubuntu:~$ while read; do echo "$REPLY"; done
dd
dd
1  
1
asda
asda
```
read의 입력값을 저장할 변수명을 지정하지 않을 경우 REPLY에 값이 들어간다.
***
```
cws@cws-ubuntu:~$ while read text; do echo "$text"; done
aaa
aaa
bbbb
bbbb
```
위는 read 다음 변수명을 test로 지정해준 경우다.
***
```
cws@cws-ubuntu:~$ while read -ep "Type something: " -i "My text is " text; do 
>   echo "$text";
> done
Type something: My text is hello, world!
My text is hello, world!
Type something: My text is 
```
-e 옵션은 입력에 다른 옵션을 덧붙여서 수정할 수 있게 해준다.
-e와 -i를 같이 사용할 경우 먼저 삽입되는 문구를 정할 수 있다. 이 문구는 입력 라인에서 수정이 가능하다.
-p 옵션은 입력하는걸 도와줄 수 있는 문구를 프롬프트에 띄우기 위한 옵션이다.

***

```
cws@cws-ubuntu:~$ echo "one two three four" | while read -a wordarray; do
>   echo ${wordarray[1]}
> done
two
```
echo의 표준 출력을 whlie의 read에 전달했다.
-a name 은 name배열에 값을 저장한다. 
구분자 -> IFS(공백, 탭, 개행)