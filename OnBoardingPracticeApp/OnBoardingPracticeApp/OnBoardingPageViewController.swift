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
    // page 순서 정보를 담은 변수
    var bottomButtonMargein: NSLayoutConstraint?
    var currentIndex = 0{
        didSet {
            pageControl.currentPage = currentIndex
        }
    }
    
    var pageControl = UIPageControl()
    let startIndex = 0
    
    func makePageVC() {
        
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
        self.delegate = self
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.makePageVC()
        self.makeBottomButton()
        self.makePageControl()
        
    }
    
    // 확인 버튼 생성
    func makeBottomButton() {
        let button = UIButton()
        button.setTitle("확인", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .systemBlue
        
        // button과 action 연결
        button.addTarget(self, action: #selector(dismissPageVC), for: .touchUpInside)
        
        // view에 button 생성
        self.view.addSubview(button)
        // 오토레이아웃 설정 시 false로 설정해야 함
        button.translatesAutoresizingMaskIntoConstraints = false
        
        // 위치 설정
        
        // button.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: 0).isActive = true
        // 버튼을 가운데 정렬
        button.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        button.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        button.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive = true
        
        // 높이 설정
        button.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        // 설정 값 저장
        // 아래쪽에 equalto를 기준으로 아래쪽에 붙힘 isActice true로 활성화 필요 safearea 기준
        bottomButtonMargein = button.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: 100)
        bottomButtonMargein?.isActive = true
    }
    
    func makePageControl() {
        self.view.addSubview(pageControl)
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        pageControl.currentPageIndicatorTintColor = .black
        pageControl.pageIndicatorTintColor = .lightGray
        pageControl.numberOfPages = pages.count
        pageControl.currentPage = startIndex
        
        // touch 관련 이벤트 미사용 설정
        //pageControl.isUserInteractionEnabled = false
        
        // touch 이벤트 사용 설정
        pageControl.addTarget(self, action: #selector(pageControlTapped), for: .valueChanged)
        
        pageControl.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -50).isActive = true
        pageControl.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
    }
    
    @objc func dismissPageVC() {
        self.dismiss(animated: true, completion: nil)
    }
    @objc func pageControlTapped(sender: UIPageControl) {
        
        // 선택된 페이지에 따라 페이지를 이동하는데 기존 페이지보다 선택된 페이지 인덱스가 높으면 오른쪽으로 이동 그게 아니면 왼쪽으로 이동
        if sender.currentPage > self.currentIndex {
            self.setViewControllers([pages[sender.currentPage]], direction: .forward, animated: true, completion: nil)
        } else {
            self.setViewControllers([pages[sender.currentPage]], direction: .reverse, animated: true, completion: nil)
        }
        self.currentIndex = sender.currentPage
        
        
        buttonPresentationStyle()
        
    }
  

}

extension OnBoardingPageViewController: UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    
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
        self.currentIndex = currentIndex
        if currentIndex == pages.count - 1 {
            return pages.first
        }
        return pages[currentIndex + 1]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        
        guard let currentVC = pageViewController.viewControllers?.first else {
            return
        }
        
        guard let currentIndex = pages.firstIndex(of: currentVC) else {
            return
        }
        self.currentIndex = currentIndex
        buttonPresentationStyle()
    }
    
    func buttonPresentationStyle() {
        if currentIndex == pages.count - 1{
            self.showButton()
        }
        else {
            self.hideButton()
        }
        
        // UIView.animate(withDuration: 0.2, animations: {self.view.layoutIfNeeded()})
        UIViewPropertyAnimator.runningPropertyAnimator(withDuration: 0.2, delay: 0, options: [.curveEaseOut], animations: {self.view.layoutIfNeeded()}, completion: nil)
    }
    
    // button 설정 값 변경 함수 구현
    func showButton() {
        bottomButtonMargein?.constant = 0
    }
    func hideButton() {
        bottomButtonMargein?.constant = 100
    }
    
}
