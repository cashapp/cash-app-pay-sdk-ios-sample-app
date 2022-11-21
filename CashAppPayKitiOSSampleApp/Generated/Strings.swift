// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return prefer_self_in_static_references

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
internal enum L10n {
  /// The button title for adding the product to the cart
  internal static let addToCart = L10n.tr("Localizable", "addToCart", fallback: "Add To Cart")
  /// The button title to continue to checkout
  internal static let continueToCheckout = L10n.tr("Localizable", "continueToCheckout", fallback: "Continue To Checkout")
  /// The button title to place the order from the cart
  internal static let placeOrder = L10n.tr("Localizable", "placeOrder", fallback: "Place Order")
  internal enum Cart {
    /// The label for the contact of the current cart
    internal static let contact = L10n.tr("Localizable", "cart.contact", fallback: "CONTACT")
    /// The title of the order summary section in the cart
    internal static let orderSummary = L10n.tr("Localizable", "cart.orderSummary", fallback: "ORDER SUMMARY")
    /// The label for the payment of the current cart
    internal static let payment = L10n.tr("Localizable", "cart.payment", fallback: "PAYMENT")
    /// The label for the subtotal of the current cart
    internal static let subtotal = L10n.tr("Localizable", "cart.subtotal", fallback: "Subtotal")
    /// The label for the taxes on the current cart
    internal static let taxes = L10n.tr("Localizable", "cart.taxes", fallback: "Taxes")
    /// The label for the total of the current cart
    internal static let total = L10n.tr("Localizable", "cart.total", fallback: "Total")
    internal enum Contact {
      /// The text for contact informations
      internal static let details = L10n.tr("Localizable", "cart.contact.details", fallback: "By providing your phone number, you agree to receive text messages related to your order. Standard message rates may apply. Reply STOP to opt out of receiving any future text messages related to your order.")
    }
    internal enum Payment {
      /// Title of the add card row in checkout
      internal static let addCard = L10n.tr("Localizable", "cart.payment.addCard", fallback: "Add Credit/Debit card")
      /// Title of the Cash App Pay section the payments
      internal static let cashAppPay = L10n.tr("Localizable", "cart.payment.cashAppPay", fallback: "Cash App Pay")
      /// Title of the pay later row in checkout
      internal static let payLater = L10n.tr("Localizable", "cart.payment.payLater", fallback: "Pay later with Afterpay")
      /// The subtitle of the payments section
      internal static let subtitle = L10n.tr("Localizable", "cart.payment.subtitle", fallback: "All transactions are secure and encrypted")
    }
  }
  internal enum Confirmation {
    /// Title of the payment added method where the parameter is the name of the payment method
    internal static func paymentAdded(_ p1: Any) -> String {
      return L10n.tr("Localizable", "confirmation.paymentAdded", String(describing: p1), fallback: "Payment method added %@")
    }
  }
  internal enum GrantAcceptance {
    /// On the grant acceptance screen instructions where to continue the order. The parameter is the name of the app
    internal static func continueOrder(_ p1: Any) -> String {
      return L10n.tr("Localizable", "grantAcceptance.continueOrder", String(describing: p1), fallback: "Continue on %@ to place your order.")
    }
    /// Subtitle of the grant acceptance screen
    internal static let orderInProgress = L10n.tr("Localizable", "grantAcceptance.orderInProgress", fallback: "Order in Progress")
  }
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name vertical_whitespace_opening_braces

// MARK: - Implementation Details

extension L10n {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg..., fallback value: String) -> String {
    let format = BundleToken.bundle.localizedString(forKey: key, value: value, table: table)
    return String(format: format, locale: Locale.current, arguments: args)
  }
}

// swiftlint:disable convenience_type
private final class BundleToken {
  static let bundle: Bundle = {
    #if SWIFT_PACKAGE
    return Bundle.module
    #else
    return Bundle(for: BundleToken.self)
    #endif
  }()
}
// swiftlint:enable convenience_type
