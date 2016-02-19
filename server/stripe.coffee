
StripeApi = Npm.require "stripe"

StripeSync = (key) ->
  api =
    account: [
      "retrieve" #(accountId)
      "create" #([params])
      "list" #([params])
      "update" #([params])
    ]
    balance: [
      "retrieve" #()
      "listTransactions" #([params])
      "retrieveTransaction" #(transactionId)
    ]
    charges: [
      "create" #(params)
      "list" #([params])
      "retrieve" #(chargeId)
      "capture" #(chargeId[, params])
      "refund" #(chargeId[, params])
      "update" #(chargeId[, params])
      "updateDispute" #(chargeId[, params])
      "closeDispute" #(chargeId[, params])
    ]
    coupons: [
      "create" #(params)
      "list" #([params])
      "retrieve" #(chargeId)
      "update" #(chargeId)
      "del" #(chargeId)
    ]
    customers: [
      "create" #(params)
      "list" #([params])
      "update" #(customerId[, params])
      "retrieve" #(customerId)
      "del" #(customerId)
      "createSubscription" #(customerId, params)
      "updateSubscription" #(customerId, subscriptionId, [, params])
      "cancelSubscription" #(customerId, subscriptionId, [, params])
      "listSubscriptions" #(params)
      "retrieveSubscription" #(customerId, subscriptionId)
      "createSource"
      "listSources"
      "retrieveSource"
      "updateSource"
      "deleteSource"
      "listCards" #(customerId)
      "retrieveCard" #(customerId, cardId)
      "updateCard" #(customerId, cardId[, params])
      "deleteCard" #(customerId, cardId)
      "deleteDiscount" #(customerId)
      "deleteSubscriptionDiscount" #(customerId, subscriptionId, [, params])
    ]
    disputes: [
      "list"
      "retrieve"
      "update"
      "close"
    ]
    fileUploads: [
      "retrieve"
      "list"
      "create"
    ]
    refunds: [
      "create"
      "list"
      "update"
      "retrieve"
    ]
    events: [
      "list" #([params])
      "retrieve" #(eventId)
    ]
    invoiceItems: [
      "create" #(params)
      "list" #([params])
      "update" #(invoiceItemId[, params])
      "retrieve" #(invoiceItemId)
      "del" #(invoiceItemId)
    ]
    invoices: [
      "create" #(params)
      "list" #([params])
      "update" #(invoiceId[, params])
      "retrieve" #(invoiceId)
      "retrieveLines" #(invoiceId)
      "retrieveUpcoming" #(customerId[, params])
      "pay" #(invoiceId)
    ]
    plans: [
      "create" #(params)
      "list" #([params])
      "update" #(planId[, params])
      "retrieve" #(planId)
      "del" #(planId)
    ]
    products: [
      "create" #(params)
      "list" #([params])
      "update" #(productId[, params])
      "retrieve" #(productId)
      "del" #(productId)
    ]
    recipients: [
      "create" #(params)
      "list" #([params])
      "update" #(recipientId[, params])
      "retrieve" #(recipientId)
      "del" #(recipientId)
    ]
    skus: [
      "create" #(params)
      "list" #([params])
      "update" #(skuId[, params])
      "retrieve" #(skuId)
      "del" #(skuId)
    ]
    tokens: [
      "create" #(params)
      "retrieve" #(tokenId)
    ]
    transfers: [
      "create"
      "list"
      "update"
      "retrieve"
      "reverse"
      "listTransactions"
      "createReversal"
      "listReversals"
      "retrieveReversal"
      "updateReversal"
    ]
    applicationFees: [
      "list"
      "retrieve"
      "refund"
      "createRefund"
      "listRefunds"
      "retrieveRefund"
      "updateRefund"
    ]
    countrySpecs: [
      "list"
      "retrieve"
    ]
    bitcoinReceivers: [
      "create" #(params)
      "retrieve" #(receiverId)
      "list" #([params])
    ]
    orders: [
      "create"
      "retrieve"
      "update"
      "pay"
      "list"
    ]

  stripeSync = StripeApi(key)

  _.each api, (resource, key) ->
    _.each resource, (funcName) ->
      stripeFunc = stripeSync[key][funcName]
      stripeSync[key][funcName] = Meteor.wrapAsync stripeFunc, stripeSync[key]

  stripeSync