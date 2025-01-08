import gleam/int
import gleam/list
import gleam/result
import gleam/set.{type Set}
import gleam/string

pub fn parse(input: String) -> Set(Int) {
  input
  |> string.split("\n")
  |> list.filter(fn(line) { line != "" })
  |> list.map(fn(number) { number |> int.parse() |> result.unwrap(or: 0) })
  |> set.from_list()
}

pub fn pt_1(input: Set(Int)) -> Int {
  case find_two_sum(input, 2020) {
    Ok(#(a, b)) -> a * b
    Error(_) -> 0
  }
}

pub fn pt_2(input: Set(Int)) -> Int {
  case find_three_sum(input, 2020) {
    Ok(#(a, b, c)) -> a * b * c
    Error(_) -> 0
  }
}

fn find_two_sum(numbers: Set(Int), target: Int) -> Result(#(Int, Int), Nil) {
  case
    numbers
    |> set.to_list()
    |> list.find(fn(n) { set.contains(numbers, target - n) })
  {
    Ok(found) -> Ok(#(found, target - found))
    Error(Nil) -> Error(Nil)
  }
}

fn find_three_sum(
  numbers: Set(Int),
  target: Int,
) -> Result(#(Int, Int, Int), Nil) {
  case
    numbers
    |> set.to_list()
    |> list.find(fn(a) {
      case find_two_sum(numbers, target - a) {
        Ok(_) -> True
        Error(_) -> False
      }
    })
  {
    Ok(a) -> {
      case find_two_sum(numbers, target - a) {
        Ok(#(b, c)) -> Ok(#(a, b, c))
        Error(_) -> Error(Nil)
      }
    }
    Error(_) -> Error(Nil)
  }
}
