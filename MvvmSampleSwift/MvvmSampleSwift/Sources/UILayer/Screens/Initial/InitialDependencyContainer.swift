//
//  InitialDependencyContainer.swift
//  MvvmSampleSwift
//
//  Created by Boyan Yankov on 2019-W29-20-Jul-Sat.
//  Copyright © 2019 boyankov@yahoo.com. All rights reserved.
//

import Foundation
import SimpleLogger

class InitialDependencyContainer {
    
    // MARK: - Initialization
    init() {
        // setup
        Logger.success.message()
    }
    
    deinit {
        Logger.fatal.message()
    }
    
    // MARK: - Factory methods
    // MARK: - Initial screen
    func makeInitialViewController() -> InitialViewController {
        let vm: InitialViewModel = self.makeInitialViewModel()
        let fooVCFactory: () -> FooViewController = {
            return self.makeFooViewController()
        }
        let vc: InitialViewController =
            InitialViewController(viewModel: vm,
                                  fooVCFactory: fooVCFactory)
        return vc
    }
    
    private func makeInitialViewModel() -> InitialViewModel {
        let result: InitialViewModel = InitialViewModelImpl()
        return result
    }
    
    // MARK: - Foo screen
    private func makeFooViewController() -> FooViewController {
        let container: FooDependencyContainer = FooDependencyContainer(initialDependencyContainer: self)
        let vc: FooViewController = container.makeFooViewConroller()
        return vc
    }
}
