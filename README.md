# FontAwesome for Swift UI

## Set up

1. Download Pro or Free for Web Zip archive from [Downloads] page
1. Unarchive the Zip archive and copy `webfonts/fa-*.ttf` to your project
1. Set up custom fonts by following Apple's official article [Applying Custom Fonts to Text]
1. Go to _Project_ > _Package Dependencies_ and click _+_ button.
1. Paste the project URL: https://github.com/ngs/fontawesome-swiftui

## Usage

```swift
import SwiftUI
import FontAwesome

struct ContentView: View {
    var body: some View {
        FontAwesomeIcon(.flag, size: 40, style: .solid, pro: true)
    }
}
```

## License

MIT. See [LICENSE]

[Downloads]: https://fontawesome.com/download
[Applying Custom Fonts to Text]: https://developer.apple.com/documentation/swiftui/applying-custom-fonts-to-text
[LICENSE]: ./LICENSE