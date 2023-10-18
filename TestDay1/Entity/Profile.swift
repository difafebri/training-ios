//
//  Profile.swift
//  TestDay1
//
//  Created by P090MMCTSE003 on 18/10/23.
//

import Foundation

struct Profile{
    let name: String
    let job: String
    let age: String
    let bio: String
}

enum ProfileType: String{
    case name = "Nama"
    case job = "Pekerjaan"
    case age = "Usia"
    case bio = "Deskripsi Diri"
}
