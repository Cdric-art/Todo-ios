//
//  UserController.swift
//  ToDo
//
//  Created by Cédric Evrard on 30/04/2021.
//

import Foundation

public class UserController {
	
	private let pseudo: String
	private let password: String
	private let email: String?
	
	init(pseudo: String, password: String, email:String?) {
		self.pseudo = pseudo
		self.password = password
		self.email = email
	}
	
	private let loginUrl = "http://127.0.0.1:3333/login"
	private let registerUrl = "http://127.0.0.1:3333/register"
	
	internal func loginUser(completion: @escaping (TokenAPI) -> ()) {
		
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
			
			let token = try! JSONDecoder().decode(TokenAPI.self, from: data)
		
			print("userLogin ::: \(token)")
			
			DispatchQueue.main.async {
				completion(token)
			}
	
		}.resume()
		
	}
	
	internal func signUpUser(completion: @escaping ([User]) -> ()) {
		
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
