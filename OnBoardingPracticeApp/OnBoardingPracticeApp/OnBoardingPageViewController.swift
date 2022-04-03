//
//  OnBoardingPageViewController.swift
//  OnBoardingPracticeApp
//
//  Created by cudex on 2022/04/03.
//

import UIKit

class OnBoardingPageViewController: UIPageViewController {
    
    // page를 담은 array 생성
    var pages = [UIViewController]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let itemVC1 = OnBoardingItemViewController.init(nibName: "OnBoardingItemViewController", bundle: nil)
        itemVC1.mainText = "first"
        itemVC1.topImg = UIImage(systemName: "pencil")
        let itemVC2 = OnBoardingItemViewController.init(nibName: "OnBoardingItemViewController", bundle: nil)
        itemVC2.mainText = "second"
        let itemVC3 = OnBoardingItemViewController.init(nibName: "OnBoardingItemViewController", bundle: nil)
        itemVC3.mainText = "third"
        itemVC3.topImg = UIImage(systemName: "scribble")
        pages.append(itemVC1)
        pages.append(itemVC2)
        pages.append(itemVC3)
        
        // 시작 페이지 화면 설정
        setViewControllers([itemVC1], direction: .forward, animated: true, completion: nil)
        
        self.dataSource = self
    }
  

}

extension OnBoardingPageViewController: UIPageViewControllerDataSource {
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        // 현재 page index
        guard let currentIndex = pages.firstIndex(of: viewController) else {
            return nil
        }
        if currentIndex == 0 {
            return pages.last
        }
        return pages[currentIndex - 1]
        
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        guard let currentIndex = pages.firstIndex(of: viewController) else {
            return nil
        }
        
        if currentIndex == pages.count - 1 {
            return pages.first
        }
        return pages[currentIndex + 1]
    }
    
    
}
