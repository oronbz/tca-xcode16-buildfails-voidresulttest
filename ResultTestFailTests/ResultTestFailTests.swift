//
//  ResultTestFailTests.swift
//  ResultTestFailTests
//
//  Created by Oron Ben Zvi on 13/09/2024.
//

import XCTest
import ComposableArchitecture
@testable import ResultTestFail

final class ResultTestFailTests: XCTestCase {
    @MainActor
    func testVoidResult() async {
        let store = TestStore(initialState: Feature.State()) {
            Feature()
        }
        
        await store.send(.onAppear)
        await store.receive(\.voidResult.success)
    }
}
