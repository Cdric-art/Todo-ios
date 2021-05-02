//
//  UserController.swift
//  ToDo
//
//  Created by Cédric Evrard on 30/04/2021.
//

import Foundation

class UserController {
	
	let pseudo: String
	let password: String
	let email: String?
	
	init(pseudo: String, password: String, email:String?) {
		self.pseudo = pseudo
		self.password = password
		self.email = email
	}
	
	let loginUrl = "http://127.0.0.1:3333/login"
	let registerUrl = "http://127.0.0.1:3333/register"
	
	
	func loginUser(completion:@escaping ([User]) -> ()) {
		
		// Prepare url
		guard let url = URL(string: loginUrl) else { return }
		
		// Prepare url reauest object
		var request = URLRequest(url: url)
		request.httpMethod = "POST"
		
		// Set HTTP Request Header
		request.setValue("application/json", forHTTPHeaderField: "Accept")
		request.setValue("application/json", forHTTPHeaderField: "Content-Type")
		
		// Set HTTP Request Body
		let userField = ["pseudo": self.pseudo, "password": self.password]
		let jsonData = try? JSONEncoder().encode(userField)
		
		request.httpBody = jsonData
		
		URLSession.shared.dataTask(with: request) { ( data, _, error ) in
			
			if let error = error {
				print("Error request: \(error)")
				return
			}
			
			guard let data = data else { return }
			
			let userLogin = try! JSONDecoder().decode(User.self, from: data)
		
			print("userLogin ::: \(userLogin)")
			
			DispatchQueue.main.async {
				completion([userLogin])
			}
	
		}.resume()
		
	}
	
	func signUpUser(completion:@escaping ([User]) -> ()) {
		
		guard let url = URL(string: registerUrl) else { return }
		
		var request = URLRequest(url: url)
		request.httpMethod = "POST"
		
		request.setValue("application/json", forHTTPHeaderField: "Accept")
		request.setValue("application/json", forHTTPHeaderField: "Content-Type")
		
		let userField = ["pseudo": self.pseudo, "password": self.password, "email": self.email]
		let jsonData = try? JSONEncoder().encode(userField)
		
		request.httpBody = jsonData
		
		URLSession.shared.dataTask(with: request) { ( data, _, error ) in
			
			if let error = error {
				print("Error request: \(error)")
				return
			}
			
			guard let data = data else { return }
			
			let userSignUp = try! JSONDecoder().decode(User.self, from: data)
			
			print("userSignUp ::: \(userSignUp)")
			
			DispatchQueue.main.async {
				completion([userSignUp])
			}
			
		}.resume()
	}
	
}
