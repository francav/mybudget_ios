//
//  HomeViewController.swift
//  em3anos
//
//  Created by Victor Franca on 22/08/18.
//  Copyright © 2018 Victor Franca. All rights reserved.
//

import UIKit

class HomeViewController: UIPageViewController {
    
    static var periodoIndex = -1
    
    static let periodos: [String] = ["08/2018", "09/2018", "10/2018", "11/2018", "12/2018", "01/2019", "02/2019", "03/2019", "04/2019", "05/2019", "06/2019", "07/2019", "08/2019", "09/2019", "10/2019", "11/2019", "12/2019", "01/2020", "02/2020", "03/2020", "04/2020", "05/2020", "06/2020", "07/2020", "08/2020", "09/2020", "10/2020", "11/2020", "12/2020", "01/2021", "02/2021", "03/2021", "04/2021", "05/2021", "06/2021", "07/2021"]
    
    fileprivate lazy var pages: [UIViewController] = {
        return [
            self.getViewController(withIdentifier: "saldosVC"),
            self.getViewController(withIdentifier: "lancamentoVC"),
            self.getViewController(withIdentifier: "monitorOrcamentoVC"),
            
        ]
    }()
    
    fileprivate func getViewController(withIdentifier identifier: String) -> UIViewController
    {
        return UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: identifier)
    }
    
    override func viewDidLoad()
    {
        HomeViewController.periodoIndex = HomeViewController.periodos.index(where: {$0 == AnoMes(date: Date.init()).string()})!

        super.viewDidLoad()
        self.dataSource = self as UIPageViewControllerDataSource
        self.delegate   = (self as UIPageViewControllerDelegate)
        
        if let firstVC = pages[1] as UIViewController?
        {
            setViewControllers([firstVC], direction: .forward, animated: true, completion: nil)
        }
        
    }
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return self.pages.count
    }
    
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        return 1
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


