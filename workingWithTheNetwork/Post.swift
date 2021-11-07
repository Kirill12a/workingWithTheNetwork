//
//  Post.swift
//  workingWithTheNetwork
//
//  Created by Kirill Drozdov on 07.11.2021.
//

import Foundation


struct Posts: Codable {
    let userId: Int
    let postId: Int
    let title:  String
    let body:   String
    enum CodingKeys: String, CodingKey { // тут перечисляем все наши поля кейсами
        case userId
        case postId = "id"
        case title
        case body
    }
}
