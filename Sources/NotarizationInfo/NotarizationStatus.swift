//
//  NotarizationStatus.swift
//  
//
//  Created by phimage on 13/10/2019.
//

import Foundation

public enum NotarizationStatus: String, Codable {
    case inProgress = "in progress"
    case success
    case invalid
}
