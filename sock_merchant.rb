#!/bin/ruby
require 'minitest/autorun'

class Test < Minitest::Test
	def test_create_hash_count
		assert create_hash_count([1,1,2,3])=={1=>2, 2=>1, 3=>1}
		assert create_hash_count([1,1,1,1])=={1=>4}
	end
	def test_get_total_pairs_of_socks
		assert get_total_pairs_of_socks([1,1,1,1])==2
		assert get_total_pairs_of_socks([1,2,3,4,5,5])==1
	end
end

def get_total_pairs_of_socks(array_to_hash)
	hash_count=create_hash_count(array_to_hash)
	sock_count=0
	hash_count.each do |key, value|
		sock_count+=value/2
	end
	sock_count
end

def create_hash_count(array_to_hash)
	hash_count={}
	array_to_hash.each do | number |
		if !hash_count[number]
			hash_count[number]=1
		else
			hash_count[number]+=1
		end
	end
	hash_count
end

		


def sockMerchant(n, ar)
    get_total_pairs_of_socks(ar)
end

#n = gets.strip.to_i
#ar = gets.strip
#ar = ar.split(' ').map(&:to_i)
#result = sockMerchant(n, ar)
#puts result;
