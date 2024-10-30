import pytest
from fizz_buzz import fizz_buzz


@pytest.mark.parametrize("input", [3, 6, 9, 12, 18])
def test_fizz(input: int):
    assert fizz_buzz(input) == "Fizz"


@pytest.mark.parametrize("input", [5, 10, 20])
def test_buzz(input: int):
    assert fizz_buzz(input) == "Buzz"


@pytest.mark.parametrize("input", [0, 15, 30])
def test_fizzbuzz(input: int):
    assert fizz_buzz(input) == "FizzBuzz"


@pytest.mark.parametrize("input", [1, 2, 4, 8, 11])
def test_number(input: int):
    assert fizz_buzz(input) == str(input)


# Other possibility


@pytest.mark.parametrize(
    "value, expected",
    [
        (0, "FizzBuzz"),
        (1, "1"),
        (2, "2"),
        (3, "Fizz"),
        (4, "4"),
        (5, "Buzz"),
        (6, "Fizz"),
        (9, "Fizz"),
        (10, "Buzz"),
        (12, "Fizz"),
        (15, "FizzBuzz"),
        (20, "Buzz"),
        (30, "FizzBuzz"),
    ],
)
def test_fizz_buzz(value: int, expected: str):
    assert fizz_buzz(value) == expected


# Test error raised


@pytest.mark.parametrize("input", [-1, -2, -3, -5, -10, -15, -20, -30])
def test_error_is_raised_for_negative_inputs(input: int):
    with pytest.raises(ValueError):
        fizz_buzz(input)