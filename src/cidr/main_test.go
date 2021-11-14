package main

import "testing"

func TestParse(t *testing.T) {
	data, err := parse("8.8.8.8/24")
	if err != nil {
		t.Errorf("Expected nil err. Got %s", err)
	}
	if data.count != 256 {
		t.Errorf("Expected 256. Got %d", data.count)
	}
}
