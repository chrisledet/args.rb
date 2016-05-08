ARGS_RB = ARGV

def args(name, as: :default)
  args_method = begin
    method "args_as_#{as}"
  rescue NameError
    fail "invalid type for :as option: #{as}"
  end

  args_method.call(name)
end

def args_as_array(name)
  flag_name = "--#{name}"
  args_values = []

  if ARGS_RB.include?(flag_name)
    current_index = ARGS_RB.index(flag_name)

    begin
      current_index += 1
      current = ARGS_RB[current_index]
      args_values << current if current
    end while current && !current.start_with?('--')
  end

  args_values
end

def args_as_bool(name)
  flag_name = "--#{name}"
  ARGS_RB.include?(flag_name)
end

def args_as_default(name)
  flag_name = "--#{name}"

  if ARGS_RB.include?(flag_name)
    arg_value = true

    arg_loc = ARGS_RB.index(flag_name)
    next_arg = ARGS_RB[arg_loc + 1]

    if ARGS_RB.size > (arg_loc + 1) && !next_arg.start_with?('--')
      arg_value = next_arg
    end
  end

  arg_value
end

def args_as_float(name)
  Float(args_as_default(name))
end
