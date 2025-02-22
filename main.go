package main

import (
	"fmt"
	"log"
	"os"
	"os/exec"
)

func proc(shell string) {
	cwd, _ := os.Getwd()
	log.Printf("Running %s in %s", shell, cwd)

	out, err := exec.Command("sh", "-c", shell).CombinedOutput()
	fmt.Println(string(out))

	if err != nil {
		log.Fatalf("Unable to run %s", shell)
	}
}

func main() {
	branch := os.Args[1]

	proc(fmt.Sprintf("git fetch origin/%s", branch))
	proc(fmt.Sprintf("git push %s", branch))
}
