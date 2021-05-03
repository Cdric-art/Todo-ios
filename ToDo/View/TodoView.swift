//
//  TodoView.swift
//  ToDo
//
//  Created by Cédric Evrard on 30/04/2021.
//

import SwiftUI

struct TodoView: View {
	@State var todos = Todo()
	@Binding var token: String
	@Binding var pseudo: String
	
	@State var logoutSuccess: Bool = false
	
	private func showAllTodo() {
		let todos = TodoController(token: self.token)
		todos.getAll() { todo in
			self.todos = todo
		}
	}
	
private func logout() {
	let logoutUrl = "http://127.0.0.1:3333/logout"
	guard let url = URL(string: logoutUrl) else { return }
	var request = URLRequest(url: url)
	request.httpMethod = "GET"
	request.setValue("application/json", forHTTPHeaderField: "Accept")
	request.setValue("application/json", forHTTPHeaderField: "Content-Type")
	
	URLSession.shared.dataTask(with: request) { ( _, response, error ) in
		if let error = error {
			print("Error request: \(error)")
			return
		}
		if let response = response {
			print("Response server: \(response)")
		}
		
		self.logoutSuccess.toggle()
		
	}.resume()
}
	
    var body: some View {
		NavigationView {
			ZStack(alignment: .center) {
				Image("bg")
					.resizable()
					.scaledToFill()
					.frame(width: 600)

				VStack(alignment: .leading) {
					Text("Welcome \(self.pseudo)")
						.font(.largeTitle)
						.fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
						.foregroundColor(.white)
						.frame(width: 350, alignment: .leading)
						.padding(.bottom, 200)
					
					if self.todos.isEmpty {
						VStack {
							Button(action: showAllTodo, label: {
								Text("Show Todo")
									.font(.title3)
									.fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
									.padding()
									.frame(width: 150, alignment: .center)
									.foregroundColor(.white)
									.border(Color.white, width: 2)
									.background(Color.init(#colorLiteral(red: 0.2387390137, green: 0.199640274, blue: 0.3967862129, alpha: 1)))
									.cornerRadius(3.0)
							})
							
							Spacer()
							
							NavigationLink(destination: ContentView(), isActive: $logoutSuccess) {
								Button(action: logout, label: {
									Text("Logout")
										.font(.title3)
										.padding()
										.frame(width: 110, height: 50, alignment: .center)
										.foregroundColor(.white)
										.border(Color.white, width: 1)
								})
							}
						}
						.frame(width: 350, height: 180)
					} else {
						ForEach(self.todos) { todo in
							Text(todo.title)
								.font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
								.foregroundColor(.white)
						}
					}
				}
			}
			
		}
		.navigationBarHidden(true)
    }
}

struct TodoView_Previews: PreviewProvider {
    static var previews: some View {
		TodoView(token: .constant("TOKEN"), pseudo: .constant("Demo"))
    }
}
