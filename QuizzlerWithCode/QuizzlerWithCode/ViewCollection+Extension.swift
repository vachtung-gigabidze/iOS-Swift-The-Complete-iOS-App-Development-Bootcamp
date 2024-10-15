import SwiftUI

extension UIViewController {
    private struct Preview : UIViewControllerRepresentable {
        let viewController: UIViewController
        
        
        
        func makeUIViewController(context: Context) -> some UIViewController {
            viewController
        }
        
        func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
            
        }
    }
    
    func showPreview() -> some View {
        Preview(viewController: self).edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
    }
    
}
