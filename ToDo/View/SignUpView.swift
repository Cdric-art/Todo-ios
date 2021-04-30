//
//  SignUpView.swift
//  ToDo
//
//  Created by Cédric Evrard on 30/04/2021.
//

import SwiftUI

struct SignUpView: View {
	
	@Binding var pseudo: String
	@Binding var password: String
	@Binding var email: String
	
    var body: some View {
		VStack {
			UserTextField(pseudo: $pseudo)
				.padding(.bottom, 20)
			EmailTextField(email: $email)
				.padding(.bottom, 20)
			PasswordField(password: $password)
		}.padding()
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
		SignUpView(pseudo: .constant(""), password: .constant(""), email: .constant(""))
    }
}


struct EmailTextField: View {
	@Binding var email: String
	
	var body: some View {
		TextField("Email", text: $email)
		Rectangle()
			.frame(height: 1, alignment: .bottom)
			.offset(x: 0, y: -15)
			.opacity(0.5)
	}
}
