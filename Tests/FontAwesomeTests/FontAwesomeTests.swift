import XCTest
@testable import FontAwesome
import SwiftUI

final class FontAwesomeTests: XCTestCase {
    func testNames() throws {
        [
            (FontAwesome.fontAwesomeName(style: .duotone, pro: false), "FontAwesome6Duotone-Solid"),
            (FontAwesome.fontAwesomeName(style: .duotone, pro: true), "FontAwesome6Duotone-Solid"),
            (FontAwesome.fontAwesomeName(style: .brands, pro: false), "FontAwesome6Brands-Regular"),
            (FontAwesome.fontAwesomeName(style: .brands, pro: true), "FontAwesome6Brands-Regular"),
            (FontAwesome.fontAwesomeName(style: .regular, pro: false), "FontAwesome6Free-Regular"),
            (FontAwesome.fontAwesomeName(style: .regular, pro: true), "FontAwesome6Pro-Regular"),
            (FontAwesome.fontAwesomeName(style: .light, pro: false), "FontAwesome6Free-Light"),
            (FontAwesome.fontAwesomeName(style: .light, pro: true), "FontAwesome6Pro-Light"),
            (FontAwesome.fontAwesomeName(style: .solid, pro: false), "FontAwesome6Free-Solid"),
            (FontAwesome.fontAwesomeName(style: .solid, pro: true), "FontAwesome6Pro-Solid"),
            (FontAwesome.fontAwesomeName(style: .thin, pro: false), "FontAwesome6Free-Thin"),
            (FontAwesome.fontAwesomeName(style: .thin, pro: true), "FontAwesome6Pro-Thin")
        ].forEach { (actual, expected) in
            XCTAssertEqual(actual, expected)
        }
    }

    func testInitWithUnicode() throws {
        XCTAssertEqual(FontAwesome.Icon(unicode: "f3f6"), .steamSymbol)
        XCTAssertEqual(FontAwesome.Icon(unicode: "44"), .d)
    }

    func testUnicode() throws {
        XCTAssertEqual(FontAwesome.Icon.steamSymbol.unicode, "f3f6")
    }
}
