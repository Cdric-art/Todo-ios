//
//  TodoModel.swift
//  ToDo
//
//  Created by Cédric Evrard on 30/04/2021.
//

import Foundation

struct Todo: Codable, Identifiable {
	let id: Int
	let title: String
	let content: String
	let status: Int
	let user_id: User.ID
	let created_at: Date
	let uptated_at: Date
}

let MONK_TODO: [Todo] = [
	.init(id: 1, title: "1er Todo", content: "Ma première todo", status: 0, user_id: 1, created_at: Date(), uptated_at: Date()),
	.init(id: 2, title: "2eme Todo", content: "Ma deuxième todo", status: 1, user_id: 1, created_at: Date(), uptated_at: Date())
]
