# RacoonString
Make Swift String type more powerful.

## Installation

Copy all files in src to your project.

## How to use

var string = "Hello UniformString"

### length

```
// Get length of string
string.length() // return 19
```

### Match by string

```
// Return range of this string if exist
string.match("Uniform") // return 6..<13
```

### Match by regex

```
if let regex = "/(Uni)form/".regex() {
    string.match(regex) // return [["Uniform", "Uni"]]
}
```

### Substring by range

```
string[1..<3] // return "el"
```

### split

```
string.splitBy(" ") // return ["Hello", "UniformString"]
```

### sub by string

```
string.sub(" ", ",") // return "Hello,UniformString"
```

### sub by range

```
string.sub(0..<5, "Hi") // return "Hi UniformString"
```

### trim

```
var str = "   Hello UnifromString  "
str.trim() // return "Hello UniformString"
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
