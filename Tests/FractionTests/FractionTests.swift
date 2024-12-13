import XCTest
@testable import Fraction

final class FractionTests: XCTestCase {
    
    private var arbitrary_fraction: Fraction!
    
    override func setUpWithError() throws {
        arbitrary_fraction = Fraction(2,1)
    }
    
    override func tearDownWithError() throws {
        arbitrary_fraction = nil
    }
    
    func testSimplifyFraction() {
        
        let simp_fraction = Fraction.simplify(Fraction(4,2))
        
        XCTAssertEqual(simp_fraction, arbitrary_fraction, "Fractions are not equal to each other.")
    }
    
    func testFractionWholeNumber() {
        
        XCTAssertEqual(arbitrary_fraction.get_whole_number(), 2, "The whole numbers are not equal to each other.")
    }
    
    func testGetFloatNumber() {
        XCTAssertEqual(arbitrary_fraction.get_float(), 2.0, "The whole numbers are not equal to each other.")
    }
    
    func testAdd() {
        XCTAssertEqual(arbitrary_fraction + Fraction(3,5), Fraction(13,5), "Addition failed: fractions not equal to each other")
    }
    
    func testSubtraction() {
        XCTAssertEqual(arbitrary_fraction - Fraction(3,5), Fraction(-7,5), "Subtraction failed: fractions not equal to each other")
    }
    
    func testMultiplication() {
        XCTAssertEqual(arbitrary_fraction * Fraction(3,5), Fraction(6,5), "Multiplication failed: fractions not equal to each other")
    }
    
    func testDivision() {
        XCTAssertEqual(arbitrary_fraction / Fraction(3,5), Fraction(10,3), "Division failed: fractions not equal to each other")
    }

    func testEquals() {
        XCTAssertTrue(arbitrary_fraction == Fraction(150,75), "== comparison failed: fractions not equal to each other")
    }
    
    func testNotEquals() {
        XCTAssertTrue(arbitrary_fraction != Fraction(200,75), "!= comparison failed:  not equal to each other")
    }
    
    func testGreaterThan() {
        let temp = Fraction(1,1)
        XCTAssertTrue(arbitrary_fraction > temp, "> comparison failed: \(arbitrary_fraction.numer) / \(arbitrary_fraction.denom) is not greater than \(temp.numer) / \(temp.denom)")
    }
    
    func testGreaterThanEqualTo() {
        let temp = Fraction(4,2)
        XCTAssertTrue(arbitrary_fraction >= temp, ">= comparison failed: \(arbitrary_fraction.numer) / \(arbitrary_fraction.denom) is not greater than or equal to \(temp.numer) / \(temp.denom)")
    }
    
    func testLessThan() {
        func testGreaterThanEqualTo() {
            let temp = Fraction(200,75)
            XCTAssertTrue(arbitrary_fraction < temp, "< comparison failed: \(arbitrary_fraction.numer) / \(arbitrary_fraction.denom) is not less than \(temp.numer) / \(temp.denom)")
        }
    }
    
    func testLessThanEqualTo() {
        func testGreaterThanEqualTo() {
            let temp = Fraction(200,75)
            XCTAssertTrue(arbitrary_fraction <= temp, "<= comparison failed: \(arbitrary_fraction.numer) / \(arbitrary_fraction.denom) is not less than or equal to \(temp.numer) / \(temp.denom)")
        }
    }
}
