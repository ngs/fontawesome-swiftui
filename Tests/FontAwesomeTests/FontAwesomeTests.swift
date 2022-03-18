import XCTest
@testable import FontAwesome
import SwiftUI

final class FontAwesomeTests: XCTestCase {
    func testNames() throws {
        [
            (FontAwesome.fontAwesomeName(style: .duotone, pro: false), "Font Awesome 6 Duotone Solid"),
            (FontAwesome.fontAwesomeName(style: .duotone, pro: true), "Font Awesome 6 Duotone Solid"),
            (FontAwesome.fontAwesomeName(style: .brands, pro: false), "Font Awesome 6 Brands Regular"),
            (FontAwesome.fontAwesomeName(style: .brands, pro: true), "Font Awesome 6 Brands Regular"),
            (FontAwesome.fontAwesomeName(style: .regular, pro: false), "Font Awesome 6 Free Regular"),
            (FontAwesome.fontAwesomeName(style: .regular, pro: true), "Font Awesome 6 Pro Regular"),
            (FontAwesome.fontAwesomeName(style: .light, pro: false), "Font Awesome 6 Free Light"),
            (FontAwesome.fontAwesomeName(style: .light, pro: true), "Font Awesome 6 Pro Light"),
            (FontAwesome.fontAwesomeName(style: .solid, pro: false), "Font Awesome 6 Free Solid"),
            (FontAwesome.fontAwesomeName(style: .solid, pro: true), "Font Awesome 6 Pro Solid"),
            (FontAwesome.fontAwesomeName(style: .thin, pro: false), "Font Awesome 6 Free Thin"),
            (FontAwesome.fontAwesomeName(style: .thin, pro: true), "Font Awesome 6 Pro Thin")
        ].forEach { (actual, expected) in
            XCTAssertEqual(actual, expected)
        }
    }

    func testInitWithUnicode() throws {
        XCTAssertEqual(FontAwesome.Icon(unicode: "f3f6"), .steamSymbol)
    }
}
