# Gets the weather for the specified city and returns the temperature and 
# weather condition

# just pass in the city name, or look at github.com/chubin/wttr.in 
# for a guide on what to pass in

curl -s "wttr.in/$1?m&format=j1" | jq '.current_condition[0] | .FeelsLikeC, .weatherDesc[0].value'