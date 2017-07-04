=begin
  
You are given the following information, but you may prefer to do some research for yourself.

1 Jan 1900 was a Monday.
Thirty days has September,
April, June and November.
All the rest have thirty-one,
Saving February alone,
Which has twenty-eight, rain or shine.
And on leap years, twenty-nine.
A leap year occurs on any year evenly divisible by 4, but not on a century unless it is divisible by 400.
How many Sundays fell on the first of the month during the twentieth century (1 Jan 1901 to 31 Dec 2000)?
  
=end

@daysinmonth = [31,28,31,30,31,30,31,31,30,31,30,31]

def leapyear?(year)
  (year % 4 == 0) && ((year % 100 != 0) || (year % 400 == 0))
end

def startdays(firstday, year)
  total = 0
  (0..11).each do |month|
    total += 1 if firstday == 0
    movement = @daysinmonth[month]
    movement = @daysinmonth[month] + 1 if (leapyear?(year)) && (month == 1)
    firstday = (firstday + movement) % 7
  end
  {total: total, day: firstday}
end

def startdays_in_range(firstday,startyear,endyear)
  total = 0
  (startyear..endyear).each do |year|
    total += startdays(firstday,year)[:total]
    firstday = startdays(firstday,year)[:day]
  end
  total
end

puts startdays_in_range(2,1901,2000)