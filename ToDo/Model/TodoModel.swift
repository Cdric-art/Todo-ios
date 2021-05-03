//
//  TodoModel.swift
//  ToDo
//
//  Created by Cédric Evrard on 30/04/2021.
//

import Foundation

struct TodoElement: Codable, Identifiable {
	let id: Int
	let title, content: String
	let status: Int
	let createdAt, updatedAt: String
	let userID: Int
	
	enum CodingKeys: String, CodingKey {
		case id, title, content, status
		case createdAt = "created_at"
		case updatedAt = "updated_at"
		case userID = "user_id"
	}
}

typealias Todo = [TodoElement]
