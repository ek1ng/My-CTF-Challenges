package config

import "github.com/pelletier/go-toml"

var Mysql struct {
	Host     string `toml:"host"`
	Port     int    `toml:"port"`
	Username string `toml:"username"`
	Password string `toml:"password"`
	Database string `toml:"database"`
}

var Secret struct {
	SessionSecret string `toml:"session_secret"`
	Flag          string `toml:"flag"`
}
var configFile = "config.toml"

func init() {
	conf, err := toml.LoadFile(configFile)
	if err != nil {
		panic("Failed to open config file")
	}
	if err := conf.Get("mysql").(*toml.Tree).Unmarshal(&Mysql); err != nil {
		panic("mapping [mysql] section")
	}

	if err = conf.Get("secret").(*toml.Tree).Unmarshal(&Secret); err != nil {
		panic("mapping [secret] section")
	}
}
