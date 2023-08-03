//
//  HomeReducer.swift
//  recipesTests
//
//  Created by Inés Rojas on 2/08/23.
//

import XCTest
import ComposableArchitecture

@testable import recipes

@MainActor
final class HomeReducerTests: XCTestCase {
    let recipeList: [Recipe] = [
        Recipe(
            name: "Arroz con pollo",
            imageUrl: "https://picsum.photos/300/100",
            ingredient: ["Arroz", "Pollo", "Sal", "Agua", "Salchichas"],
            description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."
        )
    ]
    
    func testOnAppear() async {
        let store = TestStore(
            initialState: HomeReducer.State(recipeList: [])) {
              HomeReducer()
            }
        
        await store.send(.onAppear) {
            $0.recipeList = self.recipeList
        }

    }

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
