package com.zhh.test.jdk;

import java.lang.System;

public class NativeTest {
    static {
        System.load("/home/zhh/study/testjdk/libnativetest.so");
    }
    public static native int sum(int n);
}
