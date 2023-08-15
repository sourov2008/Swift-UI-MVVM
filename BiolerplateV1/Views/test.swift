//
//  test.swift
//  BiolerplateV1
//
//  Created by Shourob Datta on 15/8/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            List {
                Section(header: HeaderView1()) {
                    ForEach(0..<20) { index in
                        NavigationLink(
                            destination: Text("Details for Item \(index)"),
                            label: {
                                Text("List Item \(index)")
                            })
                    }
                }
            }
            .navigationBarTitle("Scrolling List Example")
        }
    }
}

struct HeaderView1: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Header Title")
                .font(.headline)
            Text("Header Subtitle")
                .font(.subheadline)
                .foregroundColor(.gray)
        }
        .padding(.vertical, 10)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
