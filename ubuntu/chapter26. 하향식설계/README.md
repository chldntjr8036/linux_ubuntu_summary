# 26장 하향식 설계
***

## 쉘 함수 선언하기

* 두 가지 방법이 있다.
```
function name {
    commands
    return
}

name() {
    command
    return
}
```

* 쉘 함수는 호출되기 전에 항상 먼저 선언되어야 한다. 그리고 최소한 하나의 명령어를 포함하고 있어야 한다.
* 쉘 함수는 아주 훌륭한 별칭(alias)의 대체제다. 그리고 실제 개인적 용도로 사용하기 좋은 작은 명령들을 생성하기에
효과적인 방법이다.
## here문서

```
cat <<- _EOF_
		<h2>home space</h2>
		<pre>$(du -sh /home/*)</pre>
		_EOF_
```
* command << token
text 
token
형식으로 쓰인다
* 이 방식은 token ~ token 까지의 텍스트를 표준 입력으로 command에게 보낸다.
* << 바로 뒤에 -가 붙을 경우 텍스트 앞에 탭공백을 지운다.