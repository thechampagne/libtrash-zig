# libtrash-zig

[![](https://img.shields.io/github/v/tag/thechampagne/libtrash-zig?label=version)](https://github.com/thechampagne/libtrash-zig/releases/latest) [![](https://img.shields.io/github/license/thechampagne/libtrash-zig)](https://github.com/thechampagne/libtrash-zig/blob/main/LICENSE)

Zig binding for **libtrash**.

### API

```zig
fn trashDelete(path: []const u8) Error!void;

fn trashDeleteAll(paths: []const []const u8) Error!void;
```

### References
 - [libtrash](https://github.com/thechampagne/libtrash)

### License

This repo is released under the [MIT](https://github.com/thechampagne/libtrash-zig/blob/main/LICENSE).