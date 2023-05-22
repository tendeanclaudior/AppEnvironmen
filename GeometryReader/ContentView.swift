//
//  ContentView.swift
//  GeometryReader
//
//  Created by Claudio Tendean on 22/05/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack {
                Kolom(gambar1: "g1", gambar2: "g2", gambar3: "g3")
                Kolom(gambar1: "g3", gambar2: "g4", gambar3: "g5")
                Text("My Gallery")
            }
            .navigationBarTitle("Galeri")
        }.navigationViewStyle(StackNavigationViewStyle())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Kolom : View {
    var gambar1, gambar2, gambar3 : String
    var body: some View {
        GeometryReader {
            geo in
            HStack {
                Image(self.gambar1)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: geo.size.width/3, height: geo.size.height)
                    .clipped()
                
                Image(self.gambar1)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: geo.size.width/3, height: geo.size.height)
                    .clipped()
                
                Image(self.gambar1)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: geo.size.width/3, height: geo.size.height)
                    .clipped()
            }
        }
    }
}
