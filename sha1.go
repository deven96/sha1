package main

import (
	"crypto/sha1"
	"fmt"
	"os"
)

func hash_file_sha1(entry string) ([]byte, error) {
	hash := sha1.New()
	hash.Write([]byte(entry))
	bs := hash.Sum(nil)

	return bs, nil

}

func main() {
	hash, err := hash_file_sha1(os.Args[1])
	if err == nil {
		fmt.Printf("%x\n", hash)
	}
}
