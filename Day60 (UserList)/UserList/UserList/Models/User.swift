//
//  User.swift
//  UserList
//
//  Created by Pedro Acevedo on 10/06/24.
//

import Foundation

// MARK: - Welcome
struct User: Codable, Identifiable, Hashable {
    let id: String
    let isActive: Bool
    let name: String
    let age: Int
    let company, email, address, about: String
    let registered: String
    let tags: [String]
    let friends: [Friend]
}

// MARK: - Friend
struct Friend: Codable, Identifiable, Hashable {
    let id, name: String
}

