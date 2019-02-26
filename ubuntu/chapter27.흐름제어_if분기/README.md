# 27장 쉘 스크립팅 : if
***

## if의 사용법

**if command; then commands
\[elif commands; then commands...\]
\[else commands \]
fi** 
위의 형태로 쓰인다.

***

## test의 사용

* if 명령어와 가장 흔하게 사용되는 명령어는 test 명령어다. test 명령어로 다양한 검사와 비교 작업을
수행할 수 있는데 두 가지 형태로 쓰인다.
        **test expression** 과 **\[expression\]** 이다.
* expression에는 명령어 성공 여부를 검사하는 표현식이 들어간다.      
* test 명령어는 이 표현식이 참이면 0, 거짓이면 1의 종료 상태값을 반환한다.

* test 명령어는 정수,문자열,파일 타입에 표현식을 제공한다. **man test** 명령을 통해 알 수 있다.
 
## 현대식 테스트

* bash의 최신 버전에는 test의 역할을 대신하는 합성 명령어를 지원한다. **\[\[expression\]\]** 이다.
```
cws@cws-ubuntu:~$ if [[ a == b ]]; then echo 1; else echo 2; fi 
2
cws@cws-ubuntu:~$ if [[ a != b ]]; then echo 1; else echo 2; fi 
1

```
* expression에는 참/거짓을 판단하는 표현식을 입력한다. 이 명령은 test의 모든 표현식을 지원한다.
그리고 중요한 새 문자열 표현식이 추가된다.                
    **string1 =~regex**
```
cws@cws-ubuntu:~$ if [[ abd =~ ^a+ ]]; then echo 0; else echo 2; fi
0
cws@cws-ubuntu:~$ if [[ bbd =~ ^a+ ]]; then echo 0; else echo 2; fi
2

```



* (())는 정수에 대한 연산을 더 편하게 해준다. 이 안에서 모든 산술 연산이 가능하다.
```
cws@cws-ubuntu:~$ if (( 1 != 2 )); then echo 1; else echo 2; fi 
1
cws@cws-ubuntu:~$ if (( 1 == 2 )); then echo 1; else echo 2; fi 
2

```