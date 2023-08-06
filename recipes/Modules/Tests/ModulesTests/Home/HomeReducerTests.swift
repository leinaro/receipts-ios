//
//  HomeReducer.swift
//  recipesTests
//
//  Created by Inés Rojas on 2/08/23.
//

import XCTest
import ComposableArchitecture
import Moya

@testable import Home
@testable import AppCore
@testable import Domain
@testable import Network


@MainActor
final class HomeReducerTests: XCTestCase {
    
    func testOnAppear() async {
        let provider = MoyaProvider<RecipeEndpoint>(stubClosure: MoyaProvider.immediatelyStub)

        let store = TestStore(
            initialState: HomeReducer.State(recipeList: [])) {
              HomeReducer(
                recipeRepository: RecipeRepository(
                    recipeProvider: provider
                )
              )
            }
        
        await store.send(.onAppear)
        await store.receive(.showRecipeList([]))
    }
    
    func testShowRecipeList() async {
                                                         
        let store = TestStore(
            initialState: HomeReducer.State(recipeList: [])) {
              HomeReducer()
            }
        
        await store.send(.showRecipeList(Dummy.getInstance().recipeList)) {
            $0.recipeList = Dummy.getInstance().recipeList
        }
    }

    override func setUpWithError() throws {
        try super.setUpWithError()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
    }

    func testExample() throws {
        XCTAssert(true)
    }

    func testPerformanceExample() throws {
        self.measure {
        }
    }

}
