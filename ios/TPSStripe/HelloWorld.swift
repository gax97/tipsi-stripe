//
//  HelloWorld.swift
//  TPSStripe
//
//  Created by Danilo Gacevic on 22.3.21..
//  Copyright © 2021 Tipsi. All rights reserved.
//

import Foundation

@objc(MyModule)
class MyModule: NSObject {
    var name: String!
    var value: Int!

    @objc
    func construct(_ name: String, value: Int) {
        self.name = name
        self.value = value
    }
