//
//  Base64Image.swift
//  CryptoWallet
//
//  Created by Administrator on 7/25/23.
//

import SwiftUI

extension Image {
    init?(base64String: String) {
        guard let data = Data(base64Encoded: base64String) else { return nil }
        guard let uiImage = UIImage(data: data) else { return nil }
        self = Image(uiImage: uiImage)
    }
}
