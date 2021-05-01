//
//  UserController.swift
//  ToDo
//
//  Created by Cédric Evrard on 30/04/2021.
//

import Foundation

class UserController {
	
	let loginUrl = "http://127.0.0.1:3333/login"
	let registerUrl = "http://127.0.0.1:3333/register"
	
	
	func loginUser(pseudo: String, password: String) {
		
		// Prepare url
		guard let url = URL(string: loginUrl) else { return }
		
		// Prepare url reauest object
		var request = URLRequest(url: url)
		request.httpMethod = "POST"
		
		// Set HTTP Request Header
		request.setValue("application/json", forHTTPHeaderField: "Accept")
		request.setValue("application/json", forHTTPHeaderField: "Content-Type")
		
		// Set HTTP Request Body
		let userField = ["pseudo": pseudo, "password": password]
		let jsonData = try? JSONEncoder().encode(userField)
		
		request.httpBody = jsonData
		
		URLSession.shared.dataTask(with: request) { ( data, _, error ) in
			
			if let error = error {
				print("Error request: \(error)")
				return
			}
			
			guard let data = data else { return }
			
			do {
				let userLogin = try JSONDecoder().decode(User.self, from: data)
				print("USER LOGIN -------- > \(userLogin)")
			} catch let errJSON {
				print("errJSON : \(errJSON)")
			}
	
		}.resume()
		
	}
	
}
