# xcodesnippet
*A command-line interface for installing Xcode Snippets*

## Installation

```
$ gem install xcodesnippet
```

## Usage

### Example

#### Sourcefile.swift

```swift
---
title: "Hello, World!"
summary: "Prints 'Hello World'"
completion-scopes:
  - CodeBlock
---

println("Hello, World!")
```

### Completion Scopes

#### Objective-C

* `ClassImplementation`
* `CodeExpression`
* `Preprocessor`
* `ClassInterfaceVariables`
* `All`
* `TopLevel`
* `ClassInterfaceMethods`
* `CodeBlock`
* `StringOrComment`

#### Swift

* `TopLevel`
* `ClassImplementation`
* `CodeBlock`
* `All`
* `CodeExpression`
* `StringOrComment`


### Terminal Command

```
$ xcodesnippet install path/to/source.m
```

---

## License

xcodesnippet is released under an MIT license. 
See LICENSE for more information.
