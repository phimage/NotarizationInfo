//
//  NotarizationUpload.swift
//  
//
//  Created by phimage on 13/10/2019.
//

import Foundation

public struct NotarizationUpload: Codable {

    enum CodingKeys: String, CodingKey {
        case requestUUID = "RequestUUID"
    }

    public var requestUUID: String
}
