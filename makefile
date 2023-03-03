libnativetest.so: native_test.c
	gcc -g -m32 -fPIC -shared -o $@ -I . -I /home/zhh/study/openjdk/jdk/src/share/javavm/export/ -I /home/zhh/study/openjdk/jdk/src/solaris/javavm/export/ $^
.PHONY: run
run:
	~/study/jdk/bin/javac com/zhh/test/jdk/*.java
	~/study/jdk/bin/java -cp . com.zhh.test.jdk.HelloWorld
#jdb -attach localhost:10000
#makefile里的规则命令是以这种方式执行的：/bin/sh -c
#zhh         6736    6735  0 15:22 pts/33   00:00:00 /bin/sh -c ~/study/jdk/bin/java \ -agentlib:jdwp=transport=dt_socket,server=y,suspend=y,address=10000 \ -cp . \ com.zhh.test.jdk.HelloWorld
debug_server:
	~/study/jdk/bin/java \
	-agentlib:jdwp=transport=dt_socket,server=y,suspend=y,address=10000 \
	-cp . \
	com.zhh.test.jdk.HelloWorld
#不知道为什么报错，jdb -attach localhost:10000不报错
#~/study/jdk/bin/java \
#-agentlib:jdwp=transport=dt_socket,server=n,address=192.168.0.103:10000 \
#-cp . \
#com.zhh.test.jdk.HelloWorld
#ERROR: transport error 202: handshake failed - connection prematurally closed
#ERROR: JDWP Transport dt_socket failed to initialize, TRANSPORT_INIT(510)
#JDWP exit error AGENT_ERROR_TRANSPORT_INIT(197): No transports initialized [debugInit.c:750]
#FATAL ERROR in native method: JDWP No transports initialized, jvmtiError=AGENT_ERROR_TRANSPORT_INIT(197)
#Current thread is 4137667392
#Dumping core ...
#Aborted (core dumped)
#make: *** [makefile:15：debug_client] 错误 134
debug_client:
	~/study/jdk/bin/java \
	-agentlib:jdwp=transport=dt_socket,server=n,address=192.168.0.103:10000 \
	-cp . \
	com.zhh.test.jdk.HelloWorld