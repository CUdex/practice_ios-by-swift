//
//  PhotoCell.swift
//  PhotoGalleyApp
//
//  Created by cudex on 2022/04/09.
//
import UIKit
import Foundation
import PhotosUI

class PhotoCell: UICollectionViewCell {
    
    @IBOutlet weak var photoImage: UIImageView! {
        didSet {
            photoImage.contentMode = .scaleAspectFill
        }
    }
    
//    func loadImage(asset: PHAsset) {
//        let imageManger = PHImageManager()
//        
//        let scale = UIScreen.main.scale
//        
//        let imageSize = CGSize(width: 150 * scale, height: 150 * scale)
//        
//        // 고화질만 받기 위한 옵션
//        let options = PHImageRequestOptions()
//        options.deliveryMode = .highQualityFormat
//        
//        self.photoImage.image = nil
//        
//        imageManger.requestImage(for: asset, targetSize: imageSize, contentMode: .aspectFill, options: options) { image, info in
////            if (info?[PHImageResultIsDegradedKey] as? Bool) == true {
////                // 저화질
////            } else {
////                // 고화질
////            }
//            // 기본적으로 저화질, 고화질 두 개의 사진을 받는다.
//            self.photoImage.image = image
//        }
//    }
    
    
    
}
