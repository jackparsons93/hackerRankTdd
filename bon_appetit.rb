#!/bin/ruby
#require 'minitest/autorun'
#
#class Test < Minitest::Test
#
#def test_get_cost_of_food_minus_k
#	assert get_cost_of_food_minus_k([1,2,3,4],0)==9
#	assert get_cost_of_food_minus_k([1,3,3,4,5],1)==13
#end
#def test_get_price_owed_by_anna
#	assert get_price_owed_by_anna([1,2,3,4],0)==4.5
#	assert get_price_owed_by_anna([1,3,3,4,5],1)==6.5
#end
#def test_get_amount_to_refund_anna
#	assert get_amount_to_refund_anna([1,2,3,4], 0, 6.5)==2.0
#	assert get_amount_to_refund_anna([1,3,3,4,5], 1, 6.5)==0
#end
#
#def test_print_price_owed_or_bon_appetit
#	assert print_price_owed_or_bon_appetit([1,2,3,4],0,6.5)==2
#	assert print_price_owed_or_bon_appetit([1,3,3,4,5], 1, 6.5)=="Bon Appetit"
#end
#end

def print_price_owed_or_bon_appetit(array_of_food, k_to_minus, orignal_price_paid)
	refund_amount=get_amount_to_refund_anna(array_of_food,k_to_minus,orignal_price_paid)
	if refund_amount==0
		"Bon Appetit"
	else
		refund_amount.to_i
	end
end

def get_amount_to_refund_anna(array_of_food, k_to_minus, orignal_price_paid)
	orignal_price_paid-get_price_owed_by_anna(array_of_food, k_to_minus)
end
def get_price_owed_by_anna(array_of_food, k_to_minus)
	get_cost_of_food_minus_k(array_of_food, k_to_minus)/2.0

end

def get_cost_of_food_minus_k(array_of_food, k_to_minus)
	array_of_food[k_to_minus]=0
	array_of_food.inject(:+)
end


def bonAppetit(n, k, b, ar)
    print_price_owed_or_bon_appetit(ar,k,b)
end

n, k = gets.strip.split(' ')
n = n.to_i
k = k.to_i
ar = gets.strip
ar = ar.split(' ').map(&:to_i)
b = gets.strip.to_i
result = bonAppetit(n, k, b, ar)
puts result;
