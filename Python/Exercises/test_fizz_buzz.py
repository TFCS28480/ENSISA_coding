from fizz_buzz import fizz_buzz


def test_fizz():
    assert fizz_buzz(3) == "Fizz"


def test_buzz():
    assert fizz_buzz(5) == "Buzz"


def test_fizzbuzz():
    assert fizz_buzz(15) == "FizzBuzz"


def test_number():
    assert fizz_buzz(1) == "1"