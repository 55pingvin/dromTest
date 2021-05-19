package main

import (
	"bufio"
	"flag"
	"fmt"
	"log"
	"os"
	"strconv"
)

func readCurrentDir(dirName string) int {

	var result = 0

	file, err := os.Open(dirName)

	if err != nil {
		log.Fatalf("failed opening directory: %s", err)
	}

	defer file.Close()

	list, _ := file.Readdirnames(0) // 0 to read all files and folders

	for _, name := range list {

		var path = dirName + "/" + name

		fi, err := os.Stat(path)

		if err != nil {
			fmt.Println(err)
			return 0
		}

		switch mode := fi.Mode(); {

		case mode.IsDir():
			result += readCurrentDir(path)
		case mode.IsRegular():

			if name == "count" {

				file, err := os.Open(path)

				if err != nil {
					log.Fatal(err)
				}

				defer file.Close()

				scanner := bufio.NewScanner(file)
				for scanner.Scan() {
					var value = scanner.Text()

					var strToInt, err = strconv.ParseInt(value, 10, 64)

					if err != nil {
						log.Fatal(err)
					}

					result += int(strToInt)

				}

				if err := scanner.Err(); err != nil {
					log.Fatal(err)
				}
			}
		}
	}
	return result
}

func main() {

	var path string

	flag.StringVar(&path, "p", "/tmp/counter", "вспомогательное сообщение для flagname")
	flag.Parse()

	println(path)

	var result = readCurrentDir(path)

	println(result)
}
