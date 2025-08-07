//
//  model.swift
//  hyperosApp
//
//  Created by Alejandro Visiedo on 6/8/25.
//  Copyright © 2025 Apple. All rights reserved.
//

enum VirtualMachineType {
    case Windows
    case Linux
    case macOS
    case BSD
}

struct VirtualMachineDisk {
    var path: String
    var size: Int
}

struct VirtualMachine {
    var name: String
    var type: VirtualMachineType
    var cpus: Int
    var memory: Int
    var isoInstallPath: String?
    var disks: [VirtualMachineDisk]
}

// Builder for creating VirtualMachine objects
class VirtualMachineBuilder {
    var data: VirtualMachine
    
    func withName(_ name: String) -> VirtualMachineBuilder {
        self.data.name = name
        return self
    }
    
    func withType(_ type: VirtualMachineType) -> VirtualMachineBuilder {
        self.data.type = type
        return self
    }
    
    func withCPUs(_ cpus: Int) -> VirtualMachineBuilder {
        self.data.cpus = cpus
        return self
    }
    
    func withMemory(_ memory: Int) -> VirtualMachineBuilder {
        self.data.memory = memory
        return self
    }
    
    func withISOInstallPath(_ path: String?) -> VirtualMachineBuilder {
        self.data.isoInstallPath = path
        return self
    }
    
    func withDisk(_ disk: VirtualMachineDisk) -> VirtualMachineBuilder {
        self.data.disks.append(disk)
        return self
    }
    
    func build() -> VirtualMachine {
        return self.data
    }
    
    init (_ vmType: VirtualMachineType) {
        switch(vmType) {
        case .Windows:
            // https://techcommunity.microsoft.com/blog/itopstalkblog/how-to-run-a-windows-11-vm-on-hyper-v/3713948
            self.data = VirtualMachine(name: "", type: vmType, cpus: 4, memory: 4096, isoInstallPath: nil, disks: [])
            break
        case .Linux:
            // https://docs.fedoraproject.org/en-US/quick-docs/virtualization-getting-started/
            self.data = VirtualMachine(name: "", type: vmType, cpus: 2, memory: 2048, isoInstallPath: nil, disks: [])
            break
        case .macOS:
            // https://discussions.apple.com/thread/255737037?sortBy=rank
            self.data = VirtualMachine(name: "", type: vmType, cpus: 2, memory: 4096, isoInstallPath: nil, disks: [])
            break
        case .BSD:
            // https://www.openbsd.org/faq/faq16.html
            self.data = VirtualMachine(name: "", type: vmType, cpus: 2, memory: 2048, isoInstallPath: nil, disks: [])
            break
        }
    }
}


