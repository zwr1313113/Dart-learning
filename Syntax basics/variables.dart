void main() {
  int code = 200;
  print(describe(code));
}

String describe(int code) {
  return switch (code) {
    200 => 'Success',
    404 => 'Not Found',
    _ => 'Unknown', // 其他所有情况
  };
}
