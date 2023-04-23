//
//  ContentView.swift
//  ChatGPT
//
//  Created by Mert Gaygusuz on 22.04.2023.
//

import SwiftUI

struct ChatView: View {
    @ObservedObject var viewModel = ViewModel()
    var body: some View {
        VStack {
            HStack {
                Text("mergaAI")
                    .font(.largeTitle)
                    .bold()
                
                Image(systemName: "bubble.left.fill")
                    .font(.system(size: 26))
                    .foregroundColor(Color.blue)
            }
            ScrollView {
                ForEach(viewModel.messages.filter({$0.role != .system}), id: \.id) { message in
                    messageView(message: message)
                }.rotationEffect(.degrees(180))
            }
            .rotationEffect(.degrees(180))
            
            HStack {
                TextField("Enter a text message", text: $viewModel.currentInput)
                    .padding()
                    .background(.gray.opacity(0.1))
                    .cornerRadius(12)
                Button {
                    viewModel.sendMessage()
                } label: {
                    Image(systemName: "paperplane.fill")
                        .font(.system(size: 26))
                        .padding()
                }

            }
        }
        .padding()
    }
    
    func messageView(message: Message) -> some View {
        HStack {
            if message.role == .user {Spacer()}
            Text(message.content)
                .padding()
                .foregroundColor(message.role == .user ? .white : .black)
                .background(message.role == .user ? .blue.opacity(0.8): .gray.opacity(0.2))
                .cornerRadius(15)
            if message.role == .assistant {Spacer()}
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView()
    }
}
