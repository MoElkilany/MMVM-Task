//
//  GiveawayViewModelTests.swift
//  GivawayesTests
//
//  Created by Elkilany on 12/07/2024.
//

import XCTest
import Combine
@testable import Givawayes

class GiveawayViewModelTests: XCTestCase {
    
    var viewModel: GiveawayViewModel!
    var mockRepository: MockGiveawayRepository!
    var cancellable: Set<AnyCancellable>!

    override func setUp() {
        super.setUp()
        mockRepository = MockGiveawayRepository()
        GivawayesUseCases.fetchGiveaways = FetchGiveawaysUseCase(repository: mockRepository)
        GivawayesUseCases.fetchGiveawaysByPlatform = FetchGiveawaysByPlatformUseCase(repository: mockRepository)
        viewModel = GiveawayViewModel()
        cancellable = []
    }

    override func tearDown() {
        cancellable = nil
        viewModel = nil
        mockRepository = nil
        super.tearDown()
    }

    func testFetchGiveawaysSuccess() {

        let giveaways = [Giveaway(id: 1, title: "Giveaway 1"), Giveaway(id: 2, title: "Giveaway 2")]
        mockRepository.fetchAllGiveawaysResult = .success(giveaways)

        viewModel.fetchGiveaways()

        let expectation = XCTestExpectation(description: "Fetch giveaways successfully")
        viewModel.$giveawaysList
            .sink { fetchedGiveaways in
                XCTAssertEqual(fetchedGiveaways.count, 2)
                XCTAssertEqual(fetchedGiveaways[0].title, "Giveaway 1")
                XCTAssertEqual(fetchedGiveaways[1].title, "Giveaway 2")
                expectation.fulfill()
            }
            .store(in: &cancellable)
        
        wait(for: [expectation], timeout: 1.0)
    }

    func testFetchGiveawaysFailure() {
  
        let error = NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "Fetch failed"])
        mockRepository.fetchAllGiveawaysResult = .failure(error)

        viewModel.fetchGiveaways()

        let expectation = XCTestExpectation(description: "Fetch giveaways failure")
        viewModel.$giveawaysErrorMessage
            .sink { errorMessage in
                XCTAssertEqual(errorMessage, "Error fetching giveaways: Fetch failed")
                expectation.fulfill()
            }
            .store(in: &cancellable)
        
        wait(for: [expectation], timeout: 1.0)
    }
    
    func testFetchGiveawaysEpicGamesStoreSuccess() {
        
        let epicGiveaways = [Giveaway(id: 1, title: "Epic Giveaway 1"), Giveaway(id: 2, title: "Epic Giveaway 2")]
        mockRepository.fetchGiveawaysByPlatformResult = .success(epicGiveaways)

        viewModel.fetchGiveawaysEpicGamesStore()

        let expectation = XCTestExpectation(description: "Fetch Epic Games Store giveaways successfully")
        viewModel.$epicGamesStore
            .sink { fetchedGiveaways in
                XCTAssertEqual(fetchedGiveaways.count, 2)
                XCTAssertEqual(fetchedGiveaways[0].title, "Epic Giveaway 1")
                XCTAssertEqual(fetchedGiveaways[1].title, "Epic Giveaway 2")
                expectation.fulfill()
            }
            .store(in: &cancellable)
        
        wait(for: [expectation], timeout: 1.0)
    }

    func testFetchGiveawaysEpicGamesStoreFailure() {

        let error = NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "Fetch failed"])
        mockRepository.fetchGiveawaysByPlatformResult = .failure(error)
     
        viewModel.fetchGiveawaysEpicGamesStore()

        let expectation = XCTestExpectation(description: "Fetch Epic Games Store giveaways failure")
        viewModel.$epicGamesStoreErrorMessage
            .sink { errorMessage in
                XCTAssertEqual(errorMessage, "Fetch failed")
                expectation.fulfill()
            }
            .store(in: &cancellable)
        
        wait(for: [expectation], timeout: 1.0)
    }
}
