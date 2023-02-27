package com.zhh.test.jdk;

public class HelloWorld {
    public static void main(String[] args) {
        System.out.println(HelloWorld.class.getName());
        System.out.println(NativeTest.sum(100));
    }
}