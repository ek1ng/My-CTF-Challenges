package route

import (
	"fmt"
	"github.com/gin-contrib/sessions"
	"github.com/gin-contrib/sessions/cookie"
	"github.com/gin-contrib/static"
	"github.com/gin-gonic/gin"
	"github.com/tidwall/gjson"
	"io/ioutil"
	"math/rand"
	"os"
	"time"
)

const targetScore = 99

func Run() {
	r := gin.Default()

	//init session
	secret := "hgame{Guess_who_i_am^Happy_Crawler}"
	store := cookie.NewStore([]byte(secret))
	r.Use(sessions.Sessions("session", store))

	//init rand seed
	rand.Seed(time.Now().Unix())

	//parse member data
	jsonFile, err := os.Open("./member.json")

	if err != nil {
		fmt.Println(err)
	}
	byteValue, _ := ioutil.ReadAll(jsonFile)
	json := string(byteValue)
	id := gjson.Get(json, "#.id").Array()
	intro := gjson.Get(json, "#.intro").Array()
	jsonFile.Close()

	r.GET("/api/getQuestion", func(c *gin.Context) {
		//删掉session后有一定概率会没能够成功
		session := sessions.Default(c)

		challengeId := session.Get("challengeId")
		if challengeId == nil {
			randomNumber := rand.Intn(len(id))
			session.Set("challengeId", randomNumber)
			session.Save()
			c.JSON(200, gin.H{"message": intro[randomNumber].String()})
		} else {
			c.JSON(200, gin.H{"message": intro[challengeId.(int)].String()})
		}
	})

	r.POST("/api/verifyAnswer", func(c *gin.Context) {
		session := sessions.Default(c)
		var count int

		v := session.Get("solved")
		if v == nil {
			count = 0
		} else {
			count = v.(int)
			if count > targetScore {
				c.JSON(200, gin.H{"message": "Congratulations,You have solved all challenges!"})
				return
			}
		}
		//verify answer
		name := c.PostForm("id")
		challengeId := session.Get("challengeId")
		if challengeId == nil {
			c.JSON(200, gin.H{"message": "Please get a question first!"})
			return
		} else {
			answer := id[challengeId.(int)].String()
			if answer != name {
				c.JSON(200, gin.H{"message": "Wrong answer!"})
				return
			} else {
				//new challenge
				count++
				session.Set("solved", count)
				session.Set("challengeId", rand.Intn(len(intro)))
				session.Save()
				c.JSON(200, gin.H{"message": "Correct answer!"})
				return
			}
		}
	})

	r.GET("/api/getScore", func(c *gin.Context) {
		session := sessions.Default(c)
		var count int

		v := session.Get("solved")

		if v == nil {
			count = 0
			session.Set("solved", count)
			session.Save()
		} else {
			count = v.(int)
		}

		if count > targetScore {
			c.JSON(200, gin.H{"message": secret})
		} else {
			c.JSON(200, gin.H{"message": count})
		}

	})

	r.Use(static.Serve("/", static.LocalFile("./dist/", false)))

	r.Run()
}
