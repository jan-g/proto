package main

import (
	"fmt"

	m1 "github.com/jan-g/proto/d1/model"
	m2 "github.com/jan-g/proto/d2/model"
)

func main() {
	fmt.Println(&m1.Foo{Key: "hi"})
	fmt.Println(&m2.Bar{Key: "world"})
	fmt.Println(&m2.Baz{Foo:&m1.Foo{"hello"}, Bar:&m2.Bar{"world"}})
}
