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
    public var productErrors: [NotarizationError]?

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

    public func getNotarizationUpload(productError: Bool = true) throws -> NotarizationUpload {
        guard let upload = self.notarizationUpload else {
            if let productError = self.productErrors?.first {
                throw productError
            }
            let context = DecodingError.Context(codingPath: [NotarizationResponse.CodingKeys.notarizationUpload],
                                                debugDescription: "Failed to decode notarizationUpload")
            throw DecodingError.keyNotFound(NotarizationResponse.CodingKeys.notarizationUpload, context)
        }
        return upload
    }

    public func getNotarizationInfo(productError: Bool = true) throws -> NotarizationInfo {
        guard let info = self.notarizationInfo else {
            if let productError = self.productErrors?.first {
                throw productError
            }
            let context = DecodingError.Context(codingPath: [NotarizationResponse.CodingKeys.notarizationInfo],
                                                debugDescription: "Failed to decode notarizationInfo")
            throw DecodingError.keyNotFound(NotarizationResponse.CodingKeys.notarizationInfo, context)
        }
        return info
    }

    public func getNotarizationHistory(productError: Bool = true) throws -> NotarizationHistory {
        guard let history = self.notarizationHistory else {
            if let productError = self.productErrors?.first {
                throw productError
            }
            let context = DecodingError.Context(codingPath: [NotarizationResponse.CodingKeys.notarizationHistory],
                                                debugDescription: "Failed to decode notarizationHistory")
            throw DecodingError.keyNotFound(NotarizationResponse.CodingKeys.notarizationHistory, context)
        }
        return history
    }
}
