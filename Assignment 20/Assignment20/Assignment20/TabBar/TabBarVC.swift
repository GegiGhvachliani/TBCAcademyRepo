
import UIKit

class TabBarVC: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setupTabBar()
    }
    
    //MARK: Methods
    
    private func setupTabBar() {
        configureTabs()
        configureTabBarAppearance()
    }
    private func configureTabs() {
        let vc1 = NewsVC()
        let vc2 = APPOTMVC()
        
        vc1.tabBarItem.image = UIImage(named: "news")
        vc2.tabBarItem.image = UIImage(named: "APPOTM")
        
        vc1.tabBarItem.title = "News"
        vc2.tabBarItem.title = "APPOTM"
        
        let nav1 = UINavigationController(rootViewController: vc1)
        let nav2 = UINavigationController(rootViewController: vc2)
        
        setViewControllers([nav1, nav2], animated: true)
    }
    
    private func configureTabBarAppearance() {
        let blurEffect = UIBlurEffect(style: .light)
        
        let blurView = UIVisualEffectView(effect: blurEffect)
        
        blurView.frame = tabBar.bounds
        blurView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        tabBar.insertSubview(blurView, at: 0)
        
        tabBar.backgroundColor = .clear
        
        let tintColor = UIColor.systemBlue.withAlphaComponent(0.2)
        tabBar.barTintColor = tintColor
        
        tabBar.tintColor = .systemBlue
        tabBar.unselectedItemTintColor = .gray
        
       }
    
    
}

#Preview {
    TabBarVC()
}
