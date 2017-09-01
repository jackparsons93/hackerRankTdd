require "minitest/autorun"

class Test < Minitest::Test
	def test_that_string_is_empty
		assert is_string_empty?("")==true
		assert is_string_empty?("aa")==false
	end

	def test_no_adjacent_duplicates_exist_in_string
		assert has_adjacent_duplicates?("aabbcc")==true
		assert has_adjacent_duplicates?("ac")==false
		assert has_adjacent_duplicates?("")==false
	end

	def test_remove_adjacent_duplicates
		assert remove_adjacent_duplicates("aacf")==("cf")
		assert remove_adjacent_duplicates("aaa")==("a")
		assert remove_adjacent_duplicates("aaaa")==""
	end

	def test_adjacent_loop
			assert adjacent_duplicates_loop("aabaab")==""
	end
	def test_solve_string
		assert solve_string("aabaab")=="Empty String"
		assert solve_string("accvv")=="a"
	end

end

def is_string_empty?(input_string)
	if input_string=="" || input_string==nil
		true
	else
		false
	end
end

def has_adjacent_duplicates?(input_string)
	adjacent_duplicates=false
	for x in 0...input_string.length
		if input_string[x]==input_string[x+1]
			adjacent_duplicates=true
		end
	end
	adjacent_duplicates
end

def remove_adjacent_duplicates(input_string)
	return_array=input_string.split("")
		return_array.each.with_index do |letter, index|
			if letter==return_array[index+1]
				return_array[index..(index+1)]=""
			end
		 end
	return_array.join('')
end

def adjacent_duplicates_loop(input_string)
	if has_adjacent_duplicates?(input_string)
		return adjacent_duplicates_loop(remove_adjacent_duplicates(input_string))
	end
	input_string
end 

def solve_string(input_string)
	removed_duplicates_string=adjacent_duplicates_loop(input_string)
	if removed_duplicates_string==""
		return "Empty String"
	else
		return removed_duplicates_string
	end
end




