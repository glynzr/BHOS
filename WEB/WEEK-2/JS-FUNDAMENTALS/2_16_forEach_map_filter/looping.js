var pilots = [
    {
      id: 10,
      name: "Poe Dameron",
      years: 14,
    },
    {
      id: 2,
      name: "Temmin 'Snap' Wexley",
      years: 30,
    },
    {
      id: 41,
      name: "Tallissan Lintra",
      years: 16,
    },
    {
      id: 99,
      name: "Ello Asty",
      years: 22,
    }
  ];

// forEach function for looping
pilots.forEach(function(pilot){
    console.log(pilot.name);
});


// map function: creates new array from existing array
/*
const elem = pilots.map(function(pilot){
    return pilot.name;
})
console.log(elem);
*/

// filter function: takes element of array and applies some condition
/*
const filtered = pilots.filter(function(pilot){
    return pilot.years > 20;
})
//console.log(filtered);
filtered.forEach(function(elem){
    console.log(elem.id, elem.name);
})
*/

// combining map and filter functions together
/*
const res = pilots
  .filter(function(pilot){
      return pilot.years > 20;
  })
  .map(function(elem){
      return `${elem.name} , ${elem.years}`;
  })
console.log(res);
*/

// short version with arrow functions
/*
const res = pilots
  .filter( pilot => pilot.years > 20 )
  .map( elem => `${elem.name} , ${elem.years}`)
console.log(res);
*/