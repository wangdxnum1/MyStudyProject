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

void mergeSort(int array[], int length);
void p_mergeSort(int array[],int l,int r);
void mergeArray(int a[],int first, int mid, int last);

void printArray(int array[], int length);

int *g_array = nullptr;

int main(int argc, const char * argv[]) {
    // insert code here...
    int array[] = {99,4,35,12,78,90,33,46,59,25};
    int length = sizeof(array) / sizeof(array[0]);
    
    g_array = new int[512];
    
//    insertSort1(array, length);
//    insertSort2(array, length);
//    shellSort(array,length);
    
    mergeSort(array, length);
    
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

void mergeSort(int array[], int length){
    p_mergeSort(array, 0, length - 1);
}

void p_mergeSort(int array[],int l,int r){
    if(l < r){
        int mid = (l + r) / 2;
        p_mergeSort(array, l, mid);
        p_mergeSort(array, mid + 1, r);
        mergeArray(array, l, mid, r);
    }
}

void mergeArray(int a[],int first, int mid, int last){
    int i = first;
    int j = mid + 1;
    
    int n = mid;
    int m = last;
    int k = 0;
    
    while (i <= n && j <= m) {
        if(a[i] < a[j]){
            g_array[k++] = a[i++];
        }else{
            g_array[k++] = a[j++];
        }
    }
    
    while (i <= n) {
        g_array[k++] = a[i++];
    }
    
    while (j <= m) {
        g_array[k++] = a[j++];
    }
    
    for (int i = 0; i < k; ++i) {
        a[first + i] = g_array[i];
    }
}

void printArray(int array[], int length){
    for (int i = 0; i < length; ++i) {
        std::cout<<array[i]<<"  ";
    }
    
    std::cout << std::endl;
}
