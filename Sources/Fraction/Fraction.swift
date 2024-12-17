// The Swift Programming Language
// https://docs.swift.org/swift-book

//credit: documentation by chatGPT


public struct Fraction: Hashable {
    public var numer: Int
    public var denom: Int
    
    /// Initializes a `Fraction` with a numerator and a denominator.
    /// - Parameters:
    ///   - numer: The numerator of the fraction. Default is 0.
    ///   - denom: The denominator of the fraction. Default is 1.
    public init(_ numer: Int = 0, _ denom: Int = 1) {
        self.numer = numer
        self.denom = denom
    }
    
    /// Initializes a `Fraction` with an integer value.
    /// The fraction is equivalent to `value / 1`.
    /// - Parameter value: The integer value. Default is 1.
    public init(_ value: Int = 1) {
        self.numer = value
        self.denom = 1
    }
}

extension Fraction {
    
    /// Returns the whole number part of the fraction.
    /// - Returns: An integer representing the whole number part of the fraction.
    /// - Precondition: The denominator must not be 0.
    public func get_whole_number() -> Int {
        precondition(self.denom != 0, "Denominator cannot be 0")
        
        return self.numer / self.denom
    }
    
    /// Returns the decimal value of the fraction as a `Double`.
    /// - Returns: A `Double` representing the value of the fraction.
    /// - Precondition: The denominator must not be 0.
    public func get_float() -> Double {
        precondition(self.denom != 0, "Denominator cannot be 0")

        return Double(self.numer) / Double(self.denom)
    }
    
    /// Calculates the greatest common divisor (GCD) of two integers.
    /// - Parameters:
    ///   - num1: The first integer.
    ///   - num2: The second integer.
    /// - Returns: The GCD of the two integers.
    public static func gcd(_ num1: Int, _ num2: Int) -> Int {
        
        let n1_abs = abs(num1)
        let n2_abs = abs(num2)
        
        var a = (n1_abs >= n2_abs) ? n1_abs : n2_abs
        var b = (n1_abs < n2_abs) ? n1_abs : n2_abs
        
        while b != 0 {
            let temp = b
            b = a % b
            a = temp
        }
        return a
    }

    /// Simplifies a given fraction to its simplest form. Example: 4/2 ==> 2/1
    /// - Parameter fraction: The fraction to simplify.
    /// - Returns: A new `Fraction` that is the simplified version.
    public static func simplify(_ fraction: Fraction) -> Fraction {
        
        let gcdValue = gcd(fraction.numer, fraction.denom)
        
        return Fraction(fraction.numer / gcdValue, fraction.denom / gcdValue)
    }
    
    // MARK: - Arithmetic Operators

    /// Adds two fractions and returns the result in its simplest form.
    public static func + (lhs: Fraction, rhs: Fraction) -> Fraction {
        
        if(lhs.denom == rhs.denom) {
            let result = Fraction(lhs.numer + rhs.numer, lhs.denom)
            
            return Fraction.simplify(result)
        }
        else if(lhs.denom > rhs.denom && lhs.denom % rhs.denom == 0) {
            
            let multiplier = lhs.denom / rhs.denom
            
            let result = Fraction(lhs.numer + (rhs.numer * multiplier) ,lhs.denom)
            
            return Fraction.simplify(result)
        }
        else if(rhs.denom > lhs.denom && rhs.denom % lhs.denom == 0) {
            
            let multiplier = rhs.denom / lhs.denom
            
            let result = Fraction((lhs.numer * multiplier) + rhs.numer, rhs.denom)
        
            return Fraction.simplify(result)
        }
        
        let result = Fraction((lhs.numer * rhs.denom) + (rhs.numer * lhs.denom), lhs.denom * rhs.denom)
                
        return Fraction.simplify(result)
    }
    
    /// Subtracts one fraction from another and returns the result in its simplest form.
    public static func - (lhs: Fraction, rhs: Fraction) -> Fraction {
        
        if((lhs.denom == rhs.denom) && (lhs.numer == rhs.numer)) {
            return Fraction(0, 0)
        }
        else if(lhs.denom == rhs.denom) {
            let result = Fraction(lhs.numer - rhs.numer, lhs.denom)
            
            return Fraction.simplify(result)
        }
        else if(lhs.denom > rhs.denom && lhs.denom % rhs.denom == 0) {
            
            let multiplier = lhs.denom / rhs.denom
            
            let result = Fraction(lhs.numer - (rhs.numer * multiplier) ,lhs.denom)
            
            return Fraction.simplify(result)
        }
        else if(rhs.denom > lhs.denom && rhs.denom % lhs.denom == 0) {
            
            let multiplier = rhs.denom / lhs.denom
            
            let result = Fraction((lhs.numer * multiplier) - rhs.numer, rhs.denom)
        
            return Fraction.simplify(result)
        }
        
        
        let result = Fraction((lhs.numer * rhs.denom) - (rhs.numer * lhs.denom), lhs.denom * rhs.denom)
        
        
        return Fraction.simplify(result)
    }
    
    /// Multiplies two fractions and returns the result in its simplest form.
    public static func * (lhs: Fraction, rhs: Fraction) -> Fraction {
        
        let result = Fraction(lhs.numer * rhs.numer, lhs.denom * rhs.denom)
        
        return Fraction.simplify(result)
    }
    
    /// Divides one fraction by another and returns the result in its simplest form.
    public static func / (lhs: Fraction, rhs: Fraction) -> Fraction {
        
        let result = Fraction(lhs.numer * rhs.denom, lhs.denom * rhs.numer)
        
        return Fraction.simplify(result)
    }
}

extension Fraction: Equatable {
    /// Returns a Boolean value indicating whether the left Fraction is equal to the right Fraction.
    public static func == (lhs: Fraction, rhs: Fraction) -> Bool {
        return lhs.get_float() == rhs.get_float()
    }
    
    /// Checks if two fractions are not equal based on their decimal values.
    public static func != (lhs: Fraction, rhs: Fraction) -> Bool {
        return lhs.get_float() != rhs.get_float()
    }
}

extension Fraction: Comparable {
    
    /// Returns a Boolean value indicating whether the left Fraction is less than the right Fraction.
    public static func <(lhs: Fraction, rhs: Fraction) -> Bool {
        return lhs.get_float() < rhs.get_float()
    }
    
    /// Returns a Boolean value indicating whether the left Fraction is less than or equal to the right Fraction.
    public static func <=(lhs: Fraction, rhs: Fraction) -> Bool {
        return lhs.get_float() <= rhs.get_float()
    }

    /// Returns a Boolean value indicating whether the left Fraction is greater than the right Fraction.
    public static func >(lhs: Fraction, rhs: Fraction) -> Bool {
        return lhs.get_float() > rhs.get_float()
    }
    
    /// Returns a Boolean value indicating whether the left Fraction is greater than or equal to the right Fraction.
    public static func >=(lhs: Fraction, rhs: Fraction) -> Bool {
        return lhs.get_float() >= rhs.get_float()
    }
}

