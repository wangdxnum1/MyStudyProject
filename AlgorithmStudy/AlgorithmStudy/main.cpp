//
//  main.cpp
//  AlgorithmStudy
//
//  Created by HaKim on 17/2/5.
//  Copyright © 2017年 haKim. All rights reserved.
//

#include <iostream>

void bubbleSort(int array[], int length);
void selectSort(int array[], int length);
void insertSort1(int array[], int length);

void insertSort2(int a[], int n);

void shellSort(int array[], int length);

void quickSort(int array[], int length);

void mergeSort(int array[], int length);

void heapSort(int array[], int length);

void p_HeapAdjust(int array[], int parent, int length);

void p_mergeSort(int array[],int l,int r);
void mergeArray(int a[],int first, int mid, int last);

void p_quickSort(int a[], int l, int r);

void printArray(int array[], int length);

int *g_array = nullptr;

int main(int argc, const char * argv[]) {
    // insert code here...
    int array[] = {99,4,35,12,78,90,33,46,59,25};
    
    int array2[] =  { 1, 3, 4, 5, 2, 6, 9, 7, 8, 0 } ;
    int length = sizeof(array) / sizeof(array[0]);
    
    g_array = new int[512];
    
//    selectSort(array, length);
//    bubbleSort(array, length);
    
//    insertSort1(array, length);
//    insertSort2(array, length);
//    shellSort(array,length);
    
//    mergeSort(array, length);
//    quickSort(array, length);
    
    heapSort(array2, length);
    printArray(array, length);
    
    printArray(array2, length);
    
    return 0;
}

void bubbleSort(int a[], int length){
    for (int i = 0; i < length - 1; ++i) {
        bool ordered = true;
        for (int j = 0; j < length - 1 -i; ++j) {
            if(a[j] > a[j + 1]){
                int temp = a[j];
                a[j] = a[j + 1];
                a[j + 1] = temp;
                ordered = false;
            }
        }
        if(ordered){
            break;
        }
    }
}

void selectSort(int a[], int length){
    for (int i = 0; i < length - 1; ++i) {
        int minIndex = i;
        for (int j = i + 1; j < length; ++j) {
            if(a[minIndex] > a[j]){
                minIndex = j;
            }
        }
        if(minIndex != i){
            int temp = a[i];
            a[i] = a[minIndex];
            a[minIndex] = temp;
        }
    }
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

void quickSort(int array[], int length){
    p_quickSort(array, 0, length - 1);
}

void heapSort(int array[], int length){
    // 先构建最大推
    for (int i = length / 2; i >=0; --i) {
        p_HeapAdjust(array, i, length);
    }
    
    // 开始排序，把根节点放到最后
    for (int i = length - 1; i > 0; --i) {
        int temp = array[0];
        array[0] = array[i];
        array[i] = temp;
        
        // 重新调整最大堆
        p_HeapAdjust(array, 0, i);
    }
}

void p_HeapAdjust(int array[], int parent, int length){
    int child = 2 * parent + 1;
    
    int oldParent = parent;
    int temp = array[parent];
    
    while(child < length){
        int rchild = child + 1;
        // 右节点存在，假如比左节点大，则取右节点
        if(rchild < length && array[rchild] > array[child]){
            ++child;
        }
        
        // parent 节点比 子节点大，则直接退出
        if(temp > array[child]){
            break;
        }
        
        array[parent] = array[child];
        
        parent = child;
        child = parent * 2 +1;
    }
    
    if(parent != oldParent){
        array[parent] = temp;
    }
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

void p_quickSort(int a[], int l, int r){
    if(l < r){
        int i = l;
        int j = r;
        int p = a[l];
        
        while (i < j) {
            while (i < j && a[j] >= p) {
                --j;
            }
            if(i < j){
                a[i++] = a[j];
            }
            
            while (i < j && a[i] <= p) {
                ++i;
            }
            
            if(i < j){
                a[j--] = a[i];
            }
        }
        
        a[i] = p;
        p_quickSort(a, l, i - 1);
        p_quickSort(a, i + 1, r);
//        if(i -1 > l){
//            p_quickSort(a, l, i - 1);
//        }
//        
//        if(r > i + 1){
//            p_quickSort(a, i + 1, r);
//        }
    }
}

void printArray(int array[], int length){
    for (int i = 0; i < length; ++i) {
        std::cout<<array[i]<<"  ";
    }
    
    std::cout << std::endl;
}
