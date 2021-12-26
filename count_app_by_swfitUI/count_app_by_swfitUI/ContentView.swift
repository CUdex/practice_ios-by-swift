//
//  ContentView.swift
//  count_app_by_swfitUI
//
//  Created by 류찬울 on 2021/12/26.
//

import SwiftUI

struct ContentView: View {
    @State var counter: Int = 0
    var body: some View {
        VStack{
            Text("Hello, world!")
            Text("this is just count").padding(.bottom).frame(height: 20.0)
            Text("\(counter)")
            HStack{
                Button (action: plus){
                    Text("plus count")
                }
                Button (action: minus){
                    Text("minus count")
                }
            }
        }
    }
    func plus() {
        counter = counter + 1
    }
    func minus() {
        counter = counter - 1
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
