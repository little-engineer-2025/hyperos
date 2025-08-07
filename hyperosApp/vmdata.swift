//
//  vmdata.swift
//  hyperosApp
//
//  Created by Alejandro Visiedo on 7/8/25.
//  Copyright © 2025 Apple. All rights reserved.
//

import Foundation

enum VMType: UInt32 {
    case Windows
    case Linux
    case MacOS
    case BSD
}
struct VMData {
    let vmType:VMType
    var bundleName:String
    var machineIdentifierPath:String
    
    var cpus:Int
    var memory:UInt64
    var mainDiskSize:Int64
    var installerISOPath: URL?
    var installerISOHash: String

    var diskImagePath: String
    var efiVariableStorePath: String
    var diskImages:[String]
    var needsInstall:Bool = true
}
