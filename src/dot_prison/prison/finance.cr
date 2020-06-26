struct DotPrison::Finance < DotPrison::Consumer
  consume :balance, Float64, :Balance
  consume :last_day, Int32, :LastDay
  consume :last_hour, Int32, :LastHour
  consume :sale_price, Int32, :SalePrice
  consume :bank_loan, Int32, :BankLoan
  consume :bank_credit_rating, Float64, :BankCreditRating
  consume :ownership, Int32, :Ownership
  consume :warden_cut, Float64, :WardensCut
  consume :staff_pay_modifier, Float64, :StaffPayModifier
  consume :daily_exports, Float64, :DailyExports
  consume :yesterday_exports, Int32, :DailyExportsYesterday
  consume :daily_shop_revenue, Float64, :DailyShopRevenue
  consume :yesterday_shop_revenue, Int32, :DailyShopRevenueYesterday
  consume :daily_prisoner_wages,  Float64, :DailyPrisonerWages
  consume :yesterday_prisoner_wages, Int32, :DailyPrisonerWagesYesterday
  consume :daily_staff_food, Float64, :DailyStaffFood
  consume :yesterday_staff_food, Int32, :DailyStaffFoodYesterday
end