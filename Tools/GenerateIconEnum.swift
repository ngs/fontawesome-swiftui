//
//  File.swift
//  
//
//  Created by Atsushi Nagase on 2022/03/19.
//

// swiftlint:disable force_try function_body_length

import Foundation

// MARK: - Response
struct Response: Codable {
    let data: DataClass
}

// MARK: - DataClass
struct DataClass: Codable {
    let release: Release
}

// MARK: - Release
struct Release: Codable {
    let icons: [Icon]
}

// MARK: - Icon
struct Icon: Codable {
    let id, label: String
    let membership: Membership
    let unicode: String
}

// MARK: - Membership
struct Membership: Codable {
    let free, pro: [Style]
}

enum Style: String, Codable {
    case brands
    case duotone
    case light
    case regular
    case solid
    case thin
}

let digitRegex = try! NSRegularExpression(pattern: "^\\d", options: .allowCommentsAndWhitespace)
let swiftKeywords = ["subscript", "repeat"]

func normalizeId(_ str: String) -> String {
    let id = str.split(separator: "-")
        .map { String($0) }
        .enumerated()
        .map { $0.offset > 0 ? $0.element.capitalized : $0.element.lowercased() }
        .joined()
    if digitRegex.matches(in: id, options: .anchored, range: NSRange(id.startIndex..<id.endIndex, in: id)).count > 0 {
        return "_\(id)"
    }
    if swiftKeywords.contains(id) {
        return "`\(id)`"
    }
    return id
}

func updateIcons() throws {
    let sema = DispatchSemaphore( value: 0 )
    let query = """
        query {
          release(version:"6.1.0"){
            icons {
              id
              label
              membership {
                free
                pro
              }
              unicode
            }
          }
        }
        """
    var request = URLRequest(url: URL(string: "https://api.fontawesome.com")!)
    request.httpMethod = "POST"
    request.httpBody = try JSONSerialization.data(withJSONObject: ["query": query], options: .prettyPrinted)
    request.setValue("application/json", forHTTPHeaderField: "Content-Type")
    URLSession.shared.dataTask(with: request) { data, _, err in
        // print(String(data: data!, encoding: .utf8)!)
        guard let rawData = data else {
            print(err ?? "unknown error")
            sema.signal()
            return
        }
        let icons = (try! JSONDecoder().decode(Response.self, from: rawData)).data.release.icons
        let code = icons.map { icon in
            return "    /// \(icon.label)\n    case \(normalizeId(icon.id)) = \"\\u{\(icon.unicode)}\""
        }.joined(separator: "\n\n")
        let lintRules = "identifier_name file_length type_body_length"
        print("""
// swiftlint:disable \(lintRules)

public enum Icon: String {
  \(code)
}

// swiftlint:enable \(lintRules)
""")
        sema.signal()
    }.resume()
    sema.wait()
}

func main() {

}

try! updateIcons()
