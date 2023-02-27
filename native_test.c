#include "com_zhh_test_jdk_NativeTest.h"

JNIEXPORT jint JNICALL Java_com_zhh_test_jdk_NativeTest_sum(JNIEnv * env, jclass jcls, jint n) {
    int sum = 0;
    for (int i = 0; i < n; ++i) {
        sum += i + 1;
    }
    return sum;
}