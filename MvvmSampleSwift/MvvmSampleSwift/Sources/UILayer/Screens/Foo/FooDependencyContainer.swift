//
//  FooDependencyContainer.swift
//  MvvmSampleSwift
//
//  Created by Boyan Yankov on 2019-W29-21-Jul-Sun.
//  Copyright © 2019 boyankov@yahoo.com. All rights reserved.
//

import Foundation
import SimpleLogger

class FooDependencyContainer {
    
    // MARK: - Initialization
    init(initialDependencyContainer: InitialDependecyContainer) {
        // setup
        // NOTE: If needed obtain and shared data from parent container
        Logger.success.message()
    }
    
    deinit {
        Logger.fatal.message()
    }
    
    // MARK: - Factory methods
    func makeFooViewConroller() -> FooViewController {
        let vm: FooViewModel = self.makeFooViewModel()
        let vc: FooViewController = FooViewController(viewModel: vm)
        return vc
    }
    
    private func makeFooViewModel() -> FooViewModel {
        let result: FooViewModel = FooViewModelImpl()
        return result
    }
}
