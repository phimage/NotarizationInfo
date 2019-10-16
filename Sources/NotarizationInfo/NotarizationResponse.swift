//
//  NotarizationResponse.swift
//
//
//  Created by phimage on 13/10/2019.
//

import Foundation

public struct NotarizationResponse: Codable {

    enum CodingKeys: String, CodingKey {
        case osVersion = "os-version"
        case notarizationUpload = "notarization-upload"
        case successMessage = "success-message"
        case toolPath = "tool-path"
        case toolVersion = "tool-version"
        case productErrors = "product-errors"
        case notarizationInfo = "notarization-info"
        case notarizationHistory = "notarization-history"
    }

    public var notarizationUpload: NotarizationUpload?
    public var notarizationInfo: NotarizationInfo?
    public var notarizationHistory: NotarizationHistory?
    public var successMessage: String?
    public var osVersion: String
    public var toolPath: String
    public var toolVersion: String
    public var productErrors: [NotaryError]?

}

extension NotarizationResponse {

    public init(from string: String, decoder: PropertyListDecoder = PropertyListDecoder()) throws {
        guard let data = string.data(using: .utf8) else {
            let context = DecodingError.Context(codingPath: [], debugDescription: "Failed to decode utf8 string")
            throw DecodingError.dataCorrupted(context)
        }
        try self.init(from: data, decoder: decoder)
    }

    public init(from data: Data, decoder: PropertyListDecoder = PropertyListDecoder()) throws {
        self = try decoder.decode(NotarizationResponse.self, from: data)
    }
}
