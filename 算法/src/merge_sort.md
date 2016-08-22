# 归并排序

把待排序序列分为若干个有序的子序列，再把有序的子序列合并为整体有序序列。
时间复杂度为 O(n*logn)。

```python
def merge(xs):
    def _merge(ys, left, right, middle):
        tmp = []
        i = left
        j = middle + 1
        while i <= middle and j <= right:
            if ys[i] < ys[j]:
                tmp.append(ys[i])
                i = i + 1
            else:
                tmp.append(ys[j])
                j = j + 1
        while i <= middle:
            tmp.append(ys[i])
            i = i + 1
        while j <= right:
            tmp.append(ys[j])
            j = j + 1
        ys[left:right+1] = tmp[:]
    def _sort(zs, left, right):
        if left < right:
            middle = (left + right) // 2
            _sort(zs, left, middle)
            _sort(zs, middle + 1, right)
            _merge(zs, left, right, middle)
    _sort(xs, 0, len(xs)-1)
```
