//
//  NotarizationInfo.swift
//
//
//  Created by phimage on 13/10/2019.
//

import Foundation

public struct NotarizationInfo: Codable {

    enum CodingKeys: String, CodingKey {
        case date = "Date"
        case logFileUrl = "LogFileURL"
        case requestUUID = "RequestUUID"
        case statusCode = "Status Code"
        case statusMessage = "Status Message"
        case status = "Status"

    }

    public var date: Date?
    public var logFileUrl: String?
    public var requestUUID: String?
    public var status: NotarizationStatus
    public var statusCode: Int?
    public var statusMessage: String?
}
