//
//  TodoView.swift
//  ToDo
//
//  Created by Cédric Evrard on 30/04/2021.
//

import SwiftUI

struct TodoView: View {
	
    var body: some View {
		NavigationView {
			Text("Welcome")
		}
		.navigationBarHidden(true)
    }
}

struct TodoView_Previews: PreviewProvider {
    static var previews: some View {
		TodoView()
    }
}
