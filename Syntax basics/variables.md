# Dart Variables

This document provides an overview of variables in Dart, including their types, declaration, and usage.

## What are Variables?
Variables are used to store data in memory, which can be accessed and manipulated throughout a program. In Dart, variables must be declared before they are used.

## Declaring Variables
Dart supports both explicitly typed and type-inferred variable declarations.

### Explicitly Typed Variables
You can specify the type of a variable explicitly:
```dart
int age = 25;
String name = 'John';
double height = 5.9;
bool isActive = true;
```

### Type Inference
Dart can infer the type of a variable using the `var` or `final` keywords:
```dart
var city = 'New York'; // Inferred as String
final country = 'USA'; // Inferred as String, cannot be reassigned
```

### `const` vs `final`
- `final`: A variable whose value is set once and cannot be changed.
- `const`: A compile-time constant.

Example:
```dart
final currentYear = 2023;
const pi = 3.14159;
```

## Null Safety
Dart enforces null safety, meaning variables cannot contain `null` unless explicitly declared as nullable:
```dart
int? nullableNumber = null; // Nullable variable
```

## Default Values
Uninitialized variables have a default value of `null` in Dart.

## Variable Scope
Variables can be declared at different scopes:
- **Global Scope**: Declared outside any function or class.
- **Local Scope**: Declared inside a function or block.

## Late variables
Dart有时检测不到变量被初始化，所以使用late关键字来声明变量。late关键字告诉编译器，变量将在未来被初始化。
常见情况是在分析顶级变量和实例变量时，dart不能确定变量是否被初始化。
```dart
String description;

void main() {
    description = 'This is a description.';
    print(description);
}

// maybe output error
// Error: Field 'description' should be initialized because its type 'String' doesn't allow null.
```
```dart
late String description;

void main() {
    description = 'fried chicken';
    print(description);
}

// output: fried chicken
```
使用场景：
1. Dart推断你可能不需要该变量，并且初始化开销较高
2. 当你初始化一个实例变量，它的初始化方法需要调用`this`

## final and const
final和const的共同点：  
被final和const定义的变量不能被修改，不能被重新赋值  
final和const的区别：
- final对象整体不可被修改，但内部元素可以修改
- const对象整体不可被修改，内部元素也**不能**被修改
```dart
final myList = [1, 2, 3];
myList = [4, 5, 6]; //❌
myList[0] = 4; //✅

const hisList = [1, 2, 3];
hisList = [4, 5, 6]; //❌
hisList[0] = 4; //❌
```  

## Wildcard variables
特殊的变量，用下划线`_`命名，这种变量不占用内存，也无法被引用。主要作用是
1. 忽略一些变量  
比如循环中的索引变量。
```dart
List<String> name = ['John', 'Mary', 'Bob'];
name.asMap().forEach((_, index) {
    print('Hello, ${name[index]}');
})
```
2. 满足语法要求  
例如switch 语句中，`_`表示其他所有情况，可以省略。
```dart
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
```

## Example
```dart
void main() {
    var name = 'Alice';
    int age = 30;
    final city = 'London';
    const pi = 3.14;

    print('Name: $name, Age: $age, City: $city, Pi: $pi');
}
```

## Best Practices
- Use `final` or `const` for variables that won't change.
- Use meaningful names for variables.
- Prefer type inference (`var`) for readability unless explicit typing is necessary.

For more details, refer to the [Dart Language Tour](https://dart.dev/guides/language/language-tour#variables).