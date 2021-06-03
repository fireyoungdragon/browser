import UIKit
import WebKit

class ViewController: UIViewController {

    
    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var textField: UITextField!
    @IBAction func searchTap(_ sender: Any) {
        if let text = textField.text {
        if let search = URL(string: text) {
            let field = URLRequest(url: search)
            webView.load(field)
            
            }
        }
    }
    @IBAction func backTap(_ sender: Any) {
        webView.goBack()
    }
    @IBAction func forwardTap(_ sender: Any) {
        webView.goForward()
    }
    @IBOutlet weak var progressBar: UIProgressView!
    

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.webView.addObserver(self, forKeyPath: "estimatedProgress", options: .new, context: nil)
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == "estimatedProgress" {
            print(self.webView.estimatedProgress)
            self.progressBar.progress = Float(self.webView.estimatedProgress)
        }
    }
    
    /*var boolVar: Bool
    var timer: Timer
    
    func whenStartLoadWebView() {
        self.progressBar.progress = 0.0
        self.boolVar = false
        self.timer = Timer.scheduledTimer(timeInterval: 0.01667, target: self)
    }
     
     progressBar.progress = Float(webView.estimatedProgress)
     
    */


}

