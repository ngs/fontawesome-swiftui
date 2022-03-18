//
//  File.swift
//  
//
//  Created by Atsushi Nagase on 2022/03/19.
//

import Foundation

extension String {
    func bytes() -> [UInt8]? {
        let length = count
        if length & 1 != 0 {
            return nil
        }
        var bytes = [UInt8]()
        bytes.reserveCapacity(length / 2)
        var index = startIndex
        for _ in 0..<length / 2 {
            let nextIndex = self.index(index, offsetBy: 2)
            if let byte = UInt8(self[index..<nextIndex], radix: 16) {
                bytes.append(byte)
            } else {
                return nil
            }
            index = nextIndex
        }
        return bytes
    }
}

extension Icon {
    public init?(unicode: String) {
        guard
            let bytes = (unicode.count > 2 ? unicode : "00\(unicode)").bytes(),
            let value = String(data: Data(bytes), encoding: .utf16)
        else {
            return nil
        }
        self.init(rawValue: value)
    }
}
