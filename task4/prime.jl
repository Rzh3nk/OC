function isprime(n::Integer)
  if n < 2
      return false
  end
  for i in 2:floor(sqrt(n))
      if n % i == 0
          return false # Проверка, если число непростое
      end
  end
  return true
end

function main()
  println("Сколько первых простых чисел вывести? ")
  n = parse(Int, readline())  # Ввод числа с клавиатуры
  primes = Vector{Integer}()
  i = 2  # Начальное простое число
  k = 0
  println("Первые $n простых чисел:")
  while k < n
      if isprime(i)
          print(" ", i)
          k += 1
      end
      i += 1  # Переход к следующему числу
  end
  println()
end

main()