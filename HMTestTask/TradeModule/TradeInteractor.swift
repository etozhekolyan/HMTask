//
//  TradeInteractor.swift
//  HMTestTask
//
//  Created by Nickolay Vasilchenko on 23.05.2021.
//

import Foundation

protocol TradeInteractorProtocol {
    func setupRequset()
    func sendRequest(request: RequestData)
}

class TradeInteractor: TradeInteractorProtocol {
    var presenter: TradePresenterProtocol?
    var request: RequestData?
    var htmlContent: String?
    var url: URL?
    
    init(presenter: TradePresenterProtocol? = nil) {
        self.presenter = presenter
        htmlContent =
        """
        <html>
        <body>
        <!-- TradingView Widget BEGIN -->
        <div class="tradingview-widget-container">
          <div id="tradingview_b9de6"></div>
          <div class="tradingview-widget-copyright"><a href="https://www.tradingview.com/" rel="noopener nofollow" target="_blank"><span class="blue-text">Track all markets on TradingView</span></a></div>
          <script type="text/javascript" src="https://s3.tradingview.com/tv.js"></script>
          <script type="text/javascript">
          new TradingView.widget(
          {
          "width": 375,
          "height": 321,
          "symbol": "NASDAQ:AAPL",
          "interval": "1",
          "timezone": "Europe/Moscow",
          "theme": "dark",
          "style": "1",
          "locale": "en",
          "toolbar_bg": "#f1f3f6",
          "enable_publishing": false,
          "hide_top_toolbar": true,
          "hide_legend": true,
          "save_image": false,
          "container_id": "tradingview_b9de6"
        }
          );
          </script>
        </div>
        <!-- TradingView Widget END -->
        </body>
        </html>
        """
    }
    
    func setupRequset() {
        request = RequestData(balance: 100, time: nil, investment: nil, HTMLContent: htmlContent, url: nil)
        presenter?.setupViewModel(response: setupResponse())
    }
    
    private func setupResponse() -> ResponseData {
        return ResponseData(balance: request?.balance ?? 0,
                            time: request?.time ?? 0,
                            investment: request?.investment ?? 0,
                            HTMLContent: request?.HTMLContent ?? "",
                            url: request?.url)
    }
    func sendRequest(request: RequestData) {}
}
