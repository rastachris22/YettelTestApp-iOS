// swiftlint:disable all
// swift-format-ignore-file
// swiftformat:disable all
// Generated using tuist — https://github.com/tuist/tuist

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name
public enum YettelTestAppIOSStrings: Sendable {
  /// HUF
  public static let currency = YettelTestAppIOSStrings.tr("Localizable", "currency")
  /// National vignettes
  public static let highwayVignettesNationalVignettesTitle = YettelTestAppIOSStrings.tr("Localizable", "highway_vignettes__national_vignettes_title")
  /// Pay
  public static let highwayVignettesPayButtonTitle = YettelTestAppIOSStrings.tr("Localizable", "highway_vignettes__pay_button_title")
  /// E-vignette
  public static let highwayVignettesTitle = YettelTestAppIOSStrings.tr("Localizable", "highway_vignettes__title")
  /// Yearly counties vignettes
  public static let highwayVignettesYearlyVignettesTitle = YettelTestAppIOSStrings.tr("Localizable", "highway_vignettes__yearly_vignettes_title")
  /// Payable amount
  public static let paymentConfirmationAmountLabel = YettelTestAppIOSStrings.tr("Localizable", "payment_confirmation__amount_label")
  /// Cancel
  public static let paymentConfirmationCancelButtonTitle = YettelTestAppIOSStrings.tr("Localizable", "payment_confirmation__cancel_button_title")
  /// Next
  public static let paymentConfirmationConfirmationButtonTitle = YettelTestAppIOSStrings.tr("Localizable", "payment_confirmation__confirmation_button_title")
  /// Payment confirmation
  public static let paymentConfirmationConfirmationLabel = YettelTestAppIOSStrings.tr("Localizable", "payment_confirmation__confirmation_label")
  /// Platenumber
  public static let paymentConfirmationPlatenumberLabel = YettelTestAppIOSStrings.tr("Localizable", "payment_confirmation__platenumber_label")
  /// E-vignette
  public static let paymentConfirmationTitle = YettelTestAppIOSStrings.tr("Localizable", "payment_confirmation__title")
  /// Transaction fee
  public static let paymentConfirmationTrxFeeLabel = YettelTestAppIOSStrings.tr("Localizable", "payment_confirmation__trx_fee_label")
  /// Vignette type
  public static let paymentConfirmationVignetteTypeLabel = YettelTestAppIOSStrings.tr("Localizable", "payment_confirmation__vignette_type_label")
  /// Ok
  public static let paymentResultButtonTitle = YettelTestAppIOSStrings.tr("Localizable", "payment_result__button_title")
  /// Successful payment
  public static let paymentResultTitle = YettelTestAppIOSStrings.tr("Localizable", "payment_result__title")
  /// daily (1 day)
  public static let vignetteTypeDayTitle = YettelTestAppIOSStrings.tr("Localizable", "vignette_type_day_title")
  /// monthly
  public static let vignetteTypeMonthTitle = YettelTestAppIOSStrings.tr("Localizable", "vignette_type_month_title")
  /// National
  public static let vignetteTypeOtherPaymentConfirmationTitle = YettelTestAppIOSStrings.tr("Localizable", "vignette_type_other_payment_confirmation_title")
  /// weekly (10 days)
  public static let vignetteTypeWeekTitle = YettelTestAppIOSStrings.tr("Localizable", "vignette_type_week_title")
  /// Yearly counties
  public static let vignetteTypeYearPaymentConfirmationTitle = YettelTestAppIOSStrings.tr("Localizable", "vignette_type_year_payment_confirmation_title")
  /// Payable amount
  public static let yearlyHighwayVignettesAmountLabel = YettelTestAppIOSStrings.tr("Localizable", "yearly_highway_vignettes__amount_label")
  /// Next
  public static let yearlyHighwayVignettesPayButtonTitle = YettelTestAppIOSStrings.tr("Localizable", "yearly_highway_vignettes__pay_button_title")
  /// E-vignette
  public static let yearlyHighwayVignettesTitle = YettelTestAppIOSStrings.tr("Localizable", "yearly_highway_vignettes__title")
  /// Yearly counties vignettes
  public static let yearlyHighwayVignettesYearlyVignettesTitle = YettelTestAppIOSStrings.tr("Localizable", "yearly_highway_vignettes__yearly_vignettes_title")
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name

// MARK: - Implementation Details

extension YettelTestAppIOSStrings {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg...) -> String {
    let format = Bundle.module.localizedString(forKey: key, value: nil, table: table)
    return String(format: format, locale: Locale.current, arguments: args)
  }
}

// swiftlint:disable convenience_type
// swiftlint:enable all
// swiftformat:enable all
