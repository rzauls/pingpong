package main

import (
	"fmt"
	"log"
	"net/http"
	"os"
	"strconv"

	"github.com/gin-gonic/gin"
)

func main() {
	port, err := getPort()
	if err != nil {
		log.Fatalf("failed to parse http port: %s", err)
	}
	r := gin.Default()
	r.GET("/ping", func(c *gin.Context) {
		c.JSON(http.StatusOK, gin.H{
			"message": "pong-but-long",
		})
	})
	r.Run(fmt.Sprintf(":%d", port))
}

func getPort() (int, error) {
	val := os.Getenv("SERVER_PORT")
	if len(val) == 0 {
		return 8081, nil
	}
	return strconv.Atoi(val)
}
