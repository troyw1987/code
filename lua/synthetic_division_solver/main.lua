local problem = "x^3-2x^2-3x+5"

local valid_problem_characters = "+-*/x^"
local valid_character_table = {}

local function string_is_number(str)
	return type(tonumber(str)) == "number"
end

local function setup_character_table()
	for i = 0, string.len(valid_problem_characters) do
		valid_character_table[string.sub(valid_problem_characters, i, i)] = true
	end
end

local function remove_unknown_characters(str)
	local output = ""

	for i = 0, string.len(str) do
		local character = string.sub(str, i, i)
		if valid_character_table[character] or string_is_number(character) then
			output = output .. character
		else
			print("removing unknown character:'" .. character .. "'")
		end
	end
	return output
end

local function add_ones(str)
	local output = ""

	for i = 1, string.len(str) do
		local character = string.sub(str, i, i)
		if character == "x" then
			if i == 1 or not string_is_number(string.sub(str, i - 1, i - 1)) then
				character = "1x"
			end

			if string.sub(str, i + 1, i + 1) ~= "^" then
				character = character .. "^1"
			end
		end
		output = output .. character
	end
	return output
end

local function check_constant(str)
	local strlen = string.len(str)
	local last_character = string.sub(str, strlen, strlen)

	local output = str

	if last_character == "x" then
		output = output .. "+0"
	end

	return output
end

local function preparse_String(str)
	print("-> parsing <-/ ")

	str = string.lower(str)
	print("made lowercase")

	str = remove_unknown_characters(str)
	print("removed any unknown characters")

	str = add_ones(str)
	print("added necesary coefficients and powers")

	str = check_constant(str)
	print("added necessary zeros at the end")

	print("-> done <- \n")
	return str
end

local function table_Iteration(str)
	for i = 2, string.len(str) do
		local char = string.sub(str, i, i)
		if char == "+" or char == "-" then
			local subsection = string.sub(str, 1, i - 1)
			return subsection, string.sub(str, i, string.len(str))
		else
			if i == string.len(str) then
				print("nigga")
				return str, true
			else
				if str == "" then
					return true, ""
				end
			end
		end
	end
end

local function split_String_Into_Table(str) -- input: "-1x^3+x^2+1x+5" -> {"-1x^3","+x^2","+1x","+5"}
	print("splitting problem into table")
	local output = {}

	repeat
		local subsection, other = table_Iteration(str)

		if other == true then
			table.insert(output, subsection)
			break
		end

		table.insert(output, subsection)

		str = other
	until table_Iteration(str) == true
	return output
end

local function main()
	setup_character_table()
	problem = preparse_String(problem)
	local problem_table = split_String_Into_Table(problem)

	print("\n\nTABLE:")
	for i, v in pairs(problem_table) do
		print(i, v)
	end
end

main()
