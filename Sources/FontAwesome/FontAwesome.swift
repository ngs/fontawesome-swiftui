import SwiftUI

public let version = "6"

func fontAwesomeName(style: Style, pro: Bool) -> String {
    let prefix = "FontAwesome\(version)"
    switch style {
    case .brands, .duotone:
        return "\(prefix)\(style.rawValue)"
    default:
        return "\(prefix)\(pro ? "Pro" : "Free")-\(style.rawValue)"
    }
}

extension Font {
    public static func awesome(style: Style, size: CGFloat, pro: Bool = false) -> Font {
        return .custom(fontAwesomeName(style: style, pro: pro), size: size)
    }
}

public struct FontAwesomeIcon: View {
    public let icon: Icon
    public let style: Style
    public let pro: Bool
    public let size: CGFloat

    public init(_ icon: Icon, size: CGFloat, style: Style = .regular, pro: Bool = false) {
        self.icon = icon
        self.size = size
        self.style = style
        self.pro = pro
    }

    public var body: some View {
        Text(icon.rawValue)
            .font(.awesome(style: style, size: size, pro: pro))
    }
}
