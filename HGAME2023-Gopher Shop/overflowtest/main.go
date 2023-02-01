package main

import "fmt"

func main() {
	var a uint = 18446744073709551610
	var b uint = 10
	var c uint = uint(18446744073709551610) * 10
	var d uint = 18446744073709551610 * 10
	fmt.Println(a * b)
	fmt.Println(c)
	fmt.Println(d)
	fmt.Println(uint(18446744073709551610) * 10)
	fmt.Println(18446744073709551610 * 10)
}

// @Title
// @Description
// @Author
// @Update
