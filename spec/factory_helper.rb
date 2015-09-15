  Customer.create(
                  first_name: "Mike",
                  last_name:  "Dorrance"
                  )
  Customer.create(
                  first_name: "Joe",
                  last_name:  "Sampson"
                  )
  Merchant.create(
                  name: "Target"
                  )
  Merchant.create(
                  name: "Walmart"
                  )
  Item.create(
              name: "Pants",
              description: "Blue jeans",
              unit_price: "75107",
              merchant_id: 1
              )
  Item.create(
              name: "Shirts",
              description: "Button down",
              unit_price: "75",
              merchant_id: 1
              )
  Item.create(
              name: "Socks",
              description: "White tube",
              unit_price: "75",
              merchant_id: 2
              )
  Invoice.create(
                 customer_id: 1,
                 merchant_id: 1,
                 status: "shipped"
                 )
  Invoice.create(
                 customer_id: 1,
                 merchant_id: 2,
                 status: "shipped"
                )
  InvoiceItem.create(
                     item_id: 1,
                     invoice_id: 1,
                     quantity: "5",
                     unit_price: "13635"
                     )
  InvoiceItem.create(
                     item_id: 2,
                     invoice_id: 1,
                     quantity: "2",
                     unit_price: "13635"
                     )
  InvoiceItem.create(
                     item_id: 3,
                     invoice_id: 2,
                     quantity: "4",
                     unit_price: "13635"
                     )
  Transaction.create(
                     invoice_id: 1,
                     credit_card_number: "4654405418249632",
                     credit_card_expiration_date: null,
                     result: "success"
                     )
  Transaction.create(
                     invoice_id: 2,
                     credit_card_number: "4654405418249632",
                     credit_card_expiration_date: null,
                     result: "success"
                     )
  Transaction.create(
                     invoice_id: 1,
                     credit_card_number: "4654405418249632",
                     credit_card_expiration_date: null,
                     result: "failed"
                     )
