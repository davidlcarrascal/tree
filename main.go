package main

import (
	"fmt"
	"io/ioutil"
	"log"
	"os"
	"path/filepath"
)

func main() {
	args := []string{"."}
	if len(os.Args) > 1 {
		args = os.Args[1:]
	}

	for _, arg := range args {
		err := tree(arg, "")
		if err != nil {
			log.Printf("tree %s: %v\n", arg, err)
		}
	}
}

func tree(root, indent string) error {
	fi, err := os.Stat(root)
	if err != nil {
		return fmt.Errorf("Could not stat %s, %v", root, err)
	}

	fmt.Printf("%s%s\n", indent, fi.Name())
	if !fi.IsDir() {
		return nil
	}

	fis, err := ioutil.ReadDir(root)

	if err != nil {
		return fmt.Errorf("Could not read dir %s: %v", root, err)
	}

	add := "  "
	for _, fi := range fis {
		if fi.Name()[0] == '.' {
			continue
		}
		if err := tree(filepath.Join(root, fi.Name()), indent+add); err != nil {
			return err
		}
	}

	return nil
}
