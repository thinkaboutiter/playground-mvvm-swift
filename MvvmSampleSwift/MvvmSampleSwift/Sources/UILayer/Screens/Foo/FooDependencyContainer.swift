//
//  FooDependencyContainer.swift
//  MvvmSampleSwift
//
//  Created by Boyan Yankov on 2019-W29-21-Jul-Sun.
//  Copyright © 2019 boyankov@yahoo.com. All rights reserved.
//

import Foundation
import SimpleLogger

class FooDependecyContainer {
    
    // MARK: - Initialization
    init() {
        // setup
        // NOTE: If needed refactor initializer
        // to have parent container injected as parameter
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
