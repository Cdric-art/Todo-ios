//
//  UserModel.swift
//  ToDo
//
//  Created by Cédric Evrard on 30/04/2021.
//

import Foundation

//struct User: Codable {
//	let id: Int?
//	let pseudo: String
//	let password: String
//	let email: String?
//	let rememberMeToken: String?
//	let created_at: Date?
//	let uptated_at: Date?
//}

struct User: Codable, Identifiable {
	let id: Int
	let pseudo, email: String
	let rememberMeToken: String?
	let createdAt, updatedAt: String
	
	enum CodingKeys: String, CodingKey {
		case id, pseudo, email
		case rememberMeToken = "remember_me_token"
		case createdAt = "created_at"
		case updatedAt = "updated_at"
	}
}

let MOCK_USER: User = .init(id: 1, pseudo: "Demo", email: "john@doe.fr", rememberMeToken: "", createdAt: "", updatedAt: "")
