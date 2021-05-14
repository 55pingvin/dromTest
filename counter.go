package main

import (
	"bytes"
	"fmt"
	"io/ioutil"
	"log"
	"os"
	"path/filepath"
)

func main() {

	var result = 0

	err := filepath.Walk(".",
		func(path string, info os.FileInfo, err error) error {
			if err != nil {
				return err
			}

			if !info.IsDir() {
				var buffer bytes.Buffer
				buffer.WriteString(path)

				fmt.Println(buffer.String())

				fContent, err := ioutil.ReadFile(path)
				if err != nil {
					panic(err)
				}
				asInt := int(fContent[0])

				result = result + asInt

			}

			return nil
		})

	fmt.Println(result)

	if err != nil {
		log.Println(err)
	}
}
