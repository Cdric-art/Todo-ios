//
//  TodoController.swift
//  ToDo
//
//  Created by Cédric Evrard on 03/05/2021.
//

import Foundation

public class TodoController {
	
	private var token: String
	
	init(token: String) {
		self.token = token
	}
	
	internal func getAll(completion: @escaping (Todo) -> ()) {
		
		let urlApi = "http://127.0.0.1:3333/todo"
		guard let url = URL(string: urlApi) else { return }
		
		var request = URLRequest(url: url)
		request.httpMethod = "GET"
		
		request.setValue("application/json", forHTTPHeaderField: "Accept")
		request.setValue("application/json", forHTTPHeaderField: "Content-Type")
		request.setValue("Bearer \(self.token)", forHTTPHeaderField: "Authorization")
		
		URLSession.shared.dataTask(with: request) { (data, response, error) in
			
			if let error = error {
				print(error)
				return
			}
			
			guard let data = data else { return }
			
			let todos = try! JSONDecoder().decode(Todo.self, from: data)

			print("TODOS ::: \(todos)")

			DispatchQueue.main.async {
				completion(todos)
			}
			
		}.resume()
		
	}
	
}
