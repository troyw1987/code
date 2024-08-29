local function synthetic_division_cycle(current_power, divisor, last_number, number_table, answer_table)
	local top_number = number_table[current_power]
	local middle_number = last_number * divisor
	local bottom_number = middle_number + top_number

	answer_table[current_power] = bottom_number
	current_power = current_power - 1

	return current_power, bottom_number, answer_table
end

local function synthetic_division(number_table, divisor)
	local current_power = #number_table
	local answer_table = {}
	local top_number = number_table[current_power]

	answer_table[current_power] = top_number

	local last_number = top_number

	current_power = current_power - 1

	repeat
		current_power, last_number, answer_table =
			synthetic_division_cycle(current_power, divisor, last_number, number_table, answer_table)
	until current_power < 0

	return answer_table
end

local problem_table = {
	[0] = 8,
	[1] = -10,
	[2] = 1,
	[3] = 1,
}

local function main()
	local answer_table = synthetic_division(problem_table, 1)

	if answer_table[0] == 0 then
		print("HALELUJA")
	end

	for i = 3, 0, -1 do
		print(i, answer_table[i])
	end
end

main()
