let countries = [
    {
        name: "Azerbaijan",
        population: 9100000000,
        cities: ['Baku', 'Sumgait', 'Sheki', 'Ganja', 'Shusha']
    },
    {
        name: "Turkey",
        population: 81000000000,
        cities: ['Istanbul', 'Ankara', 'Izmir', 'Bursa', 'Trabzon']
    },
    {
        name: "Uzbekistan",
        population: 2200000000,
        cities: ['Bukhara', 'Samarkant', 'Tashkent', 'Khiva', 'Andijan']
    },
    {
        name: "Pakistan",
        population: 5000000000,
        cities: ['Pishavar', 'Islamabad', 'Lahor', 'Karachi', 'Pheysalabad']
    }
  ];

// TASK-1
// forEach function for looping
/*
countries.forEach(function(country){
    console.warn(country.name);
    console.log(country.cities.length , 'cities');
    // for (x in country.cities){
    //     console.log(country.cities[x]);
    // }
    country.cities.forEach(function(city){
        console.log(city);
    })
});
*/

// TASK-2
// use map function to combine cities, which length equals to 5
const newcities = countries
    .map(function(country){
        return country.cities;
    })
    .flat()
    .filter(function(city){
        return city.length == 5;
    });
console.log(newcities);

// TASK-3
// apply arrow functions and try to minimize code as much as possible