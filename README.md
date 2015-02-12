# RacoonString
Make Swift String type more powerful.

## Installation

Copy all files in RacoonString to your project.

The `countElements()` is rename to `count()` in Swift 1.2, if use previous version Xcode, please rename all `count()` to `countElements()`

## How to use

var string = "Hello RacoonString. :)"

### length

```
// Get length of string
string.length() // return 22
```

### Match by string

```
// Return range of this string if exist
string.match("Racoon") // return 6..<12
```

### Match by regex

```
if let regex = "(Rac)oon".regex() {
    string.match(regex) // return [["Racoon", "Rac"]]
}
```

### Substring by range

```
string[1..<3] // return "el"
```

### split

```
string.splitBy(" ") // return ["Hello", "RacoonString", ":)"]
```

### sub by string

```
string.sub(" ", ",") // return "Hello,RacoonString.,:)"
```

### sub by range

```
string.sub(0..<5, "Hi") // return "Hi RacoonString. :)"
```

### trim

```
var str = "   Hello RacoonString. :) "
str.trim() // return "Hello RacoonString. :)"
```

### html escape

```
var str = "<a href=\"#\">Link</a>"
str.escape() // return "%3Ca%20href=%22%23%22%3ELink%3C/a%3E"
```

### html unescape

```
var str = "%3Ca%20href=%22%23%22%3ELink%3C/a%3E"
str.unescape() // return "<a href=\"#\">Link</a>"
```
