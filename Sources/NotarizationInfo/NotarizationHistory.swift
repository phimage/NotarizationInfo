//
//  NotarizationHistory.swift
//  
//
//  Created by phimage on 16/10/2019.
//

import Foundation

public struct NotarizationHistory: Codable {

    enum CodingKeys: String, CodingKey {
        case firstPage = "first-page"
        case lastPage = "last-page"
        case nextPage = "next-page"
        case items
    }

    public var firstPage: Int
    public var lastPage: Int
    public var nextPage: Int
    public var items: [NotarizationInfo]
}
