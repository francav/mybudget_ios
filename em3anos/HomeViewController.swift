//
//  HomeViewController.swift
//  em3anos
//
//  Created by Victor Franca on 22/08/18.
//  Copyright © 2018 Victor Franca. All rights reserved.
//

import UIKit

class HomeViewController: UIPageViewController {
    
    fileprivate lazy var pages: [UIViewController] = {
        return [
            self.getViewController(withIdentifier: "projecaoVC"),
            self.getViewController(withIdentifier: "lancamentoVC")
        ]
    }()
    
    fileprivate func getViewController(withIdentifier identifier: String) -> UIViewController
    {
        return UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: identifier)
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.dataSource = self as UIPageViewControllerDataSource
        self.delegate   = (self as UIPageViewControllerDelegate)
        
        if let firstVC = pages.first
        {
            setViewControllers([firstVC], direction: .forward, animated: true, completion: nil)
        }
    }
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return self.pages.count
    }
    
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        return 0
    }
    
    @IBAction func unwindToHomeVC(segue: UIStoryboardSegue) {
        
    }

}

extension HomeViewController: UIPageViewControllerDataSource
{
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        guard let viewControllerIndex = pages.index(of: viewController) else { return nil }
        
        let previousIndex = viewControllerIndex - 1
        
        guard previousIndex >= 0          else { return pages.last }
        
        guard pages.count > previousIndex else { return nil        }
        
        return pages[previousIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController?
    {
        guard let viewControllerIndex = pages.index(of: viewController) else { return nil }
        
        let nextIndex = viewControllerIndex + 1
        
        guard nextIndex < pages.count else { return pages.first }
        
        guard pages.count > nextIndex else { return nil         }
        
        return pages[nextIndex]
    }
    
//    func presentationCountForPageViewController(pageViewController: UIPageViewController) -> Int {
//        return pages.count
//    }
//
//    func presentationIndexForPageViewController(pageViewController: UIPageViewController) -> Int {
//        guard let firstViewController = viewControllers?.first,
//            let firstViewControllerIndex = pages.index(of: firstViewController) else {
//                return 0
//        }
//
//        return firstViewControllerIndex
//    }
}


extension HomeViewController: UIPageViewControllerDelegate { }


