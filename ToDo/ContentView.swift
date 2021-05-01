//
//  ContentView.swift
//  ToDo
//
//  Created by Cédric Evrard on 26/04/2021.
//

import SwiftUI

struct ContentView: View {
	
	@State var pseudo: String = ""
	@State var password: String = ""
	@State var email: String = ""
	
	@State var showSignUp: Bool = false
	@State var successNavigation: Bool = false
	@State var successLogin: Bool = false
	
	private func handleLogin() {
		let login = UserController()
		login.loginUser(pseudo: self.pseudo, password: self.password)
		successLogin = true
	}
	
	private func handleSignUp() {

	}
	
	private func changeView() {
		showSignUp.toggle()
	}
	
    var body: some View {
		NavigationView {
			ZStack {
				VStack {
					Image("swiftLogo")
						.resizable()
						.clipped()
						.frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
					Text("Hello, Swift !")
						.font(.title2)
						.padding()
					if !showSignUp {
						LoginView(pseudo: $pseudo, password: $password)
							.padding(.top, 50)
						NavigationLink(destination: TodoView(), isActive: $successLogin) {
							Button(action: handleLogin, label: {
							LoginButton()
							})
						}
						Button(action: changeView, label: {
							Text("S‘inscrire")
								.font(.subheadline)
								.padding(.top, 10)
								.foregroundColor(.black)
						})
					} else {
						SignUpView(pseudo: $pseudo, password: $password, email: $email)
							.padding()
						Button(action: handleSignUp, label: {
							SignUpButton()
						})
						Button(action: changeView, label: {
								Text("Se connecter")
									.font(.subheadline)
									.padding(.top, 10)
									.foregroundColor(.black)
						})
					}
				}
				.padding()
			}
		}
	}
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
		ContentView()
    }
}

struct LoginButton: View {
	var body: some View {
		Text("Se connecter")
			.font(.headline)
			.padding()
			.frame(width: 220, height: 60)
			.foregroundColor(.white)
			.background(Color.init(red: 241.0/255.0, green: 79.0/255.0, blue: 52.0/255.0, opacity: 0.9))
			.cornerRadius(30)
			.padding(.top, 50)
	}
}

struct SignUpButton: View {
	var body: some View {
		Text("S‘inscrire")
			.font(.headline)
			.padding()
			.frame(width: 220, height: 60)
			.foregroundColor(.white)
			.background(Color.init(red: 241.0/255.0, green: 79.0/255.0, blue: 52.0/255.0, opacity: 0.9))
			.cornerRadius(30)
			.padding(.top, 50)
	}
}
