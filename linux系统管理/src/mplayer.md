# mplayer


## Example

用playlist听音乐

```
cd /path/to/music
find . -type f | grep -v playlist > playlist
mplayer -shuffle -playlist playlist
```
