//
//  TodoView.swift
//  ToDo
//
//  Created by Cédric Evrard on 30/04/2021.
//

import SwiftUI

struct TodoView: View {
	@Binding var user: [User]
	
    var body: some View {
		NavigationView {
			VStack {
				ForEach(self.user) { user in
					Text("Welcome \(user.pseudo) || ID: \(user.id)")
				}
			}
		}
//		.onAppear() {
//			let login = UserController(pseudo: self.pseudo, password: self.password)
//			login.loginUser() { user in
//				self.user = user
//			}
//		}
		.navigationBarHidden(true)
    }
}

//struct TodoView_Previews: PreviewProvider {
//    static var previews: some View {
//		TodoView(pseudo: .constant("Coucou"))
//    }
//}
