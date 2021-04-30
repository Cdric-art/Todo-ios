//
//  UserModel.swift
//  ToDo
//
//  Created by Cédric Evrard on 30/04/2021.
//

import Foundation

struct User: Identifiable {
	let id: Int
	let pseudo: String
	let password: String
	let email: String
	let rememberMeToken: String?
	let created_at: Date
	let uptated_at: Date
}

let MOCK_USER: User = .init(id: 1, pseudo: "Demo", password: "123456", email: "john@doe.fr", rememberMeToken: "", created_at: Date(), uptated_at: Date())
