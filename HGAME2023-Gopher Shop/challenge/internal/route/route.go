package route

import (
	"GopherShop/internal/config"
	"GopherShop/internal/controllers/auth"
	"GopherShop/internal/controllers/product"
	"GopherShop/internal/controllers/user"
	"GopherShop/internal/middleware"
	"github.com/gin-contrib/sessions"
	"github.com/gin-contrib/sessions/cookie"
	"github.com/gin-contrib/static"
	"github.com/gin-gonic/gin"
)

func Run() {
	r := gin.Default()

	secret := config.Secret.SessionSecret
	store := cookie.NewStore([]byte(secret))
	r.Use(sessions.Sessions("session", store))

	v1 := r.Group("/api/v1")
	{
		v1Auth := v1.Group("/auth")
		{
			v1Auth.POST("register", auth.Register)

			v1Auth.POST("login", auth.Login)
		}

		v1User := v1.Group("/user")
		v1User.Use(middleware.Auth())
		{
			v1User.GET("/info", user.GetUserInfo)

			v1User.GET("/tanking", user.Tanking)

			v1User.GET("/buyInventory", user.BuyInventory)

			v1User.GET("/buyProduct", user.BuyProduct)

			v1User.GET("/getOrderSum", user.GetOrderSum)

			v1User.GET("/sellProduct", user.SellProduct)

			v1User.GET("/checkFlag", user.CheckFlag)
		}

		v1Product := v1.Group("/product")
		v1Product.Use(middleware.Auth())
		{

			v1Product.GET("/list", product.GetProductList)
		}

		r.Use(static.Serve("/", static.LocalFile("./dist/", false)))

		err := r.Run()
		if err != nil {
			return
		}
	}
}
