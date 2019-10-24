//
//  NotarizationError.swift
//  
//
//  Created by phimage on 13/10/2019.
//

import Foundation

public enum NotarizationError: Error {
    case productErrors([ProductError])
}

public final class ProductError: NSError, Codable {

    enum CodingKeys: String, CodingKey {
        case code
        case userInfo
    }

    public required convenience init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.init(domain: "Apple Notarization",
                  code: try container.decode(Int.self, forKey: .code),
                  userInfo: try container.decode([String: String].self, forKey: .userInfo))
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.code, forKey: .code)
        try container.encode(self.userInfo as? [String: String], forKey: .userInfo)
    }

}
