//
//  Message.swift
//  ChatGPT
//
//  Created by Mert Gaygusuz on 22.04.2023.
//

import Foundation

struct Message: Decodable {
    let id: UUID
    let role: SenderRole
    let content: String
    let createAt: Date
}
