# Dart Operators
操作符优先级按下表从高到低排列
| Description               | Operator                                   | Associativity |
|---------------------------|-------------------------------------------|---------------|
| unary postfix             | `expr++` `expr--` `()` `[]` `?[]` `.` `?.` `!` | None          |
| unary prefix              | `-expr` `!expr` `~expr` `++expr` `--expr` `await expr` | None          |
| multiplicative            | `*` `/` `%` `~/`                          | Left          |
| additive                  | `+` `-`                                   | Left          |
| shift                     | `<<` `>>` `>>>`                           | Left          |
| bitwise AND               | `&`                                       | Left          |
| bitwise XOR               | `^`                                       | Left          |
| bitwise OR                | `|`                                       | Left          |
| relational and type test  | `>=` `>` `<=` `<` `as` `is` `is!`         | None          |
| equality                  | `==` `!=`                                 | None          |
| logical AND               | `&&`                                      | Left          |
## 1. Arithmetic Operators 算术运算符
Used to perform basic mathematical operations.

| Operator   | Description         | Example            |
|------------|---------------------|---------------     |
| `+`        | Addition            | `2 + 3 == 5`       |
| `-`        | Subtraction         | `2 - 3 == -1`      |
| `-` `expr` | 一元运算符，用于取反  | `int temp = 25; `<br>`print(-temp); //-25`|
| `*`        | Multiplication      | `2 * 3 == 6`       |
| `/`        | Division            | `5 / 2 == 2.5`     |
| `~/`       | Integer Division    | `5 ~/ 2 == 2`      |
| `%`        | Modulus (remainder) | `5 % 2 == 1`       |

前/后缀增/减运算符

| Operator    | Description                                     |
|-------------|-------------------------------------------------|
| `++` `var`  | `var = var + 1` (expression value is `var + 1`) |
| `var` `++`  | `var = var + 1` (expression value is `var`)     |
| `--` `var`  | `var = var - 1` (expression value is `var - 1`) |
| `var` `--`  | `var = var - 1` (expression value is `var`)     |
++var var自增1 表达式的值也自增1
var++ var自增1 表达式的值不变
```dart
void main() {
  var a = 1;
  var b = ++a;
  print(a == b); // true

  var a = 1;
  var b = a++;
  print(a == b); // false 
}
```

## 2. Relational (Comparison) Operators
Used to compare two values.

| Operator | Description       | Example       |
|----------|-------------------|---------------|
| `==`     | Equal to          | `a == b`      |
| `!=`     | Not equal to      | `a != b`      |
| `>`      | Greater than      | `a > b`       |
| `<`      | Less than         | `a < b`       |
| `>=`     | Greater than or equal to | `a >= b` |
| `<=`     | Less than or equal to | `a <= b` |
```dart
assert(null == null) //true
```
Dart中，有一些运算符实际上是一个方法，你甚至可以重写这个运算符的方法，See [Methods > Operators](https://dart.dev/language/methods#operators)  

## 3. Logical Operators
Used to combine multiple conditions.

| Operator | Description       | Example       |
|----------|-------------------|---------------|
| `&&`     | Logical AND       | `a && b`      |
| `\|\|`   | Logical OR        | `a \|\| b`    |
| `!`      | Logical NOT       | `!a`          |

## 4. Assignment Operators
Used to assign values to variables.

| Operator | Description       | Example       |
|----------|-------------------|---------------|
| `=`      | Assign            | `a = b`       |
| `+=`     | Add and assign    | `a += b`      |
| `-=`     | Subtract and assign | `a -= b`    |
| `*=`     | Multiply and assign | `a *= b`    |
| `/=`     | Divide and assign | `a /= b`      |
| `~/=`    | Integer divide and assign | `a ~/= b` |
| `%=`     | Modulus and assign | `a %= b`     |
### Notes:
- **??=**  
  如果你想在变量仅为null时赋值，可以使用`??=`操作符。  
  **Example:**  
  `b ??= value;` //如果b为null，则b等于value，否则b不变。  
- **赋值操作符可以和其他操作符结合使用:**  
  结合后的操作符运算方式如下：  
  `a` `op=` `b`  
  ***
  这等价于  
  `a` = `a op b`  
  ***
  **Example:**  
  `a += b` ⇔ `a = a + b`

## 5. Bitwise Operators
Operate on the binary representation of numbers.

| Operator | Description       | Example       |
|----------|-------------------|---------------|
| `&`      | Bitwise AND       | `a & b`       |
| `\|`     | Bitwise OR        | `a \| b`      |
| `^`      | Bitwise XOR       | `a ^ b`       |
| `~`      | Bitwise NOT       | `~a`          |
| `<<`     | Left shift        | `a << b`      |
| `>>`     | Right shift       | `a >> b`      |

## 6. Conditional Operator
Used for concise conditional expressions.

| Operator | Description       | Example         |
|----------|-------------------|-----------------|
| `? :`    | Ternary operator  | `a > b ? a : b` |

### Additional Notes:
- The `??` operator can also be considered a conditional operator.
  - **Syntax:** `expr1 ?? expr2`
  - **Behavior:** Returns `expr2` if `expr1` is `null`; otherwise, returns `expr1`.

### Example:
```dart
int? value1 = null;
int value2 = 10;

int result = value1 ?? value2; // result: 10
```

## 7. Null-aware Operators
Used to handle `null` values safely.

| Operator | Description       | Example       |
|----------|-------------------|---------------|
| `??`     | If null           | `a ?? b`      |
| `??=`    | Assign if null    | `a ??= b`     |
| `?.`     | Conditional member access | `a?.b` |

## 8. Type Test Operators
Used to check or cast types.

| Operator | Description       | Example       |
|----------|-------------------|---------------|
| `is`     | Type check        | `a is String` |
| `is!`    | Not of type       | `a is! int`   |
| `as`     | Type cast         | `a as String` |

`as`运算符将对象强制转换为特定类型，前提是你必须确定它是这个类型

```dart
class Person {
  String name;
  int age;
  Person(this.name, this.age);
}
void main() {
    var employee = Person('Bob', 22); 
    print((employee as Person).name);
}
```

> **⚠️ Notice**  
> 如果`employee`不是Person类型或是null，则`as`会抛出异常

## 9. Cascade notation
对object进行一系列操作

| Operator | Description       | Example       |
|----------|-------------------|---------------|
| `..`     | Cascade operator  | `object..method()` |

```dart
void main() {
    class Paint {
        String color;
        double strokeWidth;
        strokeCap
    }
    var paint = Paint()
      ..color = Colors.red
      ..strokeWidth = 5.0
      ..strokeCap = StrokeCap.round;
}
```

## 10. Other Operators
Miscellaneous operators in Dart.

| Operator | Description       | Example       |
|----------|-------------------|---------------|
| `()`     | Function call     | `myFunction()`|
| `[]`     | List access       | `myList[0]`   |
| `.`      | Member access     | `object.method` |
| `..`     | Cascade operator  | `object..method()` |

This is a quick overview of Dart operators. For more details, refer to the [Dart documentation](https://dart.dev/guides/language/language-tour#operators).