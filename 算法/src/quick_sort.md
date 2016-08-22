# 快速排序

在未排序序列中随便选一个中间值，然后把数组分成三块，
一块是比这个中间值小的序列，
一块是这个中间值，
一块是比这个中间值大的序列，
然后把其中长度大于 2 的序列再重复以上操作直到排序完毕。
平均时间复杂度在最差情况下的代价是 n^2，平均情况下是 nlogn。

```python
def quick(xs):
    def _partition(low, high):
        key = xs[low]
        while low < high:
            while low < high and key <= xs[high]:
                high -= 1
            if low < high:
                xs[low] = xs[high]
            while low < high and key > xs[low]:
                low += 1
            if low < high:
                xs[high] = xs[low]
        xs[low] = key
        return low
    def _sort(low,high):
        if low < high:
            pos = _partition(low,high)
            _sort(low,pos)
            _sort(pos+1, high)
    _sort(0, len(xs)-1)
```
