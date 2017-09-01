require 'minitest'#/autorun'

class Test < Minitest::Test
	def test_is_leap_year_gregorian
		assert is_leap_year_gregorian?(1900)==false
		assert is_leap_year_gregorian?(2000)==true
		assert is_leap_year_gregorian?(2004)==true
		assert is_leap_year_gregorian?(1999)==false
	end
	def test_is_calender_shift
		assert is_year_of_calender_shift?(1918)==true
		assert is_year_of_calender_shift?(1900)==false
	end
	def test_is_leap_year_julian
		assert is_leap_year_julian?(1700)==true
		assert is_leap_year_julian?(1701)==false
	end
	def test_year_before_gregorian_shift
		assert year_before_gregorian_shift?(1900)==true
		assert year_before_gregorian_shift?(1950)==false
	end
	def test_is_leap_year_with_correct_calender
		assert is_leap_year_with_correct_calender?(1900)==true
		assert is_leap_year_with_correct_calender?(1918)==false
		assert is_leap_year_with_correct_calender?(2100)==false
		assert is_leap_year_with_correct_calender?(1700)==true
	end
def test_get_day_of_programmer
	assert get_day_of_programmer(1900)=="12.09.1900"
	assert get_day_of_programmer(1993)=="13.09.1993"
end

end

def get_day_of_programmer(year)
	if is_leap_year_with_correct_calender?(year)
		"12.09.#{year}"
	elsif is_year_of_calender_shift?(year)
		"26.09.1918"
	else
		"13.09.#{year}"
	end
end


def is_leap_year_with_correct_calender?(year)
	if year_before_gregorian_shift?(year)
		is_leap_year_julian?(year)
	else
		is_leap_year_gregorian?(year)
	end
end


def year_before_gregorian_shift?(year)
	year<1918
end
def is_leap_year_julian?(year)
	year%4==0
end
def is_leap_year_gregorian?(year)
	if year%400==0
		true
	elsif year%100==0
		false
	elsif year%4==0
		true
	else 
		false
	end
end
def is_year_of_calender_shift?(year)
	if year==1918
		true
	else
		false
	end
end
def solve(year)
    get_day_of_programmer(year)
end



year = gets.strip.to_i
result = solve(year)
puts result;

