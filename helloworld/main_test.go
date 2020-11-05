package main

import "testing"

func Test_hello_world(t *testing.T) {
	expected := "Hello, World!"

	if actual := getHello(); expected != actual {
		t.Errorf("expect: %s but got %s", expected, actual)
	}
}
