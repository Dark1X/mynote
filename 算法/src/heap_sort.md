# 堆排序

用一个数组来表示堆，
对于处在 i 位置的元素，2\*i+1 位置上的是其左孩子，2\*i+2 是其右孩子。

1. 通过调整数组建立最大堆；
1. 第一个元素为最大值，将第一个元素与最大堆对应数组的最后一个元素交换；
1. 最大堆长度减一，再重复以上步骤直至最大堆长度为 1。

平均时间复杂度为O(n*logn)。

```python
def heap(xs):
    def _max_heapify(xs, i, size):
        left = 2*i+1
        right = 2*i+2
        if left < size and xs[left] > xs[i]:
            largest = left
        else:
            largest = i
        if right < size and xs[right] > xs[largest]:
            largest = right
        if largest != i:
            xs[i], xs[largest] = xs[largest], xs[i]
            _max_heapify(xs, largest, size)
    def _build_max_heap(xs, size):
        for i in range((size-2)//2, -1, -1):
            _max_heapify(xs, i, size)
    def _sort(xs, size):
        _build_max_heap(xs, size)
        for i in range(size-1, -1, -1):
            xs[0], xs[i] = xs[i], xs[0]
            _max_heapify(xs, 0, i)
    _sort(xs, len(xs))
```
