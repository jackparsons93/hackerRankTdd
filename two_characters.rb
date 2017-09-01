require 'minitest/autorun'

class Test < Minitest::Test
	
	def  test_remove_adjacent_duplicates_letters
		assert remove_adjacent_duplicates_letters("aabb")==""|| remove_adjacent_duplicates_letters("aabb")== nil
		assert remove_adjacent_duplicates_letters("caab")=="cb"
	end

	def test_remove_letter_from_string
		assert remove_letter_from_string("aabb", "a")=="bb"
	end


	def test_has_adjacent_duplicates?
		assert has_adjacent_duplicates?("aabb")==true
		assert has_adjacent_duplicates?("abcb")==false
	end
	def test_letters_to_remove_array

		assert letters_to_remove_array("aabb")==["a","b"]

	end
end

def letters_to_remove_array(input_string)
	return_letters_to_remove=[]
	for x in 0...input_string.length
		if input_string[x]==input_string[x+1]
		return_letters_to_remove.push(input_string[x])
		end
	end
	return_letters_to_remove
end

def remove_letter_from_string(input_string, letter_to_remove)
	input_string.gsub!(letter_to_remove, "")
end


def remove_adjacent_duplicates_letters(input_string)
	remove_letters_array=letters_to_remove_array(input_string)
	remove_letters_array.each do |remove_letter|
		input_string.gsub!(remove_letter,"")
	end
	input_string
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


letters_to_remove_array("aabb")



