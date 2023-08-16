//
//  ErrorView.swift
//  BiolerplateV1
//
//  Created by Shourob Datta on 15/8/23.
//

import SwiftUI

import SwiftUI

struct ErrorView: View {
    
    let errorTitle: String? = "Error"
    let errorDescription: String
    let reloadAction: () -> Void
    
    var body: some View {
        VStack {
            Spacer()
            
            Image(systemName: "exclamationmark.triangle.fill")
                .font(.system(size: 60))
                .foregroundColor(.red)
                .padding(.bottom, 20)
            
            Text(errorTitle ?? "")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.black)
                .padding(.bottom, 10)
            
            Text(errorDescription)
                .font(.body)
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 20)
            
            Button(action: reloadAction) {
                Text("Reload")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(10)
            }
            .padding(.top, 40)
            
            Spacer()

        }
        .padding()
    }
}


struct ErrorView_Previews: PreviewProvider {
    static var previews: some View {
        ErrorView(errorDescription: "Internet conenction appears offiline", reloadAction: {
            
        })
    }
}
