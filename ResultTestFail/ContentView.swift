//
//  ContentView.swift
//  ResultTestFail
//
//  Created by Oron Ben Zvi on 13/09/2024.
//

import SwiftUI
import ComposableArchitecture

@Reducer
struct Feature: Reducer {
    @ObservableState
    struct State: Equatable {}
    
    enum Action {
        case onAppear
        case voidResult(Result<Void, Error>)
    }
    
    var body: some Reducer<State, Action> {
        Reduce<State, Action> { state, action in
            switch action {
            case .onAppear:
                return .run { send in
                    await send(.voidResult(.success(())))
                }
            case .voidResult:
                return .none
            }
        }
    }
}

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
