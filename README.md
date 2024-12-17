# Fraction

A Swift package that implements fractions and simple operations like addition, subtraction, multiplication, and division.

---

## Installation

### Swift Package Manager
Add this to your `Package.swift`:

```swift
.package(url: "https://github.com/Abdulk-A/Fraction.git", from: "1.0.0")
```

Or add via Xcode: `File > Swift Packages > Add Package Dependency`.

---

## Methods and Operations
 + get_float()
 + get_whole_number()
 + gcd(a, b)
 + simplify(fraction)
 + addition (+) 
 + subtraction (-)
 + multiplication (*)
 + division (/)
 + equal to (==)
 + not equal to (!=)
 + greater than (>)
 + less than (<)
 + greater than or equal to (>=)
 + less than or equal to (<=)

## Examples

### Initialization
```swift
import Fraction

//initializes numer = 3, denom = 1 by default
let fraction1 = Fraction(3)

//initializes numer = 4, denom = 5
let fraction2 = Fraction(4,5)

```

### Addition
```swift
var fraction_add = fraction1 + fraction2 
//fraction_add = 19/5
```

### Subtraction
```swift
var fraction_sub = fraction1 + fraction2 
//fraction_sub = -11/5
```

### Multiplication
```swift
var fraction_mult = fraction1 * fraction2 
//fraction_mult = 12/5
```

### Division
```swift
var fraction_div = fraction1 * fraction2 
//fraction_div = 15/4
```

### Simplify
```swift
let fraction3 = Fraction(24,8)
let fraction_simp = Fraction.simplify(fraction3)
//fraction_simp = 3/1
```

### Whole Number
```swift
let fraction4 = Fraction(24,8)
let whole_number = fraction4.get_whole_number()
//whole_number = 3
```

### Float Number
```swift
let fraction4 = Fraction(25,8)
let whole_number = fraction4.get_float()
//whole_number = 3.125
```

### Greatest Common Divisor 
```swift
let val = Fraction.gcd(54,33)
//val = 3
```

### Equal to
```swift
let bool1 = Fraction(1,2) == Fraction(50,100) 
//bool1 = true
```

### Not Equal to
```swift
let bool2 = Fraction(1,2) != Fraction(50,100) 
//bool2 = false
```

### Greater Than
```swift
let bool3 = Fraction(3,5) > Fraction(4,7) 
//bool3 = true
```

### Greater Than or Equal to
```swift
let bool4 = Fraction(4,5) >= Fraction(16,20) 
//bool4 = true
```

### Less Than
```swift
let bool5 = Fraction(4,5) < Fraction(16,20) 
//bool5 = false
```

### Less Than or Equal to
```swift
let bool6 = Fraction(4,5) <= Fraction(16,20) 
//bool6 = true
```

---


