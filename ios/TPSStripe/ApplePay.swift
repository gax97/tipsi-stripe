//
//  ApplePay.swift
//  TPSStripe
//
//  Created by Danilo Gacevic on 22.3.21..
//  Copyright © 2021 Tipsi. All rights reserved.
//

import Foundation
import Stripe

RCT_EXTERN_METHOD(
                  updateApplePaySummaryItems:(NSArray *)summaryItems
                  resolver: (RCTPromiseResolveBlock)resolve
                  rejecter: (RCTPromiseRejectBlock)reject)
                  
@objc
class ApplePayUpdate : NSObject {
    @objc(updateApplePaySummaryItems:resolver:rejecter:)
        func updateApplePaySummaryItems(summaryItems: NSArray, resolver resolve: @escaping RCTPromiseResolveBlock, rejecter reject: @escaping RCTPromiseRejectBlock) {
            if (shippingMethodUpdateHandler == nil && shippingContactUpdateHandler == nil) {
                reject(ApplePayErrorType.Failed.rawValue, "You can use this method only after either onDidSetShippingMethod or onDidSetShippingContact events emitted", nil)
                return
            }
            var paymentSummaryItems: [PKPaymentSummaryItem] = []
            if let items = summaryItems as? [[String : Any]] {
                for item in items {
                    let label = item["label"] as? String ?? ""
                    let amount = NSDecimalNumber(string: item["amount"] as? String ?? "")
                    let type = Mappers.mapToPaymentSummaryItemType(type: item["type"] as? String)
                    paymentSummaryItems.append(PKPaymentSummaryItem(label: label, amount: amount, type: type))
                }
            }
            shippingMethodUpdateHandler?(PKPaymentRequestShippingMethodUpdate.init(paymentSummaryItems: paymentSummaryItems))
            shippingContactUpdateHandler?(PKPaymentRequestShippingContactUpdate.init(paymentSummaryItems: paymentSummaryItems))
            self.shippingMethodUpdateHandler = nil
            self.shippingContactUpdateHandler = nil
            resolve(NSNull())
        }
}
