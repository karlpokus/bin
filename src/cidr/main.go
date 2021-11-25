package main

import (
	"flag"
	"fmt"
	"net"
	"os"
	"text/tabwriter"

	"github.com/apparentlymart/go-cidr/cidr"
)

var (
	version string
	v = flag.Bool("v", false, "print version and exit")
)

type data struct {
	count uint64
	first net.IP
	last  net.IP
}

// parse takes a cidr and returns a data type
func parse(s string) (data, error) {
	_, ipnet, err := net.ParseCIDR(s)
	if err != nil {
		return data{}, err
	}
	count := cidr.AddressCount(ipnet)
	first, last := cidr.AddressRange(ipnet)
	return data{count, first, last}, nil
}

func main() {
	flag.Usage = func() {
		w := flag.CommandLine.Output()
		fmt.Fprintf(w, "dump cidr details\n\n")
		fmt.Fprintf(w, "USAGE\n")
		fmt.Fprintf(w, "  $ ,cidr <cidr> <opts>\n")
    flag.PrintDefaults()
	}
	flag.Parse()
	if *v {
		fmt.Println(version)
		return
	}
	if len(os.Args) == 1 {
		fmt.Println("error: missing arg")
		return
	}
	data, err := parse(os.Args[1])
	if err != nil {
		fmt.Println(err)
		return
	}
	w := tabwriter.NewWriter(os.Stdout, 1, 1, 1, ' ', 0)
	fmt.Fprintln(w, fmt.Sprintf("count\t%d", data.count))
	fmt.Fprintln(w, fmt.Sprintf("first\t%v", data.first))
	fmt.Fprintln(w, fmt.Sprintf("last\t%v", data.last))
	w.Flush()
}
