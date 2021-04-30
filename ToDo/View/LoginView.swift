//
//  LoginView.swift
//  ToDo
//
//  Created by Cédric Evrard on 30/04/2021.
//

import SwiftUI

struct LoginView: View {
	
	@Binding var pseudo: String
	@Binding var password: String
	
	var body: some View {
		VStack {
			UserTextField(pseudo: $pseudo)
				.padding(.bottom, 20)
			PasswordField(password: $password)
		}.padding()
	}
}


struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
		LoginView(pseudo: .constant(""), password: .constant(""))
    }
}

struct UserTextField: View {
	@Binding var pseudo: String
	
	var body: some View {
		TextField("Pseudo", text: $pseudo)
		Rectangle()
			.frame(height: 1, alignment: .bottom)
			.offset(x: 0, y: -15)
			.opacity(0.5)
	}
}

struct PasswordField: View {
	@Binding var password: String
	
	var body: some View {
		SecureField("Password", text: $password)
		Rectangle()
			.frame(height: 1, alignment: .bottom)
			.opacity(0.5)
	}
}
