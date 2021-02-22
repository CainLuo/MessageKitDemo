//
//  MockUser.swift
//  MessageKitDemo
//
//  Created by YYKJ0048 on 2021/2/22.
//

import Foundation
import MessageKit

struct MockUser: SenderType, Equatable {
    var senderId: String
    var displayName: String
}
