package db

import (
	"GopherShop/internal/config"
	"fmt"
	"gorm.io/driver/mysql"
	"gorm.io/gorm"
	"log"
)

type User struct {
	gorm.Model
	Username  string `gorm:"not null;column:username;unique"`
	Password  string `gorm:"not null;column:password"`
	Days      uint   `gorm:"not null;column:days"`
	Balance   uint   `gorm:"not null;column:balance"`
	Inventory uint   `gorm:"not null;column:inventory"`
}

type Product struct {
	gorm.Model
	Name  string `gorm:"not null;column:name;unique"`
	Price uint   `gorm:"not null;column:price"`
}

type Order struct {
	gorm.Model
	Username string `gorm:"not null;column:username"`
	Product  string `gorm:"not null;column:product"`
	Number   uint   `gorm:"not null;column:number"`
	Status   bool   `gorm:"not null;column:status"`
}

type OrderSum struct {
	Product string
	Number  string
}

var db *gorm.DB

func init() {
	user := config.Mysql.Username
	pass := config.Mysql.Password
	host := config.Mysql.Host
	port := config.Mysql.Port
	dbname := config.Mysql.Database
	option := "charset=utf8mb4&parseTime=True&loc=Local"
	dsn := fmt.Sprintf("%s:%s@tcp(%s:%d)/%s?%s", user, pass, host, port, dbname, option)
	conn, err := gorm.Open(mysql.Open(dsn), &gorm.Config{})
	if err != nil {
		panic("Cannot connect to mysql: " + err.Error())
	}
	err = conn.AutoMigrate(&User{})
	if err != nil {
		panic("Cannot automatically migrate to mysql: " + err.Error())
	}
	err = conn.AutoMigrate(&Product{})
	if err != nil {
		panic("Cannot automatically migrate to mysql: " + err.Error())
	}
	err = conn.AutoMigrate(&Order{})
	if err != nil {
		panic("Cannot automatically migrate to mysql: " + err.Error())
	}
	list := []Product{
		{Name: "Apple", Price: 10},
		{Name: "Unstable wifi for 300b", Price: 20},
		{Name: "ek1ng's broken desktop computer", Price: 30},
		{Name: "4cute's Vidar custom meal card", Price: 40},
		{Name: "300b 64-core server", Price: 50},
		{Name: "Vidar Clubwear", Price: 200},
		{Name: "Large 32-inch TV", Price: 300},
		{Name: "The Switch at 300b", Price: 500},
		{Name: "A hair of the 4nsw3r", Price: 999999},
		{Name: "Flag", Price: 10000000000000000000},
	}
	conn.Create(list)
	db = conn
}

func CreateUser(user *User) error {
	err := db.Create(user).Error
	if err != nil {
		log.Println("Cannot create user: " + err.Error())
		return err
	}
	return nil
}

func GetUserByUsername(username string) (*User, error) {
	var user User
	err := db.Where("username = ?", username).First(&user).Error
	if err != nil {
		log.Println("Cannot get user: " + err.Error())
		return nil, err
	}
	return &user, nil
}

func UpdateUserInfo(user *User) error {
	err := db.Model(&User{}).Where("username = ?", user.Username).Save(user).Error
	if err != nil {
		log.Println("Cannot update user: " + err.Error())
		return err
	}
	return nil
}

func GetProductList() ([]Product, error) {
	var products []Product
	err := db.Find(&products).Error
	if err != nil {
		log.Println("Cannot get product list: " + err.Error())
		return nil, err
	}
	return products, nil
}

func GetProductPrice(productName string) (uint, error) {
	var product Product
	err := db.Where("name = ?", productName).First(&product).Error
	if err != nil {
		log.Println("Cannot get product price: " + err.Error())
		return 0, err
	}
	return product.Price, nil
}

func GetOrder(username string) ([]Order, error) {
	var order []Order
	err := db.Where("username = ?", username).Find(&order).Error
	if err != nil {
		log.Println("Cannot get user order: " + err.Error())
		return nil, err
	}
	return order, nil
}

func AddOrder(username string, product string, number uint, status bool) error {
	err := db.Create(&Order{Username: username, Product: product, Number: number, Status: status}).Error
	if err != nil {
		log.Println("Cannot create order: " + err.Error())
		return err
	}
	return nil
}
