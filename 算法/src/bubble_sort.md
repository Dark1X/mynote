# 冒泡排序

重复走访要排序的数列，
每一次走访中，要求最大的数跑到数列的末尾，
走访中，一次比较两个元素，如果他们的顺序错误就把他们交换过来，就像冒泡一样，
这种方法就叫冒泡排序（bubble sort）。
平均时间复杂度均为 O(n^2)。

```python
def bubble(xs):
    for i in range(len(xs)):
        for j in range(len(xs)-1-i):
            if xs[j] > xs[j+1]:
                xs[j], xs[j+1] = xs[j+1], xs[j]
```
