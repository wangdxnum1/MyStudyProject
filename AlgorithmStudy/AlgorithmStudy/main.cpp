//
//  main.cpp
//  AlgorithmStudy
//
//  Created by HaKim on 17/2/5.
//  Copyright © 2017年 haKim. All rights reserved.
//

#include <iostream>

void insertSort1(int array[], int length);

void insertSort2(int a[], int n);

void shellSort(int array[], int length);

void printArray(int array[], int length);

int main(int argc, const char * argv[]) {
    // insert code here...
    int array[] = {99,4,35,12,78,90,33,46,59,25};
    int length = sizeof(array) / sizeof(array[0]);
    
//    insertSort1(array, length);
//    insertSort2(array, length);
    shellSort(array,length);
    
    printArray(array, length);
    
    return 0;
}

void insertSort1(int l[], int n){
    if(l == nullptr) return;
    if(n == 0 || n == 1) return;
    
    for (int i = 1; i < n; ++i) {
        int j = 0;
        for (j = i; j > 0; --j) {
            if(l[j - 1] <= l[i])
                break;
        }
        
        if(j != i){
            int temp = l[i];
            
            int k = i -1;
            for (; k >= j; --k) {
                l[k + 1] = l[k];
            }
            l[j] = temp;
        }
    }
}

void insertSort2(int a[], int n){
    if(a == nullptr) return;
    if(n == 0 || n == 1) return;
    
    for (int i = 1; i < n; ++i) {
        int temp = a[i];
        int j = 0;
        for (j = i; j > 0 && temp < a[j - 1]; --j) {
            a[j] = a[j - 1];
        }
        if(j != i){
            a[j] = temp;
        }
    }
}

void shellSort(int array[], int length){
    int gap = 0;
    for (gap = length / 2; gap > 0; gap /= 2) {
        for (int i = gap; i < length; ++i) {
            int temp = array[i];
            int j = 0;
            for (j = i; j > 0 && temp < array[j - gap]; j -= gap) {
                array[j] = array[j - gap];
            }
            if(j != i){
                array[j] = temp;
            }
        }
    }
}

void printArray(int array[], int length){
    for (int i = 0; i < length; ++i) {
        std::cout<<array[i]<<"  ";
    }
    
    std::cout << std::endl;
}
