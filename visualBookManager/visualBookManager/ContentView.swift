//
//  ContentView.swift
//  visualBookManager
//
//

import SwiftUI

struct ContentView: View {
    @State
    public var bookName: String = ""
    @State
    public var bookAuthor: String = ""
    @State
    public var bookGenre: String = ""
    @State
    private var bookList: String = "test"
    @State
    private var bookCount: Int = 0
    
    var leadManager = BookManager()
    
    var body: some View {
        VStack{
            Text("visual Book Manager")
                .padding(.bottom,20)
                .font(.system(size: 25).bold())
                .foregroundColor(.indigo)
            HStack {
                Text("number of Books :")
                Text("\(bookCount)")
                    .padding()
                    .frame(width: 50, height: 30, alignment: .center)
                    .background(.indigo)
            }.padding(.bottom, 30)
            HStack {
                Spacer()
                Text ("Title : ").bold()
                Spacer().frame(width: 30)
                TextField("book name", text: $bookName)
                    .frame(width: 130, alignment: .center)
                    .padding(EdgeInsets(top: 5, leading: 0, bottom: 5, trailing: 0))
                    .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: 1)
                    .cornerRadius(2)
                    .multilineTextAlignment(.center)
                Spacer().frame(width: 50)
            }
            HStack {
                Spacer()
                Text ("Author : ").bold()
                Spacer().frame(width: 30)
                TextField("author name", text: $bookAuthor)
                    .frame(width: 130, alignment: .center)
                    .padding(EdgeInsets(top: 5, leading: 0, bottom: 5, trailing: 0))
                    .border(Color.black, width: 1)
                    .cornerRadius(2)
                    .multilineTextAlignment(.center)
                Spacer().frame(width: 50)
            }
            HStack {
                Spacer()
                Text ("Genre : ").bold()
                Spacer().frame(width: 30)
                TextField("genre name", text: $bookGenre)
                    .frame(width: 130, alignment: .center)
                    .padding(EdgeInsets(top: 5, leading: 0, bottom: 5, trailing: 0))
                    .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: 1)
                    .cornerRadius(2)
                    .multilineTextAlignment(.center)
                Spacer().frame(width: 50)
                
            }
            Spacer().frame(height: 20)
            VStack {
                HStack(spacing: 10) {
                    Button(action: searchBook) {
                        Text("search").foregroundColor(Color.green)
                    }.frame(width: 80, height: 30, alignment: .center)
                        .background(Color.indigo)
                    Button(action: regiterBook) {
                        Text("register").foregroundColor(Color.yellow)
                    }.frame(width: 80, height: 30, alignment: .center)
                        .background(Color.blue)
                    Button(action: removeBook) {
                        Text("remove").foregroundColor(Color.black)
                    }.frame(width: 80, height: 30, alignment: .center)
                        .background(Color.brown)
                }
                Button(action: showAllBook) {
                    Text("show all books")
                        .frame(width: 200, height: 30, alignment: .center)
                        .foregroundColor(Color.pink)
                }.background(Color.mint)
                Spacer().frame(height: 30)
                
            }
            Text("\(bookList)")
                .foregroundColor(Color.black)
                .padding(5)
                .frame(width: 250, height: 150, alignment: .topLeading)
                .background(Color.brown)
        }.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .top)
    }
    func regiterBook() {
        
    }
    func searchBook() {

    }
    func removeBook() {
        
    }
    func showAllBook() {

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
