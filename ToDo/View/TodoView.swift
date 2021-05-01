//
//  TodoView.swift
//  ToDo
//
//  Created by Cédric Evrard on 30/04/2021.
//

import SwiftUI

struct TodoView: View {
	@Binding var pseudo: String
	
    var body: some View {
		NavigationView {
			Text("Welcome \(pseudo)")
		}
		.navigationBarHidden(true)
    }
}

struct TodoView_Previews: PreviewProvider {
    static var previews: some View {
		TodoView(pseudo: .constant("Coucou"))
    }
}
