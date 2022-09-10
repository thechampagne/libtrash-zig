// Copyright (c) 2022 XXIV
// 
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
// 
// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.
// 
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.
extern "C" fn trash_delete(path: [*c]const u8) c_int;

extern "C" fn trash_delete_all(paths: [*c]const [*c]const u8, length: usize) c_int;

pub const Error = error{
    Failure
};

/// Delete a file.
/// 
/// Example:
/// * *
/// const lib = @import("trash");
/// 
/// pub fn main() !void {
///     try lib.trashDelete("test_file");
/// }
/// * *
/// 
/// @param path
/// @return Error
pub fn trashDelete(path: []const u8) Error!void {
    const is_err = trash_delete(path.ptr);
    if (is_err != 0) {
        return Error.Failure;
    }
}

/// Delete multiple files.
/// 
/// Example:
/// * *
/// const lib = @import("trash");
/// 
/// pub fn main() !void {
///     try lib.trashDeleteAll(&[_][]const u8{"test_file"});
/// }
/// * *
/// 
/// @param paths
/// @return Error
pub fn trashDeleteAll(paths: []const []const u8) Error!void {
    const is_err = trash_delete_all(@ptrCast([*c]const [*c]const u8, paths), paths.len);
    if (is_err != 0) {
        return Error.Failure;
    }
}

test "trashDelete" {
    try trashDelete("test_file");
}

test "trashDeleteAll" {
    try trashDeleteAll(&[_][]const u8{"test_file"});
}