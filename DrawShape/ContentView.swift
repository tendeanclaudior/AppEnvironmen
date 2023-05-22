//
//  ContentView.swift
//  DrawShape
//
//  Created by Claudio Tendean on 22/05/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image("g4")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 400, height: 100)
                .clipShape(Ellipse().rotation(Angle(degrees: 30)))
                .overlay(Ellipse().rotation(Angle(degrees: 30)).stroke(Color.green, lineWidth: 10))
                
        }.padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
