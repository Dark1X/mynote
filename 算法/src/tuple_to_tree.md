# tuple to tree

从一些关系元组构造树型关系结构：


```python
table = [
    { 'id': 0, 'parent_id': None, 'children': [] },
    { 'id': 1, 'parent_id': None, 'children': [] },
    { 'id': 2, 'parent_id': None, 'children': [] },
    { 'id': 3, 'parent_id': 0, 'children': [] },
    { 'id': 4, 'parent_id': 1, 'children': [] },
    { 'id': 5, 'parent_id': 2, 'children': [] },
    { 'id': 6, 'parent_id': 3, 'children': [] },
    { 'id': 7, 'parent_id': 3, 'children': [] },
    { 'id': 8, 'parent_id': 6, 'children': [] },
    { 'id': 9, 'parent_id': 4, 'children': [] },
]

root = []

for item in table:
    if item['parent_id'] is None:
        root.append(item)
    else:
        table[item['parent_id']]['children'].append(item)

```
