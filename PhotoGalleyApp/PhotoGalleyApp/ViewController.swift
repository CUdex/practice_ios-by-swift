//
//  ViewController.swift
//  PhotoGalleyApp
//
//  Created by cudex on 2022/04/09.
//

import UIKit
import PhotosUI

class ViewController: UIViewController {

    @IBOutlet weak var photoCollectionView: UICollectionView!
    var fetchResults = PHFetchResult<PHAsset>()
    var arrayOfImages = [UIImage]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.title = "Photo Galley App"
        
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: UIScreen.main.bounds.width / 2 - 1 , height: 200)
        // 옆 간격
        layout.minimumInteritemSpacing = 1
        // 위아래 간격
        layout.minimumLineSpacing = 2
        photoCollectionView.collectionViewLayout = layout
        photoCollectionView.dataSource = self
        makeNavigationItem()
    }
    
    func makeNavigationItem() {
        let photoItem = UIBarButtonItem(image: UIImage(systemName: "photo.on.rectangle"), style: .done, target: self, action: #selector(checkPermission))
        photoItem.tintColor = .black.withAlphaComponent(0.7)
        self.navigationItem.rightBarButtonItem = photoItem
        
        let refreshItem = UIBarButtonItem(image: UIImage(systemName: "arrow.clockwise"), style: .done, target: self, action: #selector(refresh))
        self.navigationItem.leftBarButtonItem = refreshItem
    }
    
    
    // 권한을 검증하는 함수
    @objc func checkPermission() {
        // 권한 허용
        if PHPhotoLibrary.authorizationStatus() == .authorized || PHPhotoLibrary.authorizationStatus() == .limited {
            DispatchQueue.main.async {
                self.showGalley()
            }
        }
        // 권한 거부 시
        else if PHPhotoLibrary.authorizationStatus() == .denied {
            DispatchQueue.main.async {
                self.showPermissionAlert()
            }
            
        }
        // 권한을 물어보지 않은 상태
        else if PHPhotoLibrary.authorizationStatus() == .notDetermined {
            // info.plist에 정의된 privacy설정에 따라 문구가 출력됨
            PHPhotoLibrary.requestAuthorization { status in
                print(status)
                // 다시 질문할 수 있도록 설정 없으면 다시 물어보지 않아 `질문창만 사라지고 그 다음 동작이 이어지지 않음
                self.checkPermission()
            }
            
        }
    }
    
    func showPermissionAlert() {
        // alert 추가
        let alert = UIAlertController(title: "포토라이브러리 접근 권한 부여 부탁합니다.", message: nil, preferredStyle: .alert)
        // 닫기 버튼 추가
        alert.addAction(UIAlertAction(title: "닫기", style: .cancel, handler: nil))
        // 권한 설정 창 가기 버튼 추가
        alert.addAction(UIAlertAction(title: "설정으로 가기", style: .default, handler: { action in
            guard let URL = URL(string: UIApplication.openSettingsURLString) else {
                return
            }
            if UIApplication.shared.canOpenURL(URL) {
                UIApplication.shared.open(URL, options: [:], completionHandler: nil)
            }
            
        }))
        
        
        self.present(alert, animated: true, completion: nil)
    }
    
    @objc func showGalley() {
        let library = PHPhotoLibrary.shared()
        var configuration = PHPickerConfiguration(photoLibrary: library)
        // 선택가능한 수
        configuration.selectionLimit = 10
        
        let picker = PHPickerViewController(configuration: configuration)
        picker.modalPresentationStyle = .fullScreen
        picker.delegate = self
        present(picker, animated: true)
    }
    
    @objc func refresh() {
        self.photoCollectionView.reloadData()
    }


}

extension ViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrayOfImages.count
        // return fetchResults.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoCell", for: indexPath) as! PhotoCell
        // let asset = fetchResults[indexPath.row]
        // cell.loadImage(asset: asset)
        // loadImage(asset: asset)
        cell.photoImage.image = arrayOfImages[indexPath.row]
    
        return cell
    }
}

extension ViewController: PHPickerViewControllerDelegate {
    
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        
        // 이미지의 고유 값을 가져온다.
        let identifiers = results.map {
            $0.assetIdentifier ?? ""
        }
        // fetchResults = PHAsset.fetchAssets(withLocalIdentifiers: identifiers, options: nil)
        
        // local에 있는 asset 가져오기
        let fetchAssets = PHAsset.fetchAssets(withLocalIdentifiers: identifiers, options: nil)
//                fetchAssets.enumerateObjects { assets, index, stop in
//
//                    // image를 불러오는 중 로드를 스톱하고 싶을 때
//                    if index == 2 {
//                        stop.pointee = true
//                    }
//                }
        fetchAssets.enumerateObjects { assets, index, stop in

            let imageManger = PHImageManager()

            let scale = UIScreen.main.scale

            let imageSize = CGSize(width: 150 * scale, height: 150 * scale)

//            DispatchQueue.main.async {
//                <#code#>
//            }
            imageManger.requestImage(for: assets, targetSize: imageSize, contentMode: .aspectFill, options: nil) { image, info in
                // 기본적으로 저화질, 고화질 두 개의 사진을 받는다.
                if (info?[PHImageResultIsDegradedKey] as? Bool) == false {
                    self.arrayOfImages.append(image!)
                    
                    self.photoCollectionView.reloadData()
                }
                
            }
            
        }
        
        self.dismiss(animated: true, completion: nil)
    }
}

