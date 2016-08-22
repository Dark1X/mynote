# 选择排序

首先，找到数组中最小元素，
其次，将它和数组的第一个元素交换位置（如果第一个元素就是最小元素那么它就和自己交换）。
再次，在剩下的元素中找到最小元素，将它和数组中的第二个元素交换位置。
如此往复，直到将整个数组排序。
这种排序方法叫选择排序（select sort）。

选择排序的数据移动是最少的，
平均时间复杂度均为 O(n^2)。

```python
def select(xs):
    for i in range(len(xs)-1):
        min = i
        for j in range(i+1, len(xs)):
            if xs[min] > xs[j]:
                min = j
        if min != i:
            xs[i], xs[min] = xs[min], xs[i]
```
