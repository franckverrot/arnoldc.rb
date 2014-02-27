# arnoldc.rb

[ArnoldC](https://github.com/lhartikk/ArnoldC) on top of any Ruby Virtual Machine.

## INSTALLATION

    gem install arnoldc

## USAGE

```ruby
λ arnoldc.rb my_script.arnoldc
```

Example:

```ruby
λ arnoldc.rb samples/fizzbuzz.arnoldc
arnoldc.rb...

1
2
Fizz
4
Buzz
Fizz
7
8
Fizz
Buzz
11
Fizz
13
14
FizzBuzz
16
17
Fizz
19
Buzz
Fizz
22
23
Fizz
Buzz
26
Fizz
28
29
FizzBuzz
31
32
Fizz
34
Buzz
Fizz
37
38
Fizz
Buzz
41
Fizz
43
44
FizzBuzz
46
47
Fizz
49
Buzz
Fizz
52
53
Fizz
Buzz
56
Fizz
58
59
FizzBuzz
61
62
Fizz
64
Buzz
Fizz
67
68
Fizz
Buzz
71
Fizz
73
74
FizzBuzz
76
77
Fizz
79
Buzz
Fizz
82
83
Fizz
Buzz
86
Fizz
88
89
FizzBuzz
91
92
Fizz
94
Buzz
Fizz
97
98
Fizz
Buzz

Exiting.
```

You can turn on debug mode by using the -w option of the Ruby VM:

```ruby
/tmp/arnoldc.rb  [±] λ ruby -w arnoldc.rb samples/fizzbuzz.arnoldc
arnoldc.rb...
L0000: def main
L0001: isLessThan100 = true
L0002: n = 0
L0003: multiple = true
L0004: while isLessThan100
L0005: n = \
L0006: n\
L0007: + 1
L0008: isLessThan100 = \
L0009: 100\
L0010: > n
L0011: multiple = \
L0012: divisible(n, 15)
L0013: if multiple
L0014: puts "FizzBuzz"
L0015: else
L0016: multiple = \
L0017: divisible(n, 3)
L0018: if multiple
L0019: puts "Fizz"
L0020: else
L0021: multiple = \
L0022: divisible(n, 5)
L0023: if multiple
L0024: puts "Buzz"
L0025: else
L0026: puts n
L0027: end
L0028: end
L0029: end
L0030: end
L0031: end
L0032: def modulo(
L0033: dividend,
L0034: divisor,
L0035: unused=0)
L0036: quotient = 0
L0037: remainder = 0
L0038: product = 0
L0039: quotient = \
L0040: dividend\
L0041: * 1/divisor
L0042: product = \
L0043: divisor\
L0044: * quotient
L0045: remainder = \
L0046: dividend\
L0047: - product
L0048: return remainder
L0049: end
L0050: def divisible(
L0051: dividend,
L0052: divisor,
L0053: unused=0)
L0054: result = 0
L0055: result = \
L0056: modulo(dividend, divisor)
L0057: isZero = 0
L0058: isZero = \
L0059: result\
L0060: == 0
L0061: return isZero
L0062: end
L0063: main

1
2
Fizz
4
Buzz
Fizz
7
8
Fizz
Buzz
11
Fizz
13
14
FizzBuzz
16
17
Fizz
19
Buzz
Fizz
22
23
Fizz
Buzz
26
Fizz
28
29
FizzBuzz
31
32
Fizz
34
Buzz
Fizz
37
38
Fizz
Buzz
41
Fizz
43
44
FizzBuzz
46
47
Fizz
49
Buzz
Fizz
52
53
Fizz
Buzz
56
Fizz
58
59
FizzBuzz
61
62
Fizz
64
Buzz
Fizz
67
68
Fizz
Buzz
71
Fizz
73
74
FizzBuzz
76
77
Fizz
79
Buzz
Fizz
82
83
Fizz
Buzz
86
Fizz
88
89
FizzBuzz
91
92
Fizz
94
Buzz
Fizz
97
98
Fizz
Buzz

Exiting.
```
