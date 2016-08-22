# 一致性 hash 分布算法

具体图文说明请见博文：[分布式系统中的哈希算法](http://fugangqiang.github.io/blog/post/web/分布式系统中的哈希算法.html)。

```python
#!/usr/bin/python

import hashlib

class HashRing(object):
    def __init__(self, nodes=None, replicas=3):
        self.replicas = replicas
        self.ring = dict()
        self._sorted_keys = []
        if nodes:
            for node in nodes:
                self.add_node(node)

    def add_node(self, node):
        for i in range(0, self.replicas):
            key = self.gen_key('%s:%s' % (node, i))
            self.ring[key] = node
            self._sorted_keys.append(key)
        self._sorted_keys.sort()

    def remove_node(self, node):
        for i in range(0, self.replicas):
            key = self.gen_key('%s:%s' % (node, i))
            del self.ring[key]
            self._sorted_keys.remove(key)

    def get_node(self, string_key):
        return self.get_node_pos(string_key)[0]

    def get_node_pos(self, string_key):
        if not self.ring:
            return None, None
        key = self.gen_key(string_key)
        nodes = self._sorted_keys
        for i in range(0, len(nodes)):
            node = nodes[i]
            if key <= node:
                return self.ring[node], i
        return self.ring[nodes[0]], 0

    def gen_key(self, key):
        m = hashlib.md5()
        m.update(key.encode())
        return int(m.hexdigest(), 16)

    def get_nodes(self, string_key):
        if not self.ring:
            yield None, None
        node, pos = self.get_node_pos(string_key)
        for key in self._sorted_keys[pos:]:
            yield self.ring[key]
        while True:
            for key in self._sorted_keys:
                yield self.ring[key]


if __name__ == '__main__':

    memcache_servers = ['192.168.0.246:11212',
                        '192.168.0.247:11212',
                        '192.168.0.249:11212']

    ring = HashRing(memcache_servers)
    server = ring.get_node('node_key')
    print(server)
```
